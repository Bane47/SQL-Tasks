--create a new database drill3
create database drill3

use drill3

--creating a table
create table Employee  (
ID int primary key,
EName varchar unique,
Designation varchar(20),
DeptID int references Department(DeptID),
Mobile1 int,
Mobile2 int,
Street_Address varchar(30),
AddressID int references address(AddressID),


)

select * from Employee

--create a child table
create table Department(
DeptID int primary key,
DeptName varchar(10)
)
select * from department
--creating a child table
create table address(
AddressID int primary key,
City varchar(10),
State varchar(10),
pincode varchar(10)

)
select *from address;
--inserting values into Department table
insert into Department values (100,'Developer');
insert into Department values (101,'UI/UX');

--inserting values into address table
insert into address values(1,'Mannford','Oklahoma',74044)
insert into address values(2,'Sidney','Ohio(OH)',45365)


--inserting values into employee
insert into Employee values(1,'JOHN','Developer',100,9894511629,9867747488,'234 Hinton Rd',1);
insert into Employee values(2,'Jamie','Designer',101,9875644629,9866789488,'214 Doorley Rd',2);
insert into Employee values(3,'Jack','Developer',100,9567811629,9898765488,'236 Hinton Rd',1);

--altering the datatypes and sizes
alter table employee alter column EName varchar(10);
alter table employee alter column Mobile1 decimal;
alter table employee alter column Mobile2 decimal;

select * from Employee
