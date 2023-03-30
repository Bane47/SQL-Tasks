create database task14
use task14


/*a. Create a table Hobbies (HobbyID(pk), HobbyName(uk)) 
1. insert records into the table using a stored procedure.
2. insert duplicate records into the table and show the working of exception handling using Try/catch blocks.
3. Store the error details in an errorbackup table.*/
create table hobbies(
HobbyID int primary key,
HobbyName varchar(20) unique 
)

create table errorbackup(
errornumber int,
errorstate int,
errorseverity int,
errormessage varchar(max),
errorline int,
time datetime

)

alter procedure sp_inserter(@ID int,@name varchar(20))
as
begin
set nocount on
begin try
insert into hobbies(HobbyID,HobbyName) values(@ID,@name)

end try
begin catch
insert into errorbackup values(error_number(),error_state(),error_severity(),error_message(),error_line(),getdate())
print 'Duplicate values are not allowed'
end catch
end


exec sp_inserter 1,'Darshan'


select * from hobbies
select * from errorbackup

--b. Create a procedure to accept 2 numbers, if the numbers are equal then calculate the product else use RAISERROR to show the working of exception handling.
alter procedure sp_twonums(@num1 int,@num2 int)
as
begin
if @num1=@num2
begin
declare @num3 int
set @num3=@num1*@num2
print 'The product of the two numbers is '+convert(varchar(10),@num3)
end
else
begin
raiserror('The numbers are not equal',16,1)
end
end

execute sp_twonums 5,9

--c. Create a table Friends(id(identity), name (uk)) and insert records into the table using a stored procedure.
--Note: insert the names which start only with A,D,H,K,P,R,S,T,V,Y ELSE using THROW give the error details.

create table friends(
ID int identity(1,1),
Name varchar(20) unique
)

alter procedure sp_friends(@name varchar(20))
as
begin
if left(@name,1) in ('A','D','H','K','P','R','S','T','V','Y')
begin
insert into friends(name) values(@name)
end
else 
begin
print 'The name should start with only any of these letters: A,D,H,K,P,R,S,T,V,Y'
end
end


exec sp_friends darshan

select * from friends


















