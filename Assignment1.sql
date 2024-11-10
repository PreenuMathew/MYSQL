#creating database named school
create database School;
Use  School ;
create table Student(
Roll_No int primary key ,
Student_Name varchar (50) ,
Marks int,
Grade char(1)); 
desc Student;
#adding new column 
alter table Student add column Contact_No varchar(25) ;
#Removing grade column from student
alter table student drop column Grade;
#Rename student table to Classten
rename table student to ClassTen ;
#Delete All Row from classTen
truncate table ClassTen ;
desc ClassTen; 
#removing table from database
Drop table ClassTen ;
desc ClassTen ;

