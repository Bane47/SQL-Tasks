--creating a databse
create database secondb
use seconddb

--creating schema
create schema schema1

--creating a table
create table schema1.newtable(
ID int primary key,
name varchar(20) unique,
age int check(age>18),
department varchar default 'Computer science'
)

--renaming a schema
create schema schema3

alter schema schema3 transfer schema1.newtable

--renaming a table
exec sp_rename 'schema2.newtable','table2'

--renaming a database
exec sp_renamedb 'seconddb','drill2'

--creating a newtable
--name, salary, increment, computed column as Revised salary(sal+inc)
create table schema3.table1(
ID int identity(1,1),
name varchar(20) unique,
salary money,
increment money
)

--creating a computed column
alter table schema3.table1 add RevisedSalary as (salary+increment)

--inserting values into the table
insert into schema3.table1(name,salary,increment) values ('Srikanth',20000,1000)
insert into schema3.table1(name,salary,increment) values ('Darshan',25000,2000)
insert into schema3.table1(name,salary,increment) values ('Arun',30000,500)
insert into schema3.table1(name,salary,increment) values ('Dhana',35000,1500)
insert into schema3.table1(name,salary,increment) values ('Prakash',40000,2000)
insert into schema3.table1(name,salary,increment) values ('Selva',50000,2500)



--  b. Retrieve all the records whose salary is >20000 and move them into a new table using (SELECT INTO)
select * into schema3.newtable2 from schema3.table1 where salary>20000

select * from schema3.newtable2

