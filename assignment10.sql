use school_db;
-- 1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows. 
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(100),
    experience INT,
    salary DECIMAL(10, 2)
);
-- Inserting 8 rows into the teachers table
INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'John Doe', 'Mathematics', 5, 50000),
(2, 'Jane Smith', 'Science', 8, 55000),
(3, 'Emily Davis', 'English', 3, 40000),
(4, 'Michael Brown', 'History', 12, 60000),
(5, 'Linda Wilson', 'Art', 15, 70000),
(6, 'David Lee', 'Physics', 6, 52000),
(7, 'Sarah Clark', 'Geography', 4, 45000),
(8, 'Robert Harris', 'Chemistry', 7, 47000);
-- 2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” 
-- if the salary inserted to the table is less than zero.

DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END$$

DELIMITER ;
INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(9, 'Jacob M', 'Mathematics', 5, .7);
--  3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, 
-- timestamp -> time at which the new row has got inserted
CREATE TABLE teacher_log (
    teacher_id INT NOT NULL,
    action VARCHAR(50) NOT NULL,
    timestamp DATETIME NOT NULL,
    PRIMARY KEY (teacher_id, timestamp)
);
delimiter &&
CREATE TRIGGER after_insert_teacher
AFTER INSERT
ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (teacher_id, 'INSERT', NOW());
END &&
Delimiter ;
INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(11, 'Mathew', 'Physics', 5, 70000);
select * from teacher_log;
--  4. Create a before delete trigger that will raise an error when you try to delete 
-- a row that has experience greater than 10 years.
delimiter // 
CREATE TRIGGER before_delete_teacher
BEFORE DELETE
ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete teacher with more than 10 years of experience';
    END IF;
END//
delimiter ;
select * from teachers;
delete from teachers where id = 5;
-- 5. Create an after delete trigger that will insert a row to teacher_log table 
-- when that row is deleted from teacher table
delimiter %%
CREATE TRIGGER after_delete_teacher
AFTER DELETE
ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (teacher_id, 'DELETE', NOW());
END %%
delimiter ;
delete from teachers where id = 9;
select * from teacher_log;





-- 