-- Tabel Fact 
create table Sale (
	sale_id int primary key not null,
	item_code int,
	order_no int,
	total_sale int,
	salesman_id int,
	
	customer_id char
)

-- Tabel Dimension
create table Employee (
	salesman_id int,
	name_employ varchar,
	job_title varchar,
	department varchar,
	start_date_work date,
	finish_date_work date
)


create table Customer (
	customer_id int,
	name_customer varchar,
	address varchar,
	city varchar,
	country varchar,
	no_hp varchar,
	status_order varchar
)

create table orders(
	order_id int,
	order_no int,
	salesman_id int,
	shipping_limit_date timestamp,
	price int,
	freight_value int
)

select * from inventory;
select * from customer_orders;