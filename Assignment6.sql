use region;
-- (1)Perform inner join, Left join, and Right join on the tables
-- inner join
SELECT Persons.First_name, Country.country_name
FROM Persons
INNER JOIN Country ON Persons.country_id = Country.country_id;
-- left join
SELECT Persons.First_name, Persons.last_name, Country.country_name
FROM Persons
LEFT JOIN Country ON Persons.country_id = Country.country_id;
-- right join
SELECT Persons.First_name, Country.country_name
FROM Persons
RIGHT JOIN Country ON Persons.country_id = Country.country_id;
-- (2)List all distinct country names from both the Country and Persons tables. 
SELECT country_name FROM Country
UNION
SELECT DISTINCT c.country_name FROM Persons p
JOIN Country c ON p.country_id = c.country_id;
-- (3)List all country names from both the Country and Persons tables, including duplicates.
SELECT country_name FROM Country
UNION ALL
SELECT c.country_name FROM Persons p
JOIN Country c ON p.country_id = c.country_id;
-- (4)Round the ratings of all persons to the nearest integer in the Persons table.
SELECT person_id, first_name,last_name , ROUND(rating) AS rounded_of_rating FROM Persons;