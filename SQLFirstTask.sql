
--create table
CREATE TABLE Trainees (
Trainee_ID INT PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY int,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);

--Viewing table
select * from Trainees

--inserting records
insert into Trainees values(1,'Selva','Ganapathi',10000,23/01/2023,'Business')
insert into Trainees values(2,'Dhana','Prakash',15000,03/01/2023,'UI Developer')
insert into Trainees values(3,'Arun','Joseph',20000,23/01/2023,'AI Developer')
insert into Trainees values(4,'Venkit','Raman',25000,23/01/2023,'HR')
insert into Trainees values(5,'Vicky','vignesh',30000,23/01/2023,'Backend Developer')
insert into Trainees values(6,'Dhivya','Prakash',35000,23/01/2023,'Full stack developer')
insert into Trainees values(7,'Srikanth','Thanethalaivan',10000,23/01/2023,'Sales man')
insert into Trainees values(8,'Vikram','VijayKumar',40000,23/01/2023,'Automation')
insert into Trainees values(9,'Hari','Karthi',45000,23/01/2023,'Designer')
insert into Trainees values(10,'Vasanth','Kumar',50000,23/01/2023,'TT Player')
insert into Trainees values(11,'Sharon','David',55000,23/01/2023,'UX Designer')
insert into Trainees values(12,'Siva','Bharath',60000,23/01/2023,'Designer')
insert into Trainees values(13,'Karthik','Subburaj',65000,23/01/2023,'Developer')
insert into Trainees values(14,'Hemanth','Kothari',70000,23/01/2023,'HR')
insert into Trainees values(15,'Harsha','Vardhan',75000,23/01/2023,'Tester')
insert into Trainees values(16,'Selva','Raghavan',70000,23/01/2023,'Bussiness')
insert into Trainees values(17,'Rajini','Kanth',65000,23/01/2023,'Backend developer')
insert into Trainees values(18,'Sivaji','Ganesan',50000,23/01/2023,'AI Developer')
insert into Trainees values(19,'Under','Taker',55000,23/01/2023,'Sales Man')
insert into Trainees values(20,'Virumandi','Sandhanam',60000,23/01/2023,'Business')





--1. Retrieve all FIRST_NAME STARTING WITH J-T and should differentiate between Uppercase and lowercase.
select  FIRST_NAME FROM TRAINEES where FIRST_NAME like '[J-T]%' COLLATE LATIN1_GENERAL_CS_AS

--Retrieving all the salary between 20000 to 50000
select * from Trainees where SALARY between 20000 and 50000

--Retrieve all FIRST_NAME ending with i
select * from Trainees where FIRST_NAME like '%i' 

--Retrieve all salary without duplications
select DISTINCT SALARY from Trainees 

--Retrieve all records whose department is Developer and Designer
select * from Trainees where DEPARTMENT='Developer' or DEPARTMENT= 'Designer'

-- Retrieve all Trainee_ID less than 5
select * from Trainees where Trainee_ID<5

--7. Limit the records by retrieving the 6 to 15 records
select * from Trainees order by Trainee_ID OFFSET 5 rows Fetch next 10 rows only

--8. Retrieve the top 5 records with Ties
select top 5 with ties FIRST_NAME from Trainees order by FIRST_NAME 

--9. Retrieve the records in descending order based on department column.
select * from Trainees order by DEPARTMENT desc

--10. Retrieve all  last_name with 3rd character as 'a.'
select * from Trainees where LAST_NAME like '__a%'



