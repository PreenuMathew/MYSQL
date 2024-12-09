use company;
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,            
    FirstName CHAR(25),                    
    LastName CHAR(25),                     
    Salary decimal(10,2),                        
    JoiningDate DATETIME,                  
    Department CHAR(25)                    
);
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
VALUES
(1, 'John', 'Doe', 50000, '2022-01-15 08:00:00', 'HR'),
(2, 'Jane', 'Smith', 55000, '2021-06-22 09:00:00', 'Finance'),
(3, 'Robert', 'Johnson', 60000, '2020-03-11 10:00:00', 'IT'),
(4, 'Emily', 'Davis', 48000, '2023-07-05 08:30:00', 'Marketing'),
(5, 'Michael', 'Miller', 70000, '2019-11-20 09:15:00', 'Finance'),
(6, 'Sarah', 'Wilson', 53000, '2022-08-25 10:00:00', 'IT'),
(7, 'David', 'Moore', 65000, '2021-05-30 08:45:00', 'HR'),
(8, 'Jessica', 'Taylor', 57000, '2020-12-12 11:00:00', 'Operations'),
(9, 'William', 'Anderson', 75000, '2021-04-03 08:00:00', 'Sales'),
(10, 'Sophia', 'Thomas', 62000, '2022-02-15 09:30:00', 'Marketing');
-- 1. Create a stored procedure that takes in IN parameters for all the columns in the Worker 
-- table and adds a new record to the table and then invokes the procedure call.
DELIMITER //

CREATE PROCEDURE AddNewWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    -- Insert the new worker record into the Worker table
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //

DELIMITER ;
CALL AddNewWorker(11, 'Alice', 'Brown', 62000, '2024-12-05', 'IT');
SELECT * FROM WORKER;
-- 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter.
-- Then make the procedure call. 
DELIMITER //

CREATE PROCEDURE GetSalaryById(
    IN p_Worker_Id INT,        
    OUT p_Salary decimal(10,2)           
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;
-- set a variable to store the retrieved salary
set @v_Salary = 0;

-- Calling the procedure with Worker_Id 1
CALL GetSalaryById(1, @v_Salary);

-- Output the result---
SELECT @v_Salary AS WorkerSalary;
--  3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. 
-- It should update the department of the worker with the given ID.
DELIMITER $$

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_worker_Id INT, 
    IN p_department VARCHAR(50)
)
BEGIN
    -- Update the department for the worker with the given worker_id
    UPDATE worker
    SET department = p_department
    WHERE worker_id = p_worker_id;
    
    -- check if the worker exists
    IF ROW_COUNT() = 0 THEN
        SELECT 'Worker not found' AS message;
    ELSE
        SELECT 'Department updated successfully' AS message;
    END IF;
END $$

DELIMITER ;
CALL UpdateWorkerDepartment(11, 'HR');
Select * from Worker;
--- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the 
-- given department and returns it in the p_workerCount parameter. Make procedure call.
DELIMITER $$

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_department VARCHAR(50), 
    OUT p_workerCount INT
)
BEGIN
    
    SELECT COUNT(*) 
    INTO p_workerCount
    FROM worker
    WHERE department = p_department;
END $$

DELIMITER ;

-- output value
SET @worker_Count = 0;

-- Call the stored procedure
CALL GetWorkerCountByDepartment('HR', @worker_Count);

-- result
SELECT @worker_Count AS 'Number of Workers in HR';
--  5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department
-- and returns it in the p_avgSalary parameter and call the procedure.
DELIMITER $$

CREATE PROCEDURE GetAvgSalaryByDepartment(
    IN p_department VARCHAR(50), 
    OUT p_avgSalary DECIMAL(10, 2)
)
BEGIN
    SELECT AVG(salary) 
    INTO p_avgSalary
    FROM worker
    WHERE department = p_department;
END $$

DELIMITER ;
-- output value
SET @avg_Salary = 0;

-- Call the stored procedure 
CALL GetAvgSalaryByDepartment('HR', @avg_Salary);

-- result
SELECT @avg_Salary AS 'Average Salary in HR';




 



