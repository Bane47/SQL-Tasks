--creating a database 
create database task8
use task8

--create table
--Create a table with studentid, studentname, semester, securedmarks, totalmarks
create table table1(
StudentID int identity(1,1) primary key,
StudentName varchar(20),
Semester int ,
SecuredMarks int,
TotalMarks int
)
alter table table1 alter column semester varchar(10)
insert into table1(StudentName,semester,securedmarks,totalmarks) values ('Srikanth','Sem 1',453,500)
insert into table1(StudentName,semester,securedmarks,totalmarks) values ('Arun Joseph','Sem 1',417,500)
insert into table1(StudentName,semester,securedmarks,totalmarks) values ('Dhana Prakash','Sem 1',445,500)
insert into table1(StudentName,semester,securedmarks,totalmarks) values ('Virumandi','Sem 1',385,500)
insert into table1(StudentName,semester,securedmarks,totalmarks) values ('Panneer Selvam','Sem 1',117,500)
insert into table1(StudentName,semester,securedmarks,totalmarks) values ('Edappadi Palanyswamy','Sem 3',10,500)
insert into table1(StudentName,semester,securedmarks,totalmarks) values ('Kick Buttowski','Sem 3',475,500)
insert into table1(StudentName,semester,securedmarks,totalmarks) values ('Katta Dhurai','Sem 3',467,500)

select * from table1
--Creating a scalar function
create function fn_percent(@securedmarks int,@totalmarks int)
returns decimal(5,2)
as 
begin
declare @percentage decimal(5,2)
set @percentage= cast((@securedmarks*100)/@totalmarks as decimal(5,2))
return @percentage
end

select dbo.fn_percent(345,500)

--2. Create user-defined function to generate a table that contains result of Sem 3 students.
create function fn_sem3(@semester varchar(10))
returns table
as 

return select * from table1 where semester=@semester

select * from fn_sem3('sem 3')

--3. Write SQL stored procedure to retrieve all students details. (No parameters)
create procedure sp_details
as
begin
select * from table1
end
exec sp_details

--4. Write SQL store procedure to display Sem 1 students details. (One parameter)
create procedure sp_sem1(@sem1 varchar(10))
as 
begin
select * from table1 where semester= @sem1
end
exec sp_sem1 @sem1='Sem 1'

--5. Write SQL Stored Procedure to retrieve total number of students details. (OUTPUT Parameter)

create procedure sp_procedure(@totalnum int output)
as 
begin
select @totalnum = count(studentID) from table1
end
declare @totalNumStudents int
 
exec sp_procedure @totalNumStudents output

print ('The Total number of students is '+convert(varchar(5),@totalNumStudents))
go

--6. Show the working of Merge Statement by creating a backup for the students details of only students in Sem 1.
--Note: Update few values in students details so that you can see the working of UPDATE.

create table table1backup
(
StudentID int identity(1,1) primary key,
StudentName varchar(20),
Semester varchar(10) ,
SecuredMarks int,
TotalMarks int
)

insert into table1backup(StudentName,semester,securedmarks,totalmarks) values ('Srikanth','Sem 1',453,500)
insert into table1backup(StudentName,semester,securedmarks,totalmarks) values ('Arun Joseph','Sem 1',417,500)
insert into table1backup(StudentName,semester,securedmarks,totalmarks) values ('Dhana Prakash','Sem 1',445,500)
insert into table1backup(StudentName,semester,securedmarks,totalmarks) values ('Virumandi','Sem 1',385,500)
insert into table1backup(StudentName,semester,securedmarks,totalmarks) values ('Panneer Selvam','Sem 1',117,500)
insert into table1backup(StudentName,semester,securedmarks,totalmarks) values ('Edappadi Palanyswamy','Sem 3',10,500)
insert into table1backup(StudentName,semester,securedmarks,totalmarks) values ('Kick Buttowski','Sem 3',475,500)
insert into table1backup(StudentName,semester,securedmarks,totalmarks) values ('Katta Dhurai','Sem 3',467,500)



update table1 set StudentName='Harshan' where StudentID=1

select * from table1
select * from table1backup

merge table1backup t using table1 s
on t.studentId=s.studentid
when matched 
then update set t.studentname = s.studentname
when not matched by target
then insert(studentname,semester,securedmarks,totalmarks)
values(s.studentname,s.semester,s.securedmarks,s.totalmarks)
when not matched by source 
then delete;













