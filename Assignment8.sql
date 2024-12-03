use region;
-- 1. Find the number of persons in each country.
SELECT country_name, COUNT(*) AS num_persons FROM persons GROUP BY country_name;
-- 2. Find the number of persons in each country sorted from high to low.
SELECT country_name , COUNT(*) AS num_persons FROM persons GROUP BY country_name ORDER BY num_persons DESC;
-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0
SELECT country_name, AVG(rating) AS average_rating FROM persons GROUP BY country_name HAVING average_rating > 3.0;
-- 4. Find the countries with the same rating as the USA. (Use Subqueries) 
SELECT country_name, AVG(rating) AS average_rating FROM persons GROUP BY country_name
HAVING AVG(rating) = ( SELECT AVG(rating) FROM persons WHERE country_name = 'USA');
-- 5. Select all countries whose population is greater than the average population of all nations
SELECT AVG(population) AS avg_population FROM country;
SELECT country_name, population FROM country WHERE population > (SELECT AVG(population) FROM country);
-- Create a database named Product and create a table called Customer 
CREATE DATABASE Product;
use Product;
-- Create table Customer--
CREATE TABLE Customer (
    Customer_Id INT AUTO_INCREMENT PRIMARY KEY,  
    First_name VARCHAR(50),                      
    Last_name VARCHAR(50),                       
    Email VARCHAR(100) UNIQUE,                   
    Phone_no VARCHAR(15),                        
    Address TEXT,                                
    City VARCHAR(50),                           
    State VARCHAR(50),                           
    Zip_code VARCHAR(20),                        
    Country VARCHAR(50)                         
);
INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St', 'New York', 'NY', '10001', 'USA'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA'),
('Robert', 'Johnson', 'robert.johnson@example.com', '1122334455', '789 Pine St', 'Chicago', 'IL', '60601', 'USA'),
('Emily', 'Davis', 'emily.davis@example.com', '2233445566', '101 Maple St', 'Houston', 'TX', '77001', 'USA'),
('Michael', 'Miller', 'michael.miller@example.com', '3344556677', '202 Birch St', 'Phoenix', 'AZ', '85001', 'USA'),
('Sarah', 'Wilson', 'sarah.wilson@example.com', '4455667788', '303 Cedar St', 'Philadelphia', 'PA', '19101', 'USA'),
('David', 'Moore', 'david.moore@example.com', '5566778899', '404 Redwood St', 'San Antonio', 'TX', '78201', 'USA'),
('Olivia', 'Taylor', 'olivia.taylor@example.com', '6677889900', '505 Cedar St', 'Dallas', 'TX', '75201', 'USA'),
('William', 'Anderson', 'william.anderson@example.com', '7788990011', '606 Maple St', 'San Diego', 'CA', '92101', 'USA'),
('Sophia', 'Thomas', 'sophia.thomas@example.com', '8899001122', '707 Oak St', 'Austin', 'TX', '73301', 'USA');
-- 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 
-- Then perform the SELECT operation for the customer_info view.
-- Create the view
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_Name, Email
FROM Customer;

-- Perform the SELECT operation on the view
SELECT * FROM customer_info;
-- 2. Create a view named US_Customers that displays customers located in the US. 
CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'USA';

-- Perform the SELECT ---
SELECT * FROM US_Customers;
-- 3. Create another view named Customer_details with columns full name
-- (Combine first_name and last_name), email, phone_no, and state. 
-- Create the Customer_details view
CREATE VIEW Customer_details AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_Name,
    Email,
    Phone_no,
    State
FROM Customer;

SELECT * FROM Customer_details;
-- 4. Update phone numbers of customers who live in California for Customer_details view.
UPDATE Customer
SET Phone_no = '8797674522'
WHERE State = 'CA';

SELECT * FROM Customer_details;
-- 5. Count the number of customers in each state and show only states with more than 3 customers.
SELECT State, COUNT(*) AS Customer_Count FROM Customer GROUP BY State HAVING COUNT(*) > 3;
--  6. Write a query that will return the number of customers in each state, 
-- based on the "state" column in the "customer_details" view.
SELECT State, COUNT(*) AS Customer_Count FROM customer_details GROUP BY State;
-- 7. Write a query that returns all the columns from the "customer_details" view,
-- sorted by the "state" column in ascending order
SELECT * FROM customer_details ORDER BY State ASC;








