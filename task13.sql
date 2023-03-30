create database task13

use task13

create table department
(
dept_name varchar(25) primary key,
building varchar(20),
budget numeric(18,2)
)

create table course(
class_id varchar(7) primary key,
name varchar(25),
dept_name varchar(25) references department(dept_name),
credits numeric(5),
description varchar(8000)
)

create table time_slot
(
time_slot_id int primary key,
days varchar(8),
start_time Datetime,
end_time datetime
)
create table section(
class_id varchar(7) references course(class_id),
class_num int primary key,
semester varchar(7),
YEAR INT ,
room_no varchar(6),
time_slot_id int references time_slot(time_slot_id)
)



create table requisite(
class_id varchar(7) references course(class_id),
req_id int ,
type varchar(4)
)


create table users(
users_id int primary key,
username varchar(16),
password varchar(40)
)


create table user_balance(
users_id int,
balance numeric(18,2)
foreign key (users_id) references users(users_id)
)
create table takes(
users_id int references users(users_id),
class_id varchar(7) references course(class_id),
class_num int references section(class_num),
semester varchar(7),
year int,
grade varchar(2)
)


create table role(
role_id int primary key,
role_name varchar(3),
role_full_name varchar(15)
)

create table user_salary(
users_id int references users(users_id),
salary numeric(18,2)
)

create table teaches(
users_id int references users(users_id),
class_id varchar(7) references course(class_id),
class_num int references section(class_num),
semester varchar(7),
year int
)

create table user_number(
users_id int references users(users_id),
number numeric(15,0),
description varchar(15)
)

create table user_address(
users_id int references users(users_id),
address varchar(80),
apt_num varchar(15),
city varchar(25),
state varchar(2),
zip numeric(5,0),
description varchar(15)
)

create table finaid_main
(
aid_id int primary key,
name varchar(50),
category varchar(15)
)

create table user_finaid_map
(
users_id int references users(users_id),
aid_id int references  finaid_main(aid_id),
semester varchar(7),
year int,
offered numeric(18,2),
accepted numeric(18,2)
)
create table user_role(
users_id int references users(users_id),
role_id int references role(role_id)
)
create table user_email(
users_id int references users(users_id),
email varchar(50) primary key,
description varchar(15)
)
create table hold_main(
users_id int references users(users_id),
hold_id int primary key,
name varchar(25),
description varchar(15)
 
)

create table user_hold_map(
users_id int references users(users_id),
hold_id int references hold_main(hold_id)
)














