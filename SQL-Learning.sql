show databases;
use my_work;

show tables;

create table new_tab
(
stu_id int (5),
stu_name varchar(20),
city text (50),
dob date,
fees dec(10,2)
);
desc new_tab;

insert into new_tab
values(10, 'yash', 'indore','01/05/18', 18000),
(11,'yogesh','jabalpure','05/06/19', 17000),
(05,'harsh','delhi','10/12/18', 15000),
(07,'jai','goa','15/08/20', 12000),
(01,'aman','mumbai','12/02/19', 16000),
(09,'sharad','indore','11/01/20', 15000);

select * from new_tab;

select stu_name, fees from new_tab;

select * from new_tab order by stu_id limit 2;

select * from new_tab
limit 1,3;

##WHERE CLAUSE
select * from new_tab
where fees = 2000;

select stu_name, city, dob
from new_tab 
where city is null;

select * from new_tab
where fees is not null;

select * from new_tab
where stu_name = 'yogesh' and fees = 15000;

select * from new_tab
where stu_name = 'yash' or fees = 18000;

select * from new_tab
where city in ('indore', 'jabalpure');

select * from new_tab
where stu_name not in ('yash');

select * from new_tab
where stu_id between 5 and 10;

select * from new_tab
where stu_id not between 5 and 10;

select * from new_tab
where (stu_id between 5 and 10)
and city in ('indore');

select * from new_tab
where (stu_id between 5 and 10)
and not city in ('jabalpur');

show databases;
use my_work;
desc new_tab;

###LIKE --

select * from new_tab
where stu_name like 'ya%';

select * from new_tab
where mob_no like '%47';

select * from new_tab
where stu_name like '%es%';

select * from new_tab
where stu_name like '_as%';

select * from new_tab
where stu_name like '%es_';

select * from new_tab
where stu_name like 'yo_es_';

select * from new_tab
where stu_name like '%es_';

select * from new_tab
where stu_name not like '_as%';

###ORDER BY
select * from new_tab
order by stu_name desc;

select * from new_tab
order by stu_name;

##UNIQUE KEY
create table u_tab
(
stu_id int (5) unique key,
name varchar (30),
roll int (5) unique key,
city varchar  (40)
);
desc u_tab;

insert into u_tab 
values( 01, 'jai', 101,'delhi');

insert into u_tab  (name, roll, city)
values(  'veeru', 102,'delhi');
select * from u_tab;

### PRIMARY KEY
create table p_tab
(
id int (5) not null primary key,
name varchar (40),
roll int (5) unique key,
city varchar(50)
);

insert into p_tab
values (1, 'raj', 10, 'delhi');
select * from p_tab;

insert into p_tab
values (2, 'sam', 10, 'bang');
select * from p_tab;

###AUTO-INCREMENT
create table ap_tab
(
id int not null auto_increment,
name varchar(50),
city varchar (60),
primary key (id)
);

insert into ap_tab (name, city)
values ('ram', 'delhi');
select * from ap_tab;

insert into ap_tab (name, city)
values ('rani', 'delhi');
select * from ap_tab;

insert into ap_tab (id, name, city)
values (null, 'rahul', 'indore');
select * from ap_tab;

create table au_tab
(
id int not null auto_increment primary key,
name varchar (20)
);
desc au_tab;

### ALTER TABLE
alter table au_tab auto_increment =10;

insert into au_tab (id, name)
values (null, 'rahul');
select * from au_tab;

insert into au_tab(name)
values ('sam'),
('isu');
select * from au_tab;

###ALIAS
select name as stu_name from au_tab;
select name 'stu Name ' from au_tab;

show databases;
use my_work;
select * from new_tab;

###DISTINCT
select distinct stu_name from new_tab;
select distinct city from new_tab;

### ALTER TABLE
select * from new_tab;
alter table new_tab
add column mob_no int(10);
select * from new_tab;

alter table new_tab
add column pin int(5) after fees;
select * from new_tab;

alter table new_tab
add column year year not null primary key;

alter table new_tab
add column year year not null;
select * from new_tab;

desc new_tab;
alter table new_tab
add constraint unique key (mob_no);

use my_work;
desc new_tab;

alter table new_tab
change column pin N_pin int(5);
desc new_tab;

alter table new_tab
modify column city varchar (20) not null;
desc new_tab;

alter table new_tab
drop column year;
desc new_tab;

###TRUNCATE
show tables;
select * from my_tab;
truncate my_tab;
desc my_tab;

###RENAME
rename table my_tab to your_tab;
show tables;

###DROP DATABASES
show databases;
drop database my_db;
show databases;

###SHOW CREATE DATABASES
show columns from new_tab;
show create database my_work;

###SHOW CREATE TABLES
use my_work;
show create table new_tab;

###UPDATE
select * from new_tab;
update new_tab 
set mob_no = 985632147 
where  stu_id = 10;

select * from new_tab;
update new_tab
set mob_no = 96856354
where stu_id = 7;

select * from new_tab;
update new_tab
set city ='gujrat'
where stu_id  = 9;

select * from new_tab;
update new_tab
set stu_name ='abhi'
where stu_id  = 7;

###UPDATE CASE
create table student
(
stu_id int(5),
name varchar (20),
city varchar (20),
mark int(10)
);
insert into student
values (01, 'abhi', 'dewas', 300),
(02, 'abhi', 'ujjain', 250),
(03, 'ajay', 'neemach', 320),
(04, 'ravi', 'khargon', 255),
(05, 'vijay', 'nagda', 150),
(06, 'rim', 'rewa', 145); 
select * from student;

alter table student
add column result varchar (50);

update student
set result =
case
when mark >= 300 then 'first'
when mark <= 300  and mark >= 250 then 'second'
when mark <= 250 and mark >= 150 then 'third'
else 'fail'
end;
select * from student; 

update student
set result = 'second'
where stu_id = 6;

###DELETE
delete from student
where stu_id = 6 and name = 'rim' ;
select * from student;

### COPY OLD TABLE TO NEW TABLE
create table new_student like student;
insert new_student select * from student;
select * from new_student;

show tables;
desc new_tab;

select min(fees) from new_tab;
select max(fees) from new_tab;
select sum(fees) from new_tab;
select avg(fees) from new_tab;
select sqrt(fees) from new_tab;

###COUNT OR COUNT(*)
create table orders
(
order_id int,
cust_id int,
seller_id int
);
insert into orders
values(1, 101, 201),
(2, 102, 202),
(3, 103, 204),
(4, 101, 205),
(5, 101, 301),
(6, 102, 401),
(7, 103, 301),
(8, 103, 345);

select * from orders;
select count(cust_id) from orders;
select count(*) from orders;
select count(distinct cust_id) from orders;

select count(cust_id) from orders
where cust_id = 101;

select * from new_tab;
select stu_id, concat(stu_name, ' ', city) from new_tab;

###REVERSE METHOD
select reverse(city) from new_tab;


###GROUP BY
select * from orders;
select cust_id, count(*) from orders where cust_id = 101;
select cust_id, count(*) from orders group by  cust_id;

select cust_id, count(*) from orders group by cust_id having count(*) >2;


-- FOREIGN KEY 

create table employee
(
e_id int not null auto_increment primary key,
e_name varchar (20),
city varchar (20)
);
desc employee;

create table department
(
d_id int not null auto_increment primary key,
d_name varchar (20),
emp_id int not null,
foreign key (emp_id) references employee (e_id)
);
desc department;

###FIND CONSTRAINT NAME
select * from information_schema. table_constraints
where table_name = 'department';

###DROP CONSTRAINT
alter table department
drop constraint emplyee_eid_fk;

alter table department
drop foreign key emplyee_eid_fk;

alter table department
add constraint emplyee_eid_fk
foreign key (emp_id) references employee(e_id);
desc department;


insert into employee 
values (01, 'ajay', 'bhopal'),
(02, 'raj','delhi'),
(03,'sumit','ratlam'),
(04,'vishal','gujrat'),
(05,'sam', 'dewas'),
(06,'rahul','agar');
select * from employee;

###ON DELETE CASECADE - - This means that if a record in the parent table is deleted, 
## all related records in the child table (the table with the foreign key) will also be automatically deleted.

create table department
(
d_id int not null auto_increment primary key,
d_name varchar (20),
emp_id int not null,
foreign key (emp_id) references employee (e_id)
on delete cascade
);
insert into department 
values (01, 'IT', 1),
(02, 'HR', 1),
(03,'Admin', 1),
(04,'IT', 2),
(05,'Exe', 2),
(06,'IT', 3),
(07,'Exe', 3),
(08,'IT', 4),
(09,'HR', 5),
(10,'Admin', 6);
select * from department;

delete from employee 
where e_id = 1;
select * from employee;

###ON DELETE SET NULL -- it means that if a record in the parent table is deleted,
## the corresponding foreign key values in the child table (the table with the foreign key) will be set to NULL.

create table Emp
(
empid int auto_increment primary key,
name varchar (20),
city varchar (20)
);
insert into Emp (name, city)
values ('riya', 'indore'),
('jiya', 'ujjain'),
('siya', 'dewas');

create table Dep
(
did int primary key,
depname varchar (20)
);
insert into Dep (did, depname)
values (101, 'IT'),
(102, 'HR'),
(103, 'Admin');

select name, depname from Emp cross join Dep;
select name, depname from Dep cross join Emp;
select * from Dep, Emp;

use my_work;
create table empy
(
e_id int not null auto_increment primary key,
e_name varchar (20),
city varchar (20)
);
insert into Empy (e_name, city)
values ('riya', 'indore'),
('jiya', 'ujjain'),
('siya', 'dewas');

create table depy
(
d_id int not null auto_increment primary key,
d_name varchar (20),
e_id int,
constraint emp_id_fk
foreign key (e_id) references empy (e_id)
);
insert into depy 
values (01, 'IT', 3),
(02, 'HR', 1),
(03,'Admin', 2);

select * from empy;
select * from depy;
select empy.e_name,depy.d_name from empy
inner join depy
on empy.e_id = depy.e_id;

select empy.e_name,depy.d_name from empy
inner join depy
on empy.e_id <> depy.e_id; 

select empy.e_name,depy.d_name from empy
natural join depy;


select empy.e_name,depy.d_name from empy
left join depy
on empy.e_id = depy.e_id;

create table empman
(
empid int (11) not null primary key,
name varchar(20),
manid int (11)
);

insert into empman (empid, name, manid)
values( 1, 'rahul', 3),
(2, 'jay', 3),
(3, 'sonam', 4),
(4, 'kunal', 5),
(5, 'ram', 6),
(6, 'rani', null),
(7, 'veeru', 6);

select e.name as Name, m.name as manager
from empman e 
left join empman m 
on e.manid = m.empid;

create table records
(
stuid int (11),
name varchar (20),
city varchar (20)
);

insert into records
values (1, 'rahul', 'delhi'),
(2, 'jay', 'kol'),
(3, 'sonam', 'delhi'),
(4, 'kunal', 'hyd'),
(5, 'ram', 'delhi'),
(6, 'rani', 'patna'),
(7, 'veeru', 'kol');
select * from records;

select S2.name as NAME, S2.city as CITY
from records as S1
inner join records as S2
on S1.city = S2.city and S1.name = 'rahul';


select ifnull('jay', 'show') as records;


select * from empman;
select * from student;

select name from student 
union 
select name from empman;

select name AS StudentName from student 
union 
select name AS EmpName from empman;

###MERGE STATEMENT
create table product_source
(
p_id int,
p_name varchar(20),
p_price int
);

insert into product_source(p_id,p_name,p_price)
values(101,'mouse',100),
(102,'pad',110),
(103,'cpu',250),
(104,'hard disk',300);
select * from product_source;

create table product_target
(
p_id int,
p_name varchar(20),
p_price int
);

insert into product_target(p_id,p_name,p_price)
values(101,'mouse',100),
(102,'pad',110),
(103,'cpu',250),
(106,'hard disk',300);
select * from product_target;

merge into product_target as trg
using product_source as src
on (trg.p_id=src.p_id)
when not matched by target
then
insert (p_id,p_name,p_price)
value(src.p_id,src.p_name,src.p_price)

when matched then update
set trg.p_name= src.p_name,
trg.p_price = src.p_price

when not matched by source
then delete;

###indexes
show tables;

select * from new_tab
where dob > '2001-05-18';

create index stu_dob on new_tab (dob);

show index from new_tab;

drop index stu_dob on new_tab;


###BUILDIN FUNCTION
### TO ADD 20 DAYS TO THE DATE 2015-12-10, ENTER THE FOLLOWING COMMAND;
select adddate('2012-12-10',20);

select curdate();




select date_add(current_date(), interval 1 year);

select date_format('2022-09-13','%D-%M-%Y');

select insert('i am fine',6,9,'good');
select repeat('yash ',4); 



select * from customer_details;

start transaction;
delete from customer_details;
select * from customer_details;
ROLLBACK;
select * from customer_details;

start transaction;
delete from customer_details;
select * from customer_details;
commit;
