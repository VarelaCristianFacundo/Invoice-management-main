// This file contains type definitions for your data.
// It describes the shape of the data, and what data type each property should accept.
// For simplicity of teaching, we're manually defining these types.
// However, these types are generated automatically if you're using an ORM such as Prisma.

// Roles disponibles en el sistema
export type UserRole = 
  | 'admin'                    // Director Ejecutivo - acceso total
  | 'usuario'                  // Superuser Común - facturas de cualquier área
  | 'usuario_administracion'   // Usuario área Administración
  | 'usuario_contable'         // Usuario área Contable
  | 'usuario_logistica'        // Usuario área Logística
  | 'usuario_marketing'        // Usuario área Marketing
  | 'usuario_produccion'       // Usuario área Producción
  | 'usuario_rrhh'             // Usuario área Recursos Humanos
  | 'usuario_sistemas'         // Usuario área Sistemas
  | 'usuario_ventas'           // Usuario área Ventas
  | 'tesorero'                 // Tesorero (legacy)
  | 'usuario_presupuestos';    // Usuario Presupuestos (legacy)

export type User = {
  id: string;
  name: string;
  email: string;
  password: string;
  role: UserRole;
  area_id?: string | null; // ID del área asignada (solo para usuarios de área)
};

export type Customer = {
  id: string;
  name: string;
  email: string;
  image_url: string;
  phone?: string;
  iva_condition: string;
};

export type Invoice = {
  file: any;
  project_name: any;
  program: any;
  area_name: any;
  name: string;
  image_url: string;
  id: string;
  customer_id: string;
  amount: number;
  observations: string;
  date: string;
  // In TypeScript, this is called a string union type.
  // It means that the "status" property can only be one of the two strings: 'pending' or 'paid'.
  status: 'presentado' | 'aprobado' | 'pagado' | 'rechazado';
};

export type Revenue = {
  month: string;
  revenue: number;
};

export type LatestInvoice = {
  id: string;
  name: string;
  image_url: string;
  email: string;
  amount: string;
};

// The database returns a number for amount, but we later format it to a string with the formatCurrency function
export type LatestInvoiceRaw = Omit<LatestInvoice, 'amount'> & {
  amount: number;
};

export type InvoicesTable = {
  year: any;
  area_name: any;
  project_name: any;
  pdf_url: string | undefined;
  id: string;
  customer_id: string;
  name: string;
  email: string;
  image_url: string;
  date: string;
  amount: number;
  status: 'pending' | 'paid';
};

export type CustomersTableType = {
  id: string;
  name: string;
  email: string;
  image_url: string;
  phone?: string;
  iva_condition: string;
  total_invoices: number;
  total_pending: number;
  total_paid: number;
};

export type FormattedCustomersTable = {
  id: string;
  name: string;
  email: string;
  image_url: string;
  total_invoices: number;
  total_pending: string;
  total_paid: string;
};

export type CustomerField = {
  id: string;
  name: string;
  cuit_cuil: string;
  company_id: number; // Ahora se incluye la compañía (1 o 2)
};

export type InvoiceForm = {
  contable_item:
    | { id: number; nombre: string; codigo?: string }
    | null;
  file: string | null;
  id: string;
  customer_id: string;
  amount: number;
  status: 'pending' | 'paid' | string;
  observations: string | null;
  invoice_number: string | null;
  issue_date: string | null;
  contable_item_id: string | number | null;
  contable_item_nombre?: string | null;
  contable_item_codigo?: string | null;
  company_id?: number;
};

export type CustomerForm = {
  id: string;
  name: string;
  email: string;
  cuit_cuil: string;
  cbu_cvu: string;
  image_url: string;
  phone?: string;
  iva_condition: string;
  company_id: number;
};

export interface BudgetForm {
  id: string; // << si deseas la propiedad 'id'
  amount: string | number | readonly string[] | undefined;
  status: string;
  budget_id: string;
  year: number;
  project_name: string;
  program?: string;
  allocated_amount?: number;
  executed_amount?: number;
  area_id?: string;
  area_name?: string;
}

export interface Area {
  id: number;
  name: string;
}

export interface AreaFund {
  id: number;
  area_id: number;
  allocated_funds: number;
}

export type AreaType = {
  id: string;
  name: string;
};
