CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
--> statement-breakpoint
CREATE TABLE "area_funds" (
	"id" uuid PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
	"area_id" uuid NOT NULL,
	"allocated_funds" numeric(15, 2) DEFAULT '0' NOT NULL,
	"year" integer NOT NULL,
	"half" integer NOT NULL,
	CONSTRAINT "area_funds_area_id_year_half_key" UNIQUE("area_id","year","half"),
	CONSTRAINT "area_funds_half_check" CHECK (half = ANY (ARRAY[1, 2]))
);
--> statement-breakpoint
CREATE TABLE "areas" (
	"id" uuid PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT "areas_name_key" UNIQUE("name")
);
--> statement-breakpoint
CREATE TABLE "budget_allocations" (
	"id" uuid PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
	"project_id" uuid,
	"area_id" uuid,
	"year" integer NOT NULL,
	"half" integer NOT NULL,
	"program" varchar(255),
	"allocated_amount" numeric(15, 2) DEFAULT '0' NOT NULL,
	"executed_amount" numeric(15, 2) DEFAULT '0' NOT NULL,
	CONSTRAINT "budget_allocations_area_id_year_half_key" UNIQUE("area_id","year","half"),
	CONSTRAINT "budget_allocations_half_check" CHECK (half = ANY (ARRAY[1, 2]))
);
--> statement-breakpoint
CREATE TABLE "budgets" (
	"id" uuid PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
	"project_name" varchar(255) NOT NULL,
	"year" integer NOT NULL,
	"company_id" integer,
	"status" varchar(255) DEFAULT 'pending' NOT NULL
);
--> statement-breakpoint
CREATE TABLE "company" (
	"id" integer PRIMARY KEY NOT NULL,
	"name" varchar(255) NOT NULL
);
--> statement-breakpoint
CREATE TABLE "contable_items" (
	"id" serial PRIMARY KEY NOT NULL,
	"nombre" varchar(255) NOT NULL,
	"codigo" varchar(50),
	"descripcion" text
);
--> statement-breakpoint
CREATE TABLE "customers" (
	"id" uuid PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
	"name" varchar(255) NOT NULL,
	"email" varchar(255),
	"image_url" varchar(255) DEFAULT '/customers/default.png' NOT NULL,
	"phone" varchar(50),
	"cuit_cuil" varchar(20),
	"iva_condition" varchar(10),
	"cbu_cvu" varchar(30),
	"company_id" integer
);
--> statement-breakpoint
CREATE TABLE "invoices" (
	"id" uuid PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
	"customer_id" uuid NOT NULL,
	"amount" numeric(15, 2) NOT NULL,
	"status" varchar(50) NOT NULL,
	"date" date DEFAULT CURRENT_DATE NOT NULL,
	"year" integer,
	"area_id" uuid,
	"budget_allocation_id" uuid,
	"file" text,
	"company_id" integer,
	"observations" text,
	"invoice_number" varchar(20),
	"issue_date" date,
	"contable_item_id" integer,
	CONSTRAINT "invoices_invoice_number_key" UNIQUE("invoice_number"),
	CONSTRAINT "invoices_status_check" CHECK ((status)::text = ANY ((ARRAY['presentado'::character varying, 'aprobado'::character varying, 'pagado'::character varying, 'rechazado'::character varying])::text[]))
);
--> statement-breakpoint
CREATE TABLE "programs" (
	"id" uuid PRIMARY KEY DEFAULT gen_random_uuid() NOT NULL,
	"name" text NOT NULL
);
--> statement-breakpoint
CREATE TABLE "revenue" (
	"month" varchar(4) NOT NULL,
	"revenue" integer NOT NULL,
	CONSTRAINT "revenue_month_key" UNIQUE("month")
);
--> statement-breakpoint
CREATE TABLE "users" (
	"id" uuid PRIMARY KEY DEFAULT uuid_generate_v4() NOT NULL,
	"name" varchar(255) NOT NULL,
	"email" text NOT NULL,
	"password" text NOT NULL,
	"role" varchar(100) DEFAULT 'usuario' NOT NULL,
	"area_id" uuid,
	CONSTRAINT "users_email_key" UNIQUE("email")
);
--> statement-breakpoint
CREATE TABLE "year" (
	"year" integer NOT NULL
);
--> statement-breakpoint
ALTER TABLE "area_funds" ADD CONSTRAINT "area_funds_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "public"."areas"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "budget_allocations" ADD CONSTRAINT "budget_allocations_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "public"."areas"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "budget_allocations" ADD CONSTRAINT "budget_allocations_project_id_fkey" FOREIGN KEY ("project_id") REFERENCES "public"."budgets"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "budgets" ADD CONSTRAINT "budgets_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."company"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "customers" ADD CONSTRAINT "customers_company_id_company_id_fk" FOREIGN KEY ("company_id") REFERENCES "public"."company"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "invoices" ADD CONSTRAINT "invoices_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "public"."areas"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "invoices" ADD CONSTRAINT "invoices_budget_allocation_id_fkey" FOREIGN KEY ("budget_allocation_id") REFERENCES "public"."budget_allocations"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "invoices" ADD CONSTRAINT "invoices_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."company"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "invoices" ADD CONSTRAINT "invoices_contable_item_id_fkey" FOREIGN KEY ("contable_item_id") REFERENCES "public"."contable_items"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "invoices" ADD CONSTRAINT "invoices_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "users" ADD CONSTRAINT "users_area_id_fkey" FOREIGN KEY ("area_id") REFERENCES "public"."areas"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "idx_users_area_id" ON "users" USING btree ("area_id" uuid_ops);