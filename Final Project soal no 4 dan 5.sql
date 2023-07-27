-- tugas 4 
-- Create a database with ‘KALBE’ as the name.
create database KALBE;

-- Inside the database, create a table with the name ‘Inventory’, with columns Item_code, Item_name, Item_price, and 
-- Item_total. Choose its own best data type and the length of it according to best practice. Choose one unique 
-- column as a primary key and decide columns constraints. 

create table Inventory(
	item_code int,
	item_name varchar,
	item_price int,
	item_total int	
);

insert into Inventory 
	values 
		(2341, 'Progmag Tablet', 3000, 100)
		(2342, 'Hydro Coco 250ML', 7000, 20),
		(2343, 'Nutrive Benecol 100ML', 20000, 30),
		(2344, 'Blackmores Vit C 500Mg', 95000, 45),
		(2345, 'Entrasol Gold 370G', 90000, 120);
		
alter table Inventory add Primary key (item_code);

-- Show Item_name that has the highest number in Item_total.
select item_name 
from Inventory 
order by item_total desc;

-- Update the Item_price of the output of question bullet

update Inventory
	set item_price = 115000
	where item_code = 2345;


-- What will happen if we insert another Item_name with Item_code of 2343 into the table? 
 insert into Inventory(item_code, item_name) values(2343, 'Another');
-- jawaban : akan terjadi erorr karena item_code merupakan primary key (unik)

-- Delete the Item_name that has the lowest number of Item_total.
delete from inventory 
where item_total =
	(select min(item_total)
from Inventory);

-- Tugas 5 

-- Create a Query to display all customer orders where purchase amount is less than 100 or exclude those 
-- orders which order date is on or greater than 25 Aug 2022 and customer id is above 2001. 
create table customer_orders(
	order_no int,
	purchase_amount int,
	oreder_date date,
	customer_id int,
	salesman_id int
);

insert into customer_orders values
	(10001,150,'2022-10-05',2005,3002),
	(10009,270,'2022-09-10',2001,3005),
	(10002,65,'2022-10-05',2002,3001),
	(10004,110,'2022-08-17',2009,3003),
	(10007,948,'2022-09-10',2005,3002),
	(10005,2400,'2022-07-27',2007,3001);

-- Answer 5
select * from
customer_orders
where (purchase_amount <100)
or (oreder_date < '2022-08-25' and customer_id <=2001 )

