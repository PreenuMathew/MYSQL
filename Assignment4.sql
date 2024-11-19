-- create database Region
create database Region;
use Region ;
-- . Create a table named Country with fields: Id Country_name Population Area 
Create table country(
Country_ID int primary key auto_increment,
Country_Name varchar(50),
Population int,
Area Varchar(50));
desc country;
Create table Persons(
Person_id int primary key auto_increment,
First_name varchar(50),
Last_name varchar(50),
Population int ,
Rating decimal (10,2),
Country_id int,
FOREIGN KEY (Country_ID) REFERENCES country(Country_ID),
Country_name varchar(50));
desc Persons ;
insert into country values (1,'China',15000000,'9596skm');
select * from country ;
insert into country values (2,'India',14000000,'3287skm'),
(3,'USA',18000000,'9525skm'),
(4,'UK',12000000,'9586skm'),
(5,'Brazil',10000000,'9896skm'),
(6,'Indonesia',5000000,'7596skm'),
(7,'Pakistan',14000000,'8996skm'),
(8,'Nigeria',11000000,'9596skm'),
(9,'Russia',17000000,'9996skm'),
(10,'Bangladesh',1500000,'996skm'),
(11,'Mexico',1000000,'6596skm'),
(12,'Japan',16000000,'9596skm'),
(13,'Ethiopia',12000000,'9546skm'),
(14,'Philippines',9000000,'6596skm'),
(15,'Egypt',8000000,'9566skm'),
(16,'Vietnam',4000000,'596skm');
insert into Persons values (10,'John','Smith',18000000,'4.08',3,'USA');
insert into Persons values (11,'Isabella','Scott',17000000,'3.08',9,'Russia'),
(12,'Sophia','Smith',5000000,'4.12',10,'Bangladesh'),
(13,'Daniel','Clark',17000000,'5.00',9,'Russia'),
(14,'Clivia','Harris',4000000,'3.28',4,'UK'),
(15,'Robert','Thomas',1000000,'4.08',13,'Ethiopia'),
(16,'Laura','Anderson',5000000,'5.08',12,'Japan'),
(17,'James','Taylor',18000000,'3.27',2,'India'),
(18,'Jessica','Martinez',18000000,'4.08',3,'USA'),
(19,'David','Lee',1000000,'4.08',2,'India'),
(20,'Sarah','Williams',18000000,'4.08',14,'Philippines'),
(21,'Michael','Brown',8000000,'3.08',1,'China'),
(22,'Emily','Johnson',4000000,'3.08',4,'UK');
Select * from persons;
-- (1)List the distinct country names from the Persons table 
SELECT DISTINCT Country_Name from persons;
-- (2)Select first names and last names from the Persons table with aliases.
SELECT First_Name AS 'First Name', Last_Name AS 'Last Name'
FROM Persons;
-- (3)Find all persons with a rating greater than 4.0.
SELECT First_Name, Last_Name FROM Persons WHERE Rating > 4.0;
-- (4)Find countries with a population greater than 10 lakhs.
SELECT Country_name, Population FROM country WHERE Population > 1000000;
-- (5)Find persons who are from 'USA' or have a rating greater than 4.5. 
SELECT * FROM Persons WHERE Country_name = 'USA' OR Rating > 4.5;
-- (6)Find all persons where the country name is NULL.
SELECT * FROM Persons WHERE Country_name  IS NULL;
-- (7)Find all persons from the countries 'USA', 'Canada', and 'UK'.
SELECT * FROM Persons WHERE Country_name IN ('USA', 'Canada', 'UK');
-- (8)Find all persons not from the countries 'India' and 'USA'.
SELECT * FROM Persons WHERE Country_name NOT IN ('India', 'USA');
-- (9)Find all countries with a population between 5 lakhs and 20 lakhs.
SELECT Country_name, Population FROM Country WHERE Population BETWEEN 500000 AND 2000000;
-- (10)Find all countries whose names do not start with 'C'.
SELECT Country_name FROM Country WHERE Country_name NOT LIKE 'C%';