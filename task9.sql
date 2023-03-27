create database task9
use task9

--table creation
create table studentstable(
StudentID int identity(1,1) primary key,
StudentName varchar(20),
Semester varchar(20) ,
SecuredMarks decimal(5,2),
TotalMarks decimal(5,2)
)
insert into studentstable(StudentName,semester,securedmarks,totalmarks) values ('Srikanth','Sem 1',453,500)
insert into studentstable(StudentName,semester,securedmarks,totalmarks) values ('Arun Joseph','Sem 1',417,500)
insert into studentstable(StudentName,semester,securedmarks,totalmarks) values ('Dhana Prakash','Sem 1',445,500)
insert into studentstable(StudentName,semester,securedmarks,totalmarks) values ('Virumandi','Sem 1',385,500)
insert into studentstable(StudentName,semester,securedmarks,totalmarks) values ('Panneer Selvam','Sem 1',117,500)
insert into studentstable(StudentName,semester,securedmarks,totalmarks) values ('Edappadi Palanyswamy','Sem 3',10,500)
insert into studentstable(StudentName,semester,securedmarks,totalmarks) values ('Kick Buttowski','Sem 3',475,500)
insert into studentstable(StudentName,semester,securedmarks,totalmarks) values ('Katta Dhurai','Sem 3',467,500)

alter procedure sp_fetchrecord(@name varchar(10))
as
begin
if((select studentname from studentstable where studentname=@name)=@name)
print 'Valid student name '+@name
else
print 'Invalid name'
end


execute sp_fetchrecord 'srikanth'


--2. Write a Stored procedure in SQL to give remarks for the secured marks column in the students table (created in SQL Task 8) using CASE statement.
alter procedure sp_caserecord
as
begin 
select StudentId,StudentName,semester,securedmarks,totalmarks,
case 
when (securedmarks*100)/500>90 then 'Excellent'
when (securedmarks*100)/500>80 then 'Fantastic'
when (securedmarks*100)/500>70 then 'Good'
when (securedmarks*100)/500>50 then 'Average'
when (securedmarks*100)/500>30 then 'Below average'
else 'Very poor'
end as remarks
from studentstable
end

execute sp_caserecord

--3. Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)
declare @diff decimal(5,2)
set @diff = 448.00
print @diff

declare @@name varchar(20)
set @@name = 'Srikanth'
print @@name

declare @newname table(
studentID int,
studentmarks int
)
insert into
@newname values(1,450)

select * from  @newname


create procedure #tempsp 
as 
begin
print 'Hello world'
end
exec #tempsp












