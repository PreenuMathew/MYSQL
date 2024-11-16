-- create database company
create database company;
-- use db company 
use company;
-- Create a table named Managers 
create table Managers(
Manager_Id int primary key,
First_name varchar(50)not null,
Last_name varchar(50) not null,
DOB date,
Age int ,
gender char(1) check (gender in ('M','F')),
department varchar(50),
Salary int not null check (salary >0));
desc Managers;
-- 1. Insert 10 rows.
Insert Into Managers values (10001,'Bob','Sam','1994-12-02',30,'M','IT',60000);
select * from Managers ;
Insert Into Managers values (10002,'Chris','John','1994-12-04',30,'M','Sales',65000),
(10003,'Teena','Sam','1995-12-02',29,'F','IT',70000),
(10004,'Gill','mathew','1994-12-02',30,'M','HR',80000),
(10005,'Virat','Kohli','1988-11-05',36,'M','Sales',90000),
(10006,'Rohit','Sharma','1988-12-06',36,'M','IT',60000),
(10007,'Sanju','Samson','1994-12-02',30,'M','HR',35000),
(10008,'Smrthi','Mandana','1994-06-02',30,'F','IT',25000),
(10009,'Sherlin','VS','1988-08-02',36,'F','Sales',10000),
(10010,'Renjitha','Sam','1980-12-02',44,'F','HR',70000),
(10011,'Shilpa','Shyamdas','1994-12-02',30,'F','IT',15000),
(10012,'Rekha','S','1990-01-02',34,'F','Sales',45000),
(10013,'Vikas','Moorthy','1991-06-02',33,'M','IT',30000),
(10014,'Vipin','Sam','1987-03-02',37,'M','HR',60000),
(10015,'Jojo','Kurian','1989-11-05',35,'M','IT',90000);
select * from Managers ;
-- 2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1.
select First_name,last_name,DOB from Managers where Manager_Id = 10001;
-- 3. Write a query to display the annual income of all managers. 
SELECT First_name, salary * 12 AS annual_income from Managers;
-- 4. Write a query to display records of all managers except ‘Virat’.
Select * from Managers where First_name != 'Virat';
-- 5. Write a query to display details of managers whose department is IT and earns more than 25000 per month. 
Select * from Managers where department = 'IT' And salary >25000;
-- 6. Write a query to display details of managers whose salary is between 10000 and 35000.
Select * from Managers where salary BETWEEN 10000 AND 35000;
