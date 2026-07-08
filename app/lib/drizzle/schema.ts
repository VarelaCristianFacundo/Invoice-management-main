import { pgTable, unique, uuid, varchar, index, foreignKey, text, integer, serial, check, numeric, date } from "drizzle-orm/pg-core"
import { sql } from "drizzle-orm"



export const areas = pgTable("areas", {
	id: uuid().default(sql`uuid_generate_v4()`).primaryKey().notNull(),
	name: varchar({ length: 255 }).notNull(),
}, (table) => [
	unique("areas_name_key").on(table.name),
]);

export const users = pgTable("users", {
	id: uuid().default(sql`uuid_generate_v4()`).primaryKey().notNull(),
	name: varchar({ length: 255 }).notNull(),
	email: text().notNull(),
	password: text().notNull(),
	role: varchar({ length: 100 }).default('usuario').notNull(),
	areaId: uuid("area_id"),
	username: varchar({ length: 100 }),
}, (table) => [
	index("idx_users_area_id").using("btree", table.areaId.asc().nullsLast().op("uuid_ops")),
	foreignKey({
			columns: [table.areaId],
			foreignColumns: [areas.id],
			name: "users_area_id_fkey"
		}),
	unique("users_email_key").on(table.email),
	unique("users_username_key").on(table.username),
]);

export const company = pgTable("company", {
	id: integer().primaryKey().notNull(),
	name: varchar({ length: 255 }).notNull(),
});

export const customers = pgTable("customers", {
	id: uuid().default(sql`uuid_generate_v4()`).primaryKey().notNull(),
	name: varchar({ length: 255 }).notNull(),
	email: varchar({ length: 255 }),
	imageUrl: varchar("image_url", { length: 255 }).default('/customers/default.png').notNull(),
	phone: varchar({ length: 50 }),
	cuitCuil: varchar("cuit_cuil", { length: 20 }),
	ivaCondition: varchar("iva_condition", { length: 40 }),
	cbuCvu: varchar("cbu_cvu", { length: 30 }),
	companyId: integer("company_id").references(() => company.id),
});

export const revenue = pgTable("revenue", {
	month: varchar({ length: 4 }).notNull(),
	revenue: integer().notNull(),
}, (table) => [
	unique("revenue_month_key").on(table.month),
]);

export const contableItems = pgTable("contable_items", {
	id: serial().primaryKey().notNull(),
	nombre: varchar({ length: 255 }).notNull(),
	codigo: varchar({ length: 50 }),
	descripcion: text(),
});

export const programs = pgTable("programs", {
	id: uuid().default(sql`gen_random_uuid()`).primaryKey().notNull(),
	name: text().notNull(),
}, (table) => [
	unique("programs_name_key").on(table.name),
]);

export const year = pgTable("year", {
	year: integer().notNull(),
});

export const budgets = pgTable("budgets", {
	id: uuid().default(sql`uuid_generate_v4()`).primaryKey().notNull(),
	projectName: varchar("project_name", { length: 255 }).notNull(),
	year: integer().notNull(),
	companyId: integer("company_id"),
	status: varchar({ length: 255 }).default('pending').notNull(),
}, (table) => [
	foreignKey({
			columns: [table.companyId],
			foreignColumns: [company.id],
			name: "budgets_company_id_fkey"
		}),
]);

export const budgetAllocations = pgTable("budget_allocations", {
	id: uuid().default(sql`uuid_generate_v4()`).primaryKey().notNull(),
	projectId: uuid("project_id"),
	areaId: uuid("area_id"),
	year: integer().notNull(),
	half: integer().notNull(),
	program: varchar({ length: 255 }),
	allocatedAmount: numeric("allocated_amount", { precision: 15, scale:  2 }).default('0').notNull(),
	executedAmount: numeric("executed_amount", { precision: 15, scale:  2 }).default('0').notNull(),
}, (table) => [
	foreignKey({
			columns: [table.areaId],
			foreignColumns: [areas.id],
			name: "budget_allocations_area_id_fkey"
		}),
	foreignKey({
			columns: [table.projectId],
			foreignColumns: [budgets.id],
			name: "budget_allocations_project_id_fkey"
		}),
	unique("budget_allocations_area_id_year_half_key").on(table.areaId, table.year, table.half),
	check("budget_allocations_half_check", sql`half = ANY (ARRAY[1, 2])`),
]);

export const areaFunds = pgTable("area_funds", {
	id: uuid().default(sql`uuid_generate_v4()`).primaryKey().notNull(),
	areaId: uuid("area_id").notNull(),
	allocatedFunds: numeric("allocated_funds", { precision: 15, scale:  2 }).default('0').notNull(),
	year: integer().notNull(),
	half: integer().notNull(),
}, (table) => [
	foreignKey({
			columns: [table.areaId],
			foreignColumns: [areas.id],
			name: "area_funds_area_id_fkey"
		}),
	unique("area_funds_area_id_year_half_key").on(table.areaId, table.year, table.half),
	check("area_funds_half_check", sql`half = ANY (ARRAY[1, 2])`),
]);

export const invoices = pgTable("invoices", {
	id: uuid().default(sql`uuid_generate_v4()`).primaryKey().notNull(),
	customerId: uuid("customer_id").notNull(),
	amount: numeric({ precision: 15, scale:  2 }).notNull(),
	status: varchar({ length: 50 }).notNull(),
	date: date().default(sql`CURRENT_DATE`).notNull(),
	year: integer(),
	areaId: uuid("area_id"),
	budgetAllocationId: uuid("budget_allocation_id"),
	file: text(),
	companyId: integer("company_id"),
	observations: text(),
	invoiceNumber: varchar("invoice_number", { length: 20 }),
	issueDate: date("issue_date"),
	contableItemId: integer("contable_item_id"),
}, (table) => [
	foreignKey({
			columns: [table.areaId],
			foreignColumns: [areas.id],
			name: "invoices_area_id_fkey"
		}),
	foreignKey({
			columns: [table.budgetAllocationId],
			foreignColumns: [budgetAllocations.id],
			name: "invoices_budget_allocation_id_fkey"
		}),
	foreignKey({
			columns: [table.companyId],
			foreignColumns: [company.id],
			name: "invoices_company_id_fkey"
		}),
	foreignKey({
			columns: [table.contableItemId],
			foreignColumns: [contableItems.id],
			name: "invoices_contable_item_id_fkey"
		}),
	foreignKey({
			columns: [table.customerId],
			foreignColumns: [customers.id],
			name: "invoices_customer_id_fkey"
		}),
	unique("invoices_invoice_number_key").on(table.invoiceNumber),
	check("invoices_status_check", sql`(status)::text = ANY ((ARRAY['presentado'::character varying, 'aprobado'::character varying, 'pagado'::character varying, 'rechazado'::character varying])::text[])`),
]);
