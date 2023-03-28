create database task10
use task10

--creating a table
--Create a table for employees (EMPLOYEE_ID | FIRST_NAME | LAST_NAME | EMAIL | PHONE_NUMBER | HIRE_DATE |
--JOB_ID | SALARY) with 20 records (Include 20 trainees in our training session)

create table employees(
EMPLOYEE_ID int,
First_Name varchar(20),
Last_Name varchar(20),
Email varchar(50),
Phone_Number bigint,
Hire_Date date,
Job_ID int,
Salary money
)

insert into employees values(1,'Srikanth','J','Srikanth@gmail.com',9876543210,'2020-02-20',100,40000)
insert into employees values(2,'Selva','Ganapathi','Selva@gmail.com',8765432109,'2021-04-01',101,30000)
insert into employees values(3,'Dhana','Prakash','Dhana@gmail.com',7654321098,'2020-09-05',103,40000)
insert into employees values(4,'Arun','Joseph','Arun@gmail.com',6543210789,'2019-07-27',104,30000)
insert into employees values(5,'Arjun','Venkitraman','Arjun@gmail.com',9876543210,'2022-08-24',105,100000)
insert into employees values(6,'Vignesh','R','Vignesh@gmail.com',5432109876,'2020-02-20',106,60000)
insert into employees values(7,'Dhivya','Prakash','Dhivya@gmail.com',9876543210,'2021-04-01',107,70000)
insert into employees values(8,'Ranita','Maarthandam','Ranita@gmail.com',9876543210,'2020-09-05',108,80000)
insert into employees values(9,'Yamini','Priya','Yamini@gmail.com',9218765430,'2019-07-27',109,90000)
insert into employees values(10,'Harishmitha','Virumandi','Harishmitha@gmail.com',9873216540,'2022-08-24',110,100000)
insert into employees values(11,'Harrita','Arukkani','Harrita@gmail.com',9837654210,'2020-02-20',111,90000)
insert into employees values(12,'Vikram','Versatile','Vikram@gmail.com',9832107654,'2021-04-01',112,80000)
insert into employees values(13,'Vasanth','Andco','Vasanth@gmail.com',9765453210,'2020-09-05',113,70000)
insert into employees values(14,'Hari','Karthi','Hari@gmail.com',9832176540,'2019-07-27',114,60000)
insert into employees values(15,'Sharon','David','Sharon@gmail.com',9765483210,'2022-08-24',115,50000)
insert into employees values(16,'Siva','Bharath','Siva@gmail.com',8765493210,'2020-02-20',116,40000)
insert into employees values(17,'Karthik','V','Karthik@gmail.com',9821076543,'2021-04-01',117,30000)
insert into employees values(18,'Hemanth','Kothari','Hemanth@gmail.com',6598743210,'2020-09-05',118,35000)
insert into employees values(19,'Harshan','Kumar','Harshan@gmail.com',9871654320,'2019-07-27',119,60000)
insert into employees values(20,'Priyadarshan','Manoharan','Priyadarshan@gmail.com',8300287044,'2022-08-24',120,1000)


--1. Write a SQL query to find those employees who receive a higher salary than the employee with ID 16. Return first name, last name.


select First_Name,Last_Name,Salary from employees where salary>(select salary from employees where EMPLOYEE_ID=16)


--2. Write a SQL query to find out which employees have the same HIRE_DATE as the employee whose ID is 11. Return first name, last name, job ID.
select first_name,Last_name,Hire_Date from employees where hire_date=(select Hire_Date from employees where EMPLOYEE_ID=11)


--3. Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.
select first_name,last_name from (select avg(salary) as a from employees) as s,employees e where e.salary>s.a

--4. Write a SQL query to find those employees who report to that manager whose first name is ‘’Yamini". Return first name, last name, employee ID and salary.
select * from employees where first_name = (select first_name from employees where first_name='Yamini')

--5. Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields.
select * from employees where salary between (select min(salary) from employees) and 2500










/*create table manage
(
Job_ID int primary key,
first_name varchar(20),
Last_name varchar(20),
Employee varchar(20)
)


insert into manage values(100,'Yamini','Priya','Srikanth')
insert into manage values(101,'Dhana','Prakash','Selva')
insert into manage values(102,'Arjun','Venkitraman','Vikram')
insert into manage values(103,'Vasanth','Andco','Hari')
insert into manage values(104,'Harshan','Kumar','Harrita')
insert into manage values(105,'Arun','Joseph','Ranita')

select * from manage

drop table manage*/





