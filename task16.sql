create database  task16
use task15

--1. Create a DML trigger to restrict DML operations on Saturday and Sunday.

create table offers(
id int primary key,
product varchar(20),
cost money
)

insert into offers values(1,'Bike',100000),(2,'Cycle',20000),(3,'watch',2000)

create trigger trigger1
on students
for insert,update,delete
as begin
if datepart(DW,GETDATE()) =7 or datepart(DW,GETDATE())=1
begin
print 'Restricted for saturday an sunday'
rollback transaction
end
end

--2. Create a DML trigger to restrict delete operations between 11:00AM to 15:00PM.

create trigger trigger2
on students
for insert,update,delete
as begin
if datepart(HH,GETDATE())>=11 and datepart(HH,GETDATE())<=15
begin
print 'Restricted during 11:00AM and 15:00PM'
rollback transaction
end
end



--3. Create a DDL trigger to show notification whenever a CREATE, ALTER, DROP, RENAME operation is performed.


create trigger trigger3
on database
for create_table,alter_table,drop_table,rename
as begin
print 'CREATE, ALTER, DROP, RENAME operation is performed.'

end


















