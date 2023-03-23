--creating a database
create database task7
use task7

--Creating table
CREATE TABLE StudentScores (
    studentid INT PRIMARY KEY,
    studentname VARCHAR(50),
    department VARCHAR(50),
    score FLOAT
);

INSERT INTO StudentScores (studentid, studentname, department, score)
VALUES
    (1, 'Srikanth', 'BBA', 85),
    (2, 'Selva Ganapathi', 'BCOM', 78),
    (3, 'Dhana Prakash', 'MSc', 92),
    (4, 'Arun Joseph', 'BSc', 89),
    (5, 'Arjun Venkitraman', 'BCA', 77),
    (6, 'Vignes', 'MBA', 91),
    (7, 'Divya Prakash', 'BBA', 83),
    (8, 'Vikram', 'BSc', 79),
    (9, 'Tony Stark', 'BCOM', 88),
    (10, 'Captain America', 'MSc', 86),
    (11, 'Thor', 'BBA', 93),
    (12, 'Black Panther', 'BCOM', 82),
    (13, 'Bruce Wayne', 'BCA', 90),
    (14, 'Clark Kent', 'MBA', 84),
    (15, 'Veera Raghavan', 'BSc', 87),
    (16, 'Billa', 'BCOM', 80),
    (17, 'Itachi', 'BBA', 89),
    (18, 'Stephen Strange', 'MSc', 81),
    (19, 'Stan Lee', 'BCOM', 90),
    (20, 'Star Boy', 'BSc', 95),
    (21, 'Undertaker', 'BBA', 88),
    (22, 'Randy Orton', 'BCA', 92),
    (23, 'Vijay Sethupathi', 'MBA', 76),
    (24, 'Bruce Lee', 'BSc', 83),
    (25, 'Pal Walker', 'BCOM', 91);



--1. Create a non-clustered index for department.
	create index depti on studentScores (department)

--2. Create a filtered index for department='BCA'
create index deptbca on studentscores(department) where department='BCA'

--3. Create a view for students in BCA department.
create view BCAview as select department from StudentScores where department='BCA'
alter view BCAview as select * from StudentScores where department='BCA'

--4. Apply Rank() for all the students based on score.
select studentname,score, rank() over (order by score desc) as Rank from StudentScores

--5. Apply Dense_Rank() for students in each department based on score.
select studentname, score, DENSE_RANK() over (order by score desc) as Rank from StudentScores


CREATE TABLE Manager (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE Employee (
  eid INT PRIMARY KEY,
  ename VARCHAR(50),
  mid INT FOREIGN KEY (mid) REFERENCES Manager(id),
  department VARCHAR(50),

);
insert into Manager values(100,'Tony Stark');
insert into Manager values(101,'Bruce Wayne');
insert into Manager values(102,'Dark Seid');
insert into Manager values(103,'Thanos');

select * from Manager

insert into Employee values(1,'Srikanth',100,'Computer science')
insert into Employee values(2,'Selva Ganapathi',101,'Automation')
insert into Employee values(3,'Arun Joseph',102,'Communication')
insert into Employee values(4,'Vikram',103,'Designing')

select * from Employee
--1. Create a complex view by retrieving the records from Manager and Employee table.

create view Complexview as select e.eid,e.ename,e.mid,e.department,m.id,m.name
from employee e full join Manager m  on e.mid=m.id

select * from Complexview
--2. Show the working of 'on delete cascade on update set default' for the above tables
alter table Employee drop constraint fk_mid
alter table employee add constraint fk_mid 
foreign key (mid) references dbo.manager(id)
on update cascade
on delete cascade 
alter table employee with check check constraint fk_mid

delete from manager where name = 'Dark seid'

select * from employee
























