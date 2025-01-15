CREATE TABLE IF NOT EXISTS public.invoices
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    customer_id uuid NOT NULL,
    amount integer NOT NULL,
    status character varying(255) COLLATE pg_catalog."default" NOT NULL,
    date date NOT NULL,
    year numeric,
    budget_allocation_id uuid,
    area_id uuid,
    file text COLLATE pg_catalog."default",
    company_id integer,
    CONSTRAINT invoices_pkey PRIMARY KEY (id),
    CONSTRAINT invoices_company_id_fk FOREIGN KEY (company_id)
        REFERENCES public.company (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT invoices_customer_id_fkey FOREIGN KEY (customer_id)
        REFERENCES public.customers (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.invoices
    OWNER to postgres;



CREATE TABLE IF NOT EXISTS public.company
(
    name character varying(255) COLLATE pg_catalog."default",
    id integer NOT NULL,
    CONSTRAINT "Company_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.company
    OWNER to postgres;


--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2025-01-15 00:27:09

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4832 (class 0 OID 28220)
-- Dependencies: 232
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (name, id) FROM stdin;
FODECO	1
CAMARCO	2
\.


-- Completed on 2025-01-15 00:27:09

--
-- PostgreSQL database dump complete
--

