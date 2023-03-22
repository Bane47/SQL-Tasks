create database drill4

use drill4


CREATE TABLE Trainees (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

INSERT INTO Trainees
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(001, 'Srikanth', 'J', 670000, '2023-03-20', 'HR'),
(002, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2023-03-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-03-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-03-20', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2023-03-20', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2023-03-20', 'Admin');

select * from Trainees

select count(Trainee_ID) from Trainees

select department, count(FIRST_NAME) as EmpCount from Trainees group by Department

--Write an SQL query to calculate the estimated induction program day for the trainees from 5 days from JOINING_DATE.
select TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT , dateadd(day,5,joining_date) from Trainees

--Write an SQL query to retrieve the month in words from the Trainees table - JOINING_DATE Column.
select choose(month(Joining_DATE),'January','February','March','April','May','June','July','August','September','October','November','December') from Trainees

--Write an SQL query to perform the total and subtotal of salary in each department.
select department, sum(salary) as 'Total' from trainees
group by rollup (DEPARTMENT)

--Write an SQL query to retrieve first 3 records randomly
select top 3 * from trainees order by NEWID()
-- Show the working of composite key with any example.
create table table4(
NEW_ID int,
NEW_NAME varchar(10),
Contact int,
primary key(NEW_ID,CONTACT)  --here the composite key is the newID and the contact
)

-- Show the working of IIF and CASE for the above table.
select TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT, iif(67000 > salary, 'Srikanth is paid more','Srikanth is paid less') from Trainees
select 
case 
when salary>80000 then 'Salary is greater than 80K'
when salary<80000 then 'Salary is lesser than 80K'
else 'The salary is 80K!'
end as SalaryRange
From Trainees
-- Show the working of Sequence.
create sequence sq2
as int start with 1 increment by 1
 create table table3(
 Id int ,
 Ename varchar(20))
 insert into table3 values(next value for sq2,'Srikanth')

-- Show the working of creation of Synonym for a table in DB1 from DB2.
use drill2 --my database 1 name is drill2
create synonym NT for schema3.newtable1
use drill3 --my databse 2 name is drill3
create synonym Dept for dbo.dept

use drill3
create synonym NT3 for drill2.schema3.newtable2 
-- Show the working of IDENTITY_INSERT.
use Trainees

create table table2(
emp_id int identity(1,1),
EmpName varchar(10)
) 
insert into table2(EmpName) values('Vikram');
insert into table2(EmpName) values('Dhana');
insert into table2(EmpName) values('Srikanth');

set identity_insert table2 on
insert into table2(emp_id,EmpName) values(4,'Vijay');
insert into table2(emp_id,EmpName) values(5,'Ajith');
insert into table2(emp_id,EmpName) values(6,'Kamal');
select * from table2
