import { relations } from "drizzle-orm/relations";
import { areas, users, company, budgets, budgetAllocations, areaFunds, invoices, contableItems, customers } from "./schema";

export const usersRelations = relations(users, ({one}) => ({
	area: one(areas, {
		fields: [users.areaId],
		references: [areas.id]
	}),
}));

export const areasRelations = relations(areas, ({many}) => ({
	users: many(users),
	budgetAllocations: many(budgetAllocations),
	areaFunds: many(areaFunds),
	invoices: many(invoices),
}));

export const budgetsRelations = relations(budgets, ({one, many}) => ({
	company: one(company, {
		fields: [budgets.companyId],
		references: [company.id]
	}),
	budgetAllocations: many(budgetAllocations),
}));

export const companyRelations = relations(company, ({many}) => ({
	budgets: many(budgets),
	invoices: many(invoices),
	customers: many(customers),
}));

export const budgetAllocationsRelations = relations(budgetAllocations, ({one, many}) => ({
	area: one(areas, {
		fields: [budgetAllocations.areaId],
		references: [areas.id]
	}),
	budget: one(budgets, {
		fields: [budgetAllocations.projectId],
		references: [budgets.id]
	}),
	invoices: many(invoices),
}));

export const areaFundsRelations = relations(areaFunds, ({one}) => ({
	area: one(areas, {
		fields: [areaFunds.areaId],
		references: [areas.id]
	}),
}));

export const invoicesRelations = relations(invoices, ({one}) => ({
	area: one(areas, {
		fields: [invoices.areaId],
		references: [areas.id]
	}),
	budgetAllocation: one(budgetAllocations, {
		fields: [invoices.budgetAllocationId],
		references: [budgetAllocations.id]
	}),
	company: one(company, {
		fields: [invoices.companyId],
		references: [company.id]
	}),
	contableItem: one(contableItems, {
		fields: [invoices.contableItemId],
		references: [contableItems.id]
	}),
	customer: one(customers, {
		fields: [invoices.customerId],
		references: [customers.id]
	}),
}));

export const contableItemsRelations = relations(contableItems, ({many}) => ({
	invoices: many(invoices),
}));

export const customersRelations = relations(customers, ({one, many}) => ({
	invoices: many(invoices),
	company: one(company, {
		fields: [customers.companyId],
		references: [company.id]
	}),
}));