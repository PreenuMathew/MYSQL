use region;
-- 1. Write an SQL query to print the first three characters of Country_name from the Country table.
SELECT SUBSTRING(Country_name, 1, 3) AS First_Three_Characters
FROM Country;
-- 2. Write an SQL query to concatenate first name and last name from Persons table. 
SELECT CONCAT(first_name, ' ', last_name) AS Full_Name FROM Persons;
--  3. Write an SQL query to count the number of unique country names from Persons table.
SELECT COUNT(DISTINCT country_Name) AS Unique_Count FROM Persons;
-- 4. Write a query to print the maximum population from the Country table.
SELECT max(Population) AS maximum_population from country;
-- 5. Write a query to print the minimum population from Persons table.
SELECT min(population) AS minimum_population from persons ;
-- 6. Insert 2 new rows to the Persons table making the Lname NULL. 
insert into Persons values (25,'clara',null,4000000,'3.08',4,'UK'),
(26,'Mathew',null,200000,'1.8',2,'India');
select * from persons;
-- Then write another query to count Lname from Persons table.
SELECT COUNT(Last_name) AS count_of_lastname FROM Persons;
--  7. Write a query to find the number of rows in the Persons table. 
SELECT COUNT(*) AS Total_Rows FROM Persons;
-- 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
SELECT population from country limit 3;
-- 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT
SELECT * from country order by rand() limit 3;
-- 10. List all persons ordered by their rating in descending order. 
SELECT * from persons order by rating desc ;
-- 11. Find the total population for each country in the Persons table. 
select country_name, sum(population) as total_population from persons group by country_name ;
-- 12. Find countries in the Persons table with a total population greater than 50,000 
SELECT country_name, SUM(population) AS total_population FROM Persons GROUP BY country_name
 HAVING SUM(population) > 50000;
 -- 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, 
 -- ordered by the average rating in ascending order.
 SELECT country_name, COUNT(*) AS total_persons, AVG(rating) AS average_rating
FROM Persons
GROUP BY country_name
HAVING COUNT(*) > 2
ORDER BY average_rating ASC;
