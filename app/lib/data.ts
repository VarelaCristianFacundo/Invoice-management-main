import { NextResponse } from 'next/server';
import { Pool } from 'pg';
import ExcelJS from 'exceljs';
import {
  and,
  asc,
  count,
  countDistinct,
  desc,
  eq,
  ilike,
  or,
  sql,
  sum,
} from 'drizzle-orm';
import {
  AreaFund,
  AreaType,
  CustomerField,
  CustomerForm,
  CustomersTableType,
  Invoice,
  Revenue,
  User,
} from './definitions';
import { formatCurrency } from './utils';
import { drizzleDb } from './drizzle/db';
import {
  areaFunds,
  areas,
  budgetAllocations,
  budgets,
  company,
  contableItems,
  customers,
  invoices,
  programs,
  revenue,
  users,
  year,
} from './drizzle/schema';

export async function fetchRevenue(): Promise<Revenue[]> {
  return drizzleDb.select().from(revenue);
}

export async function fetchLatestInvoices() {
  const rows = await drizzleDb
    .select({
      id: invoices.id,
      amount: invoices.amount,
      name: customers.name,
      image_url: customers.imageUrl,
      email: customers.email,
    })
    .from(invoices)
    .innerJoin(customers, eq(invoices.customerId, customers.id))
    .orderBy(desc(invoices.date))
    .limit(5);

  return rows.map((row) => ({
    ...row,
    amount: formatCurrency(Number(row.amount)),
  }));
}

export async function fetchCardData(filters?: {
  status?: string;
  year?: string;
  company?: string;
  areaId?: string | null;
}) {
  const conditions = [];
  if (filters?.status && filters.status !== 'all') {
    conditions.push(eq(invoices.status, filters.status));
  }
  if (filters?.year && filters.year !== 'all') {
    conditions.push(eq(invoices.year, parseInt(filters.year)));
  }
  if (filters?.company && filters.company !== 'all') {
    conditions.push(eq(invoices.companyId, parseInt(filters.company)));
  }
  if (filters?.areaId) {
    conditions.push(eq(invoices.areaId, filters.areaId));
  }
  const where = conditions.length ? and(...conditions) : undefined;

  const [stats] = await drizzleDb
    .select({
      countPaid: sql<string>`COUNT(*) FILTER (WHERE ${invoices.status} = 'pagado')`,
      countApproved: sql<string>`COUNT(*) FILTER (WHERE ${invoices.status} = 'aprobado')`,
      countPending: sql<string>`COUNT(*) FILTER (WHERE ${invoices.status} = 'presentado')`,
      totalInvoices: sql<string>`COUNT(*)`,
      sumPaid: sql<string>`COALESCE(SUM(CASE WHEN ${invoices.status} = 'pagado' THEN ${invoices.amount} END), 0)`,
      sumApproved: sql<string>`COALESCE(SUM(CASE WHEN ${invoices.status} = 'aprobado' THEN ${invoices.amount} END), 0)`,
      sumPending: sql<string>`COALESCE(SUM(CASE WHEN ${invoices.status} = 'presentado' THEN ${invoices.amount} END), 0)`,
    })
    .from(invoices)
    .where(where);

  const [{ count: numberOfCustomers }] = await drizzleDb
    .select({ count: sql<number>`COUNT(*)::int` })
    .from(customers);

  return {
    numberOfCustomers,
    numberOfInvoices: Number(stats.totalInvoices),

    countPaid: Number(stats.countPaid),
    sumPaid: formatCurrency(Number(stats.sumPaid)),

    countApproved: Number(stats.countApproved),
    sumApproved: formatCurrency(Number(stats.sumApproved)),

    countPending: Number(stats.countPending),
    sumPending: formatCurrency(Number(stats.sumPending)),
  };
}

const ITEMS_PER_PAGE = 6;
export async function fetchFilteredInvoices(
  query: string,
  currentPage: number,
  areaId?: string | null,
): Promise<Invoice[]> {
  const PAGE_SIZE = 10;
  const offset = (currentPage - 1) * PAGE_SIZE;
  const term = `%${query}%`;

  const conditions = [
    or(
      ilike(customers.name, term),
      sql`${invoices.amount}::text ILIKE ${term}`,
      ilike(invoices.status, term),
      ilike(budgets.projectName, term),
      ilike(areas.name, term),
    ),
  ];
  if (areaId) {
    conditions.push(eq(invoices.areaId, areaId));
  }

  const rows = await drizzleDb
    .select({
      id: invoices.id,
      customer_id: invoices.customerId,
      amount: invoices.amount,
      status: invoices.status,
      date: invoices.date,
      budget_allocation_id: invoices.budgetAllocationId,
      file: invoices.file,
      customer_name: customers.name,
      customer_email: customers.email,
      image_url: customers.imageUrl,
      allocation_year: budgetAllocations.year,
      program: budgetAllocations.program,
      area_name: areas.name,
      project_name: budgets.projectName,
    })
    .from(invoices)
    .leftJoin(customers, eq(invoices.customerId, customers.id))
    .leftJoin(
      budgetAllocations,
      eq(invoices.budgetAllocationId, budgetAllocations.id),
    )
    .leftJoin(areas, eq(budgetAllocations.areaId, areas.id))
    .leftJoin(budgets, eq(budgetAllocations.projectId, budgets.id))
    .where(and(...conditions))
    .orderBy(desc(invoices.date))
    .limit(PAGE_SIZE)
    .offset(offset);

  return rows.map((r) => ({
    id: r.id,
    customer_id: r.customer_id,
    name: r.customer_name,
    email: r.customer_email,
    image_url: r.image_url || '/default-user.png',
    amount: Number(r.amount) || 0,
    status: r.status,
    date: r.date,
    budget_allocation_id: r.budget_allocation_id,
    project_name: r.project_name,
    area_name: r.area_name,
    year: r.allocation_year,
    file: r.file,
    program: r.program,
    observations: undefined,
  })) as unknown as Invoice[];
}

export async function getFileBase64ByInvoiceId(
  _pool: Pool,
  invoiceId: string,
): Promise<string> {
  const rows = await drizzleDb
    .select({ file: invoices.file })
    .from(invoices)
    .where(eq(invoices.id, invoiceId))
    .limit(1);
  if (rows.length === 0) {
    throw new Error(`No invoice found with id: ${invoiceId}`);
  }
  return rows[0].file ?? '';
}

export async function fetchInvoicesPages(query: string, areaId?: string | null) {
  const term = `%${query}%`;
  const conditions = [
    or(
      ilike(customers.name, term),
      ilike(customers.email, term),
      sql`${invoices.amount}::text ILIKE ${term}`,
      sql`${invoices.date}::text ILIKE ${term}`,
      ilike(invoices.status, term),
      ilike(budgets.projectName, term),
      ilike(areas.name, term),
    ),
  ];
  if (areaId) {
    conditions.push(eq(invoices.areaId, areaId));
  }

  const [{ total }] = await drizzleDb
    .select({ total: count() })
    .from(invoices)
    .innerJoin(customers, eq(invoices.customerId, customers.id))
    .leftJoin(
      budgetAllocations,
      eq(invoices.budgetAllocationId, budgetAllocations.id),
    )
    .leftJoin(areas, eq(budgetAllocations.areaId, areas.id))
    .leftJoin(budgets, eq(budgetAllocations.projectId, budgets.id))
    .where(and(...conditions));

  return Math.ceil(Number(total) / ITEMS_PER_PAGE);
}

export async function fetchInvoiceById(id: string) {
  const rows = await drizzleDb
    .select({
      id: invoices.id,
      customer_id: invoices.customerId,
      amount: invoices.amount,
      status: invoices.status,
      invoice_number: invoices.invoiceNumber,
      issue_date: invoices.issueDate,
      contable_item_id: invoices.contableItemId,
      contable_item_nombre: contableItems.nombre,
      contable_item_codigo: contableItems.codigo,
      observations: invoices.observations,
      file: invoices.file,
    })
    .from(invoices)
    .leftJoin(contableItems, eq(invoices.contableItemId, contableItems.id))
    .where(eq(invoices.id, id));
  const row = rows[0];

  return {
    ...row,
    contable_item:
      row.contable_item_id && row.contable_item_nombre
        ? {
            id: row.contable_item_id,
            nombre: row.contable_item_nombre,
            codigo: row.contable_item_codigo,
          }
        : null,
  };
}

export async function fetchCustomers(): Promise<CustomerField[]> {
  const rows = await drizzleDb
    .select({
      id: customers.id,
      name: customers.name,
      cuit_cuil: customers.cuitCuil,
      company_id: customers.companyId,
    })
    .from(customers)
    .orderBy(asc(customers.name));
  return rows as CustomerField[];
}

export async function fetchAreas(): Promise<AreaType[]> {
  return drizzleDb
    .select({ id: areas.id, name: areas.name })
    .from(areas)
    .orderBy(asc(areas.name));
}

export async function fetchAreaFunds(): Promise<AreaFund[]> {
  const rows = await drizzleDb
    .select({
      id: areaFunds.id,
      area_id: areaFunds.areaId,
      allocated_funds: areaFunds.allocatedFunds,
      year: areaFunds.year,
      half: areaFunds.half,
      area_name: areas.name,
    })
    .from(areaFunds)
    .innerJoin(areas, eq(areaFunds.areaId, areas.id))
    .orderBy(asc(areas.name));
  return rows as unknown as AreaFund[];
}

export async function updateAreaFund(
  area_id: number,
  amount: number,
): Promise<void> {
  await drizzleDb
    .insert(areaFunds)
    .values({
      areaId: String(area_id),
      allocatedFunds: String(amount),
    } as any)
    .onConflictDoUpdate({
      target: areaFunds.areaId,
      set: { allocatedFunds: String(amount) },
    });
}

export async function fetchFilteredCustomers(
  query: string,
  currentPage: number,
) {
  const offset = (currentPage - 1) * ITEMS_PER_PAGE;
  const term = `%${query}%`;

  const sq = drizzleDb
    .select({
      id: customers.id,
      name: customers.name,
      email: customers.email,
      image_url: customers.imageUrl,
      phone: customers.phone,
      iva_condition: customers.ivaCondition,
      total_invoices: count(invoices.id).as('total_invoices'),
      total_pending: sql<string>`SUM(CASE WHEN ${invoices.status} = 'pending' THEN ${invoices.amount} ELSE 0 END)`.as('total_pending'),
      total_paid: sql<string>`SUM(CASE WHEN ${invoices.status} = 'paid' THEN ${invoices.amount} ELSE 0 END)`.as('total_paid'),
    })
    .from(customers)
    .leftJoin(invoices, eq(customers.id, invoices.customerId))
    .groupBy(
      customers.id,
      customers.name,
      customers.email,
      customers.imageUrl,
      customers.phone,
      customers.ivaCondition,
    )
    .as('subquery');

  const rows = await drizzleDb
    .select()
    .from(sq)
    .where(
      or(
        ilike(sq.name, term),
        ilike(sq.email, term),
        sql`${sq.total_invoices}::text ILIKE ${term}`,
      ),
    )
    .orderBy(asc(sq.name))
    .limit(ITEMS_PER_PAGE)
    .offset(offset);

  return rows as unknown as CustomersTableType[];
}

export async function fetchCustomersPages(query: string) {
  const term = `%${query}%`;
  const [{ total }] = await drizzleDb
    .select({ total: count() })
    .from(customers)
    .where(or(ilike(customers.name, term), ilike(customers.email, term)));
  return Math.ceil(Number(total) / ITEMS_PER_PAGE);
}

export async function fetchCustomerById(id: string) {
  const rows = await drizzleDb
    .select({
      id: customers.id,
      name: customers.name,
      email: customers.email,
      image_url: customers.imageUrl,
      cuit_cuil: customers.cuitCuil,
      cbu_cvu: customers.cbuCvu,
      phone: customers.phone,
      iva_condition: customers.ivaCondition,
      company_id: customers.companyId,
    })
    .from(customers)
    .where(eq(customers.id, id))
    .limit(1);
  return rows[0] as unknown as CustomerForm;
}

export async function fetchBudgetsPages(query: string, areaId?: string | null): Promise<number> {
  let qb = drizzleDb
    .select({ total: countDistinct(budgets.id) })
    .from(budgets)
    .$dynamic();

  const conditions = [ilike(budgets.projectName, `%${query}%`)];

  if (areaId) {
    qb = qb.innerJoin(
      budgetAllocations,
      eq(budgets.id, budgetAllocations.projectId),
    );
    conditions.push(eq(budgetAllocations.areaId, areaId));
  }

  const [{ total }] = await qb.where(and(...conditions));
  return Math.ceil(Number(total) / 10);
}

export async function fetchAreasWithFunds() {
  return drizzleDb
    .select({
      id: areas.id,
      name: areas.name,
      allocated_funds: areaFunds.allocatedFunds,
    })
    .from(areas)
    .leftJoin(areaFunds, eq(areas.id, areaFunds.areaId))
    .orderBy(asc(areas.name));
}
export async function fetchFilteredBudgets(query: string, currentPage: number) {
  const offset = (currentPage - 1) * 10;
  const term = `%${query}%`;

  return drizzleDb
    .select({
      id: budgets.id,
      project_name: budgets.projectName,
      year: budgets.year,
      program: budgetAllocations.program,
      total_allocated_amount: sum(budgetAllocations.allocatedAmount),
      total_executed_amount: sum(budgetAllocations.executedAmount),
      area_names: sql<string>`STRING_AGG(${areas.name}, ', ')`,
    })
    .from(budgets)
    .leftJoin(budgetAllocations, eq(budgets.id, budgetAllocations.projectId))
    .leftJoin(areas, eq(budgetAllocations.areaId, areas.id))
    .where(
      or(
        ilike(budgets.projectName, term),
        sql`${budgets.year}::text ILIKE ${term}`,
      ),
    )
    .groupBy(budgets.id, budgetAllocations.program)
    .orderBy(desc(budgets.year))
    .limit(10)
    .offset(offset);
}

export async function getAreaFunds(areaId: string) {
  const rows = await drizzleDb
    .select({ allocated_funds: areaFunds.allocatedFunds })
    .from(areaFunds)
    .where(eq(areaFunds.areaId, areaId))
    .limit(1);
  return rows[0]?.allocated_funds || 0;
}
export async function fetchBudgetById(id: string) {
  const rows = await drizzleDb
    .select({
      id: budgets.id,
      budget_id: budgets.id,
      year: budgets.year,
      project_name: budgets.projectName,
      status: budgets.status,
      program: budgetAllocations.program,
      allocated_amount: budgetAllocations.allocatedAmount,
      executed_amount: budgetAllocations.executedAmount,
      area_id: budgetAllocations.areaId,
      area_name: areas.name,
    })
    .from(budgets)
    .leftJoin(budgetAllocations, eq(budgets.id, budgetAllocations.projectId))
    .leftJoin(areas, eq(budgetAllocations.areaId, areas.id))
    .where(eq(budgets.id, id))
    .limit(1);

  if (rows.length === 0) {
    return null;
  }

  const row = rows[0];

  return {
    ...row,
    amount: row.executed_amount ?? 0,
    status: row.status ?? 'pending',
  };
}

export async function fetchRejectedBudgets() {
  return drizzleDb.select().from(budgets);
}

export async function fetchCustomersData() {
  const rows = await drizzleDb
    .select({
      id: customers.id,
      name: customers.name,
      email: customers.email,
      image_url: customers.imageUrl,
      total_invoices: count(invoices.id),
      total_pending: sql<string>`SUM(CASE WHEN ${invoices.status} = 'pending' THEN ${invoices.amount} ELSE 0 END)`,
      total_paid: sql<string>`SUM(CASE WHEN ${invoices.status} = 'paid' THEN ${invoices.amount} ELSE 0 END)`,
    })
    .from(customers)
    .leftJoin(invoices, eq(customers.id, invoices.customerId))
    .groupBy(customers.id, customers.name, customers.email, customers.imageUrl)
    .orderBy(asc(customers.name));

  return rows.map((customer) => ({
    ...customer,
    total_pending: formatCurrency(Number(customer.total_pending)),
    total_paid: formatCurrency(Number(customer.total_paid)),
  }));
}

export async function getUser(email: string) {
  const rows = await drizzleDb
    .select()
    .from(users)
    .where(eq(users.email, email))
    .limit(1);
  return rows[0] as User | undefined;
}

export async function getAllYears(): Promise<number[]> {
  const rows = await drizzleDb.select({ year: year.year }).from(year);
  return rows.map((row) => row.year);
}

export async function fetchPrograms(): Promise<{ id: string; name: string }[]> {
  return drizzleDb
    .select({ id: programs.id, name: programs.name })
    .from(programs)
    .orderBy(asc(programs.name));
}

export async function sumBudgetAllocationsByAreaYearHalf(): Promise<
  {
    area_id: string;
    area_name: string;
    year: number;
    half: number;
    executed_funds: number;
    allocated_funds: number;
  }[]
> {
  const rows = await drizzleDb
    .select({
      area_id: budgetAllocations.areaId,
      area_name: areas.name,
      year: budgetAllocations.year,
      half: budgetAllocations.half,
      executed_funds: sum(budgetAllocations.executedAmount),
      allocated_funds: sum(budgetAllocations.allocatedAmount),
    })
    .from(budgetAllocations)
    .innerJoin(areas, eq(budgetAllocations.areaId, areas.id))
    .groupBy(
      budgetAllocations.areaId,
      areas.name,
      budgetAllocations.year,
      budgetAllocations.half,
    );

  if (rows.length === 0) {
    throw new Error('No se encontraron asignaciones de presupuesto');
  }

  return rows.map((row) => ({
    area_id: row.area_id as string,
    area_name: row.area_name,
    year: row.year,
    half: row.half,
    executed_funds: Number(row.executed_funds ?? 0),
    allocated_funds: Number(row.allocated_funds ?? 0),
  }));
}

export async function fetchBudgetsByCompany(
  companyId: number,
  query: string,
  currentPage: number,
) {
  const offset = (currentPage - 1) * 10;
  const term = `%${query}%`;

  return drizzleDb
    .select({
      id: budgets.id,
      project_name: budgets.projectName,
      year: budgets.year,
      company_id: budgets.companyId,
      total_allocated_amount: sql<string>`COALESCE(SUM(${budgetAllocations.allocatedAmount}), 0)`,
      total_executed_amount: sql<string>`COALESCE(SUM(${budgetAllocations.executedAmount}), 0)`,
      area_names: sql<string>`STRING_AGG(DISTINCT ${areas.name}, ', ')`,
    })
    .from(budgets)
    .leftJoin(budgetAllocations, eq(budgets.id, budgetAllocations.projectId))
    .leftJoin(areas, eq(budgetAllocations.areaId, areas.id))
    .where(
      and(
        eq(budgets.companyId, companyId),
        or(
          ilike(budgets.projectName, term),
          sql`${budgets.year}::text ILIKE ${term}`,
        ),
      ),
    )
    .groupBy(budgets.id)
    .orderBy(desc(budgets.year))
    .limit(10)
    .offset(offset);
}

export async function generateExcelReport(areaId?: string | null): Promise<NextResponse> {
  try {
    const rows = await drizzleDb
      .select({
        id: invoices.id,
        Proveedor: customers.name,
        Monto: invoices.amount,
        Estado: invoices.status,
        Fecha: invoices.date,
        'Año': invoices.year,
        Semestre: budgetAllocations.half,
        Area: areas.name,
        Cliente: company.name,
        Programa: budgetAllocations.program,
        Proyecto: budgets.projectName,
      })
      .from(invoices)
      .leftJoin(customers, eq(invoices.customerId, customers.id))
      .leftJoin(company, eq(invoices.companyId, company.id))
      .leftJoin(
        budgetAllocations,
        eq(invoices.budgetAllocationId, budgetAllocations.id),
      )
      .leftJoin(budgets, eq(budgetAllocations.projectId, budgets.id))
      .leftJoin(areas, eq(invoices.areaId, areas.id))
      .where(areaId ? eq(invoices.areaId, areaId) : undefined);

    const workbook = new ExcelJS.Workbook();
    const worksheet = workbook.addWorksheet('Report');

    if (rows.length > 0) {
      worksheet.columns = Object.keys(rows[0]).map((key) => ({
        header: key,
        key,
      }));
      worksheet.addRows(rows);
    }

    const buffer = await workbook.xlsx.writeBuffer();

    return new NextResponse(buffer, {
      headers: {
        'Content-Disposition': 'attachment; filename=report.xlsx',
        'Content-Type':
          'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
      },
    });
  } catch (error) {
    console.error('Error generating Excel report:', error);
    return new NextResponse('Error al generar el reporte de Excel', {
      status: 500,
    });
  }
}
