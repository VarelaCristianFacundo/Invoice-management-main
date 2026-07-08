ALTER TABLE "users" ADD COLUMN "username" varchar(100);--> statement-breakpoint
ALTER TABLE "users" ADD CONSTRAINT "users_username_key" UNIQUE("username");