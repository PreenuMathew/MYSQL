## creating database sales
create database Sales;
use Sales;
## Creating table to the database named Orders
Create table Orders(Order_Id int primary key unique , 
Customer_name varchar(50), 
Product_Category varchar(50), 
Ordered_item varchar(50), 
Contact_No varchar(20) not null );
desc Orders;
--  1. Add a new column named “order_quantity” to the orders table
alter table Orders add column order_quantity int ;
-- 2. Rename the orders table to the sales_orders table.
rename table Orders to sales_orders;
-- 3. Insert 10 rows into the sales_orders table. 
Insert into sales_orders values (100,'Sunny waynne','furniture','chair','+918899234510',10);
select * from sales_orders;
Insert into sales_orders values 
(101,'Nikhila Vimal','furniture','table','+918899234512',5),
(102,'Nazriya Nazim','electronics','laptop','+918899234534',2),
(103,'Mohan lal','electronics','mobile','+918899234232',5),
(104,'Sarath Vs','furniture','table','+918899234519',10),
(105,'Shone Nair','furniture','fan','+918899234562',8),
(106,'Arya Vimal','Electronics','tablet','+918899234572',4),
(107,'karthika Devi','elictronics','computer','+918899254512',6),
(108,'Aryan Varma','furniture','dining table','+918899234412',8),
(109,'Nimisha ravi','furniture','chair','+918899233512',15),
(110,'kallyani menon','furniture','table','+918899234234',9),
(111,'Mamooty kk','electronics','mobile','+919879136519',5);
select * from sales_orders;
-- 4. Retrieve customer_name and Ordered_Item from the sales_orders table.
Select customer_name,Ordered_Item from sales_orders ;
-- 5. Use the update command to change the name of the product for any row
update sales_orders set Ordered_Item = 'laptop' where order_Id = 111;
Select * from sales_orders ;
-- 6. Delete the sales_orders table from the database.
truncate sales_orders ;

