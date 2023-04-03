create database task15
use task15

create table Students
(
sid int primary key,
sname varchar(25),
department varchar(15),
yearofcompletion int
)


insert into Students values 
(1,'Darshan','BCA',2023),
(2,'Srikanth','BCOM',2023),
(3,'Dhana','BSC',2023),
(4,'Selva','BSC',2022),
(5,'Vignesh','BCOM',2022),
(6,'Divya','BBA',2024),
(7,'Vikram','BCA',2025),
(8,'Ranita','BSC',2023),
(9,'Harita','BCA',2025),
(10,'Harishmitha','BCOM',2025),
(11,'Yamini','BCOM',2022),
(12,'Hari','BCOM',2023),
(13,'Vasanth','BBA',2024),
(14,'Karthi','BSC',2024),
(15,'Harshan','BCA',2023),
(16,'Siva','BSC',2022),
(17,'Hemanth','BBA',2024),
(18,'Sharon','BCOM',2024),
(19,'Arjun','BCOM',2022),
(20,'Arun','BCA',2023)

--1. Auto-commit and Auto-rollback transactions.
--inserting a for auto-commit
insert into Students values (21,'Thothathiri','MA',2020)

--auto-rollback transaction
insert into Students values (21,'Thothathiri','MA',2020)


--2. Implicit transactions
set implicit_transactions on;
update students set sname='Localloganathan' where sid=4

--3. Explicit transactions
--a. Only Commit - insert statement
set implicit_transactions off;
begin transaction
insert into students values(22,'Roman Reigns','MBA',2022)
commit tran

--b. Only Rollback - update statement
begin transaction
update students set sname='Undertaker' where sid=22
rollback tran
select * from students

--c. Savepoint - commit update and insert statements, rollback delete statement
begin tran
update students set sname='John Cena' where sid=20;
insert into students values(30,'Agent 47','B.Sc',2023)
commit tran
select * from students
begin transaction
Save transaction savep

select * from students
delete from students where sid=29
rollback tran savep
