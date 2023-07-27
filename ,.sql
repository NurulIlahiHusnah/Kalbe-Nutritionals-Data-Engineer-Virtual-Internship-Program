-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.customer
(
    customer_id integer,
    name_customer character varying COLLATE pg_catalog."default",
    address character varying COLLATE pg_catalog."default",
    city character varying COLLATE pg_catalog."default",
    country character varying COLLATE pg_catalog."default",
    no_hp character varying COLLATE pg_catalog."default",
    status_order character varying COLLATE pg_catalog."default"
);

CREATE TABLE IF NOT EXISTS public.customer_orders
(
    order_no integer,
    purchase_amount integer,
    oreder_date date,
    customer_id integer,
    salesman_id integer
);

CREATE TABLE IF NOT EXISTS public.employee
(
    salesman_id integer,
    name_employ character varying COLLATE pg_catalog."default",
    job_title character varying COLLATE pg_catalog."default",
    department character varying COLLATE pg_catalog."default",
    start_date_work date,
    finish_date_work date
);

CREATE TABLE IF NOT EXISTS public.inventory
(
    item_code integer NOT NULL,
    item_name character varying COLLATE pg_catalog."default",
    item_price integer,
    item_total integer,
    CONSTRAINT inventory_pkey PRIMARY KEY (item_code)
);

CREATE TABLE IF NOT EXISTS public.orders
(
    order_id integer,
    order_no integer,
    salesman_id integer,
    shipping_limit_date timestamp without time zone,
    price integer,
    freight_value integer
);

CREATE TABLE IF NOT EXISTS public.sale
(
    sale_id integer NOT NULL,
    item_code integer,
    order_no integer,
    total_sale integer,
    salesman_id integer,
    customer_id character(1) COLLATE pg_catalog."default",
    CONSTRAINT sale_pkey PRIMARY KEY (sale_id)
);

ALTER TABLE IF EXISTS public.customer_orders
    ADD FOREIGN KEY (order_no)
    REFERENCES public.orders (order_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.sale
    ADD FOREIGN KEY (salesman_id)
    REFERENCES public.employee (salesman_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.sale
    ADD FOREIGN KEY (item_code)
    REFERENCES public.inventory (item_code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.sale
    ADD FOREIGN KEY (order_no)
    REFERENCES public.customer_orders (order_no) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.sale
    ADD FOREIGN KEY (customer_id)
    REFERENCES public.customer (customer_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;