--create a database
create database task6
use task6

--creating a table named salesman
create table salesman(Salesman_ID int primary key,Name varchar(20),City varchar(20),commission decimal);

--inserting values into salesman
insert into salesman values(5001,'James Hoog','New York',0.15)
insert into salesman values(5002,'Nail Knite','Paris',0.13)
insert into salesman values(5005,'Pit Alex','London',0.11)
insert into salesman values(5006,'Mc Lyon','Paris',0.14)
insert into salesman values(5007,'Paul Adam','Rome',0.13)
insert into salesman values(5003,'Lauson Hen','San Jose',0.12)
select * from salesman

alter table salesman drop column commission
alter table salesman add  Commission decimal(10,2)
update salesman set commission=0.14 where Salesman_ID=5006
--creating a table for customer
create table customer(Customer_ID int Primary key,Cust_Name varchar(20),City varchar(20),Grade int, Salesman_ID int)

--Inserting values into the customer table
insert into customer values(3002,'Nick Rimando'  ,'New york'  ,100,5001)
insert into customer values(3007,'Brad Davis'    ,'New york'  ,200,5001)
insert into customer values(3005,'Graham Zusi'   ,'California',200,5002)
insert into customer values(3008,'Julian Green'  ,'London'    ,300,5002)
insert into customer values(3004,'Fabian Johnson','Paris'     ,300 ,5006)
insert into customer values(3009,'Geoff Cameron ','Berlin'    ,100,5003)
insert into customer values(3003,'Jozy Altidor'  ,'Moscow'    ,200,5007)
insert into customer(Customer_ID,Cust_Name,City,Salesman_ID) values(3001,'Brad Guzan','London',5005)

select * from customer


--creating a table for orders
create table orders(Ord_no int primary key,purch_amt decimal(10,2),Ord_date date,Customer_Id int,Salesman_Id int)

--inserting values into the table orders
insert into orders values(70001,150.5,'2012-10-05',3005,5002)
insert into orders values(70009,270.65,'2012-09-10',3001,5005)
insert into orders values(70002,65.26,'2012-10-05',3002,5001)
insert into orders values(70004,110.5,'2012-08-17',3009,5003)
insert into orders values(70007,948.5,'2012-09-10',3005,5002)
insert into orders values(70005,2400.6,'2012-07-27',3007,5001)
insert into orders values(70008,5760,'2012-09-10',3002,5001)
insert into orders values(70010,1983.43,'2012-10-10',3004,5006)
insert into orders values(70003,2480.4,'2012-10-10',3009,5003)
insert into orders values(70012,250.45,'2012-06-27',3008,5002)
insert into orders values(70011,75.29,'2012-08-17',3003,5007)
insert into orders values(70013,3045.6,'2012-04-25',3002,5001)

select * from orders


/*1. From the above tables write a SQL query to find the salesperson and
customer who reside in the same city. Return Salesman, cust_name and
city.*/
Select salesman.Salesman_ID,salesman.Name,salesman.city,customer.Customer_ID,customer.Cust_Name from salesman inner join customer on salesman.City=customer.City

/*2. From the above tables write a SQL query to find salespeople who
received commissions of more than 12 percent from the company.
Return Customer Name, customer city, Salesman, commission.*/
select c.Cust_Name,c.City,s.Name Salesman,s.commission from salesman s inner join customer c on s.Salesman_ID=c.Salesman_ID where commission>0.12

/*3. From the above tables write a SQL query to find the details of an order.
Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman,
commission.*/
select o.ord_no,o.ord_date,o.purch_amt,c.cust_name,c.grade,s.Name SalesmanName,s.commission from orders o
inner join customer c on o.Customer_Id=c.Customer_ID
inner join salesman s on o.Salesman_Id=s.Salesman_ID

/*4. From the above tables write a SQL query to find those orders where the
order amount exists between 500 and 2000. Return ord_no, purch_amt,
cust_name, city.*/
select o.Ord_no, o.purch_amt,c.cust_name,c.city from orders o inner join customer c on o.Customer_Id=c.Customer_ID where o.purch_amt>500 and o.purch_amt<2000

/*5. From the above tables write a SQL query to display the customer name,
customer city, grade, salesman, salesman city. The results should be
sorted by ascending customer_id.*/
select c.cust_name,c.city CustomerCity,c.grade,s.name as salesmanName ,s.city SalesmanCity from customer c inner join salesman s on c.Salesman_ID=s.Salesman_ID order by Customer_ID








