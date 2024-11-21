use region;
--  1. Add a new column called DOB in Persons table with data type as Date. 
ALTER TABLE Persons ADD COLUMN DOB DATE;
UPDATE Persons
SET DOB = '1992-01-20'  
WHERE person_id = 12;
select * from persons;
--   2. Write a user-defined function to calculate age using DOB.
DELIMITER $$

CREATE FUNCTION CalculateAge(DOB DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    RETURN age;
END $$
-- 3. Write a select query to fetch the Age of all persons using the function that has been created.
SELECT person_id, first_name, DOB, CalculateAge(DOB) AS age
FROM Persons;
-- 4. Find the length of each country name in the Country table.
DELIMITER //
CREATE FUNCTION CountryNameLength(country_name varchar(50))
returns int
deterministic
Begin
return length(country_name);
end // 
delimiter ;
SELECT country_name, CountryNameLength(country_name) AS country_name_length
FROM Country;
-- 5. Extract the first three characters of each country's name in the Country table. 
SELECT country_name, SUBSTRING(country_name, 1, 3) AS first_three_characters
FROM Country;
-- 6. Convert all country names to uppercase and lowercase in the Country table.
SELECT country_name, UPPER(country_name) AS uppercase_country, LOWER(country_name) AS lowercase_country
FROM Country;
-- for upper casse
DELIMITER $$

CREATE FUNCTION ToUpperCase(country_name VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN UPPER(country_name);
END $$

DELIMITER ;
-- for lowercase
DELIMITER $$

CREATE FUNCTION ToLowerCase(country_name VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN LOWER(country_name);
END $$

DELIMITER ;
SELECT country_name,
       ToUpperCase(country_name) AS uppercase_country,
       ToLowerCase(country_name) AS lowercase_country
FROM Country;


