/* sub-queries */
show databases;
use my_work;

create table student_M
(
roll_no int,
science int,
maths int,
english int
);

insert into student_M
values(1,30,55,50),
(2,65,45,45),
(3,48,65,63),
(4,56,52,75),
(5,74,45,85),
(6,25,35,95),
(7,33,78,64),
(8,88,66,65),
(9,44,95,52),
(10,64,47,45);

select * from student_M;

create table student_info
(
roll_no int,
stu_name varchar(20),
city varchar(20)
);
insert into student_info
values( 1, 'raj', 'delhi'),
(2,	'rahul', 'delhi'),
(3,	'jay', 'kol'),
(4,'sonam', 'indore'),
(5, 'kunal', 'hyd'),
(6, 'ram', 'delhi'),
(7,'rani',	'patna'),
(8,	'veeru', 'kol'),
(9, 'raja', 'reewa'),
(10, 'abhi', 'goa');

create table empsale
(
empid int,
depid int,
productId int,
qty int,
sales int,
sales_yr int 
);
insert into empsale
values(100,1,1,21,200,2000),
(101,1,1,21,150,2001),
(102,2,2,45,211,2002),
(103,3,2,21,2345,2003),
(100,1,3,45,322,2004),
(104,3,2,45,4000,2005),
(105,1,3,56,322,2006),
(106,2,2,32,322,2007),
(101,2,3,22,322,2008),
(103,3,3,44,3211,2009),
(104,3,2,66,4000,2010);

select * from student_M;
select * from student_info;

# -- select student who live in delhi--
select * from student_M where roll_no =
(select roll_no from student_info where city = 'delhi');

select * from student_M where roll_no in
(select roll_no from student_info where city = 'indore');

select * from student_M where roll_no not in
(select roll_no from student_info where city = 'indore');

show tables;
select * from new_tab;

-- 2nd Highest salary using corelated sub query  
select fees from new_tab as ab where 2=
(select count(distinct fees) from new_tab as bc
 where ab.fees <= bc.fees);

select fees from new_tab as e1 where 2 =
( select count(distinct fees) from new_tab e2
where e2.fees >= e1.fees);

-- nth highest salary 
select * from new_tab as nt1
 where (1)=
(select count(distinct (nt2.fees)) from new_tab as nt2  
where nt2.fees >= nt1.fees);

-- 4th Highest salary using corelated sub query
select fees from new_tab as ab where 4=
(select count(distinct fees)
from new_tab as bc where ab.fees <= bc.fees);

select distinct fees from new_tab e1 where 4=
(select count(distinct fees) from new_tab e2
where e2.fees >= e1.fees);

-- windows function
/* A PARTITION BY clause is used to partition rows of table into groups. 
It is useful when we have to perform a calculation on individual rows of a group
 using other rows of that group.
It is always used inside OVER() clause.
The partition formed by partition clause are also known as Window.
This clause works on windows functions only. Like- RANK(), LEAD(), LAG() etc.
If this clause is omitted in OVER() clause, then whole table is considered as a single partition */

-- find sales dept wise with empid, productid details
select * from empsale;
select empid, productId, depid, sum(sales) over() as 'total' from empsale;

select * from empsale;
select empid, productId, depid, sum(sales) over(partition by depid) as 'total' from empsale;

select empid, productId, depid, sum(sales) over() as 'total',
avg(sales) over() as 'Avgsales' from empsale;

select empid, productId, depid, sales, rank() 
over(order by sales desc) as 'sales_Rank' from empsale;

select empid, productId, depid, sales, rank() 
over(partition by depid order by sales desc) as 'sales_Rank' from empsale;

select empid, productId, depid, sales, rank() 
over(partition by depid order by sales desc) as 'sales_Rank',
dense_rank() over(partition by depid order by sales desc) as 'dense_Rank' from empsale;

select empid, productId, depid, sales, row_number() 
over(order by sales desc) as 'Row_Number' from empsale;

select empid, productId, depid, sales, row_number() 
over(partition by depid order by sales desc) as 'Row_Number' from empsale;

select empid, productId, depid, sales, ntile(4) 
over(order by sales desc) as 'Row_Number' from empsale;

select * from empsale;
select empid, productId, depid, sales, sales_yr, lag(sales) 
over( order by sales_yr asc) as 'Previous_year' from empsale;

select empid, productId, depid, sales, sales_yr,
 lag(sales) over( order by sales_yr asc) as 'Previous_year',
 lead(sales) over(order by sales_yr asc) as 'Next_year' from empsale;
 
 select empid, productId, depid, sales, sales_yr,
 first_value(sales) over( order by sales_yr asc) as 'first_value' from empsale;
 
 select empid, productId, depid, sales, sales_yr,
 last_value(sales) over() as 'last_value' from empsale;
 
 -- Stored Procedure
 
DELIMITER //
CREATE PROCEDURE sp_deplist()
BEGIN
 select * from empsale where depid =1;
 end//
 
 call sp_deplist();
#---- --- ------ ------ # ----- ------ ---- --- --- #--- ------ ----- 
 DELIMITER //
CREATE PROCEDURE sp_emp()
BEGIN
 select empy.e_name,depy.d_name from empy
inner join depy
on empy.e_id = depy.e_id;
 end//
 
 call sp_emp();
 #---- --- ------ ------ # ----- ------ ---- --- --- #--- ------ ----- 

 show procedure status;
 show procedure status where name like'sp%';

drop procedure sp_dep;
#---- --- ------ ------ # ----- ------ ---- --- --- #--- ------ ----- 

 select * from empsale;

delimiter //
CREATE PROCEDURE sp_name(in e_name varchar(20))
BEGIN
 select * from empy where name = e_name;  ### ye error solution findout krna hai
 end//
 call sp_name('riya');
#---- --- ------ ------ # ----- ------ ---- --- --- #--- ------ ----- 

delimiter //
CREATE PROCEDURE sp_max(out maxsales int)
BEGIN
select max(sales) into maxsales from empsale ;
end//
call sp_max(@Max);
select @Max;
  #---- --- ------ ------ # ----- ------ ---- --- --- #--- ------ ----- 

 -- VIEW --
 select * from empsale;


create view vw_empsale
as
select * from empsale;

select * from vw_empsale;

select * from student_info;
select * from student_m;

create view vw_multi_table
as
select st.roll_no, st.stu_name, st.city, sm.science, sm.maths, sm.english
from student_info as st
join student_m as sm;

select * from vw_multi_table;

-- ALTER VIEW 
alter view vw_empsale
as
select empid, sales from empsale;

-- RENAME TABLE 
RENAME TABLE vw_multi_table
TO view_multi_jointab;

select * from view_multi_jointab;

-- DROP VIEW
DROP VIEW vw_multi_table;



-- Trigger--

create table trig
(
t_id int primary key auto_increment,
t_name varchar(20),
t_age int
);

create table trig_audit
(
t_id int primary key auto_increment,
audit_description varchar (500)
);


DELIMITER//
CREATE TRIGGER tr_AfterInsertTrig
after insert on trig
for each row 
BEGIN
insert into trig_audit values(null, concat('A ROW IS INSERTED AT ',
date_format(now(), '%d-%m-%y %h:%i:%s %p')));
END//

insert into  trig values(null,'sharad',22);

select * from trig;
select * from trig_audit;


DELIMITER //
CREATE TRIGGER tr_AfterDeleteTrig
after delete on trig
for each row 
BEGIN
DECLARE emp_id int;
set emp_id = old.id;
insert into trig_audit values(null, concat('A ROW IS DELETED WITH ID',emp_id,'at',
date_format(now(), '%d-%m-%y %h:%i:%s %p')));
END//


-- TRANSACTION 
create table customer_details
(
id int primary key,
name varchar(20) not null,
gender varchar(20) not null,
designation varchar(20) not null,
city varchar(20) not null,
salary int not null
);

insert into customer_details values
(1,'ajay','male','manager','ujjain',50000),
(2,	'rahul','male','assistant','delhi',10000),
(3,	'jaya','female','operator','kol',25000),
(4,'sonam','female','manager','indore',35000),
(5, 'kunal','male','accountant','hyd',45000),
(6, 'ram','male','technician','delhi',20000),
(7,'rani','female','assistan','patna',30000),
(8,	'veeru','male','accountant','kol',40000),
(9, 'raja','male','manager','reewa',25000),
(10, 'abhi','male','operator','goa',25000);


select * from customer_details;
  
start transaction;
delete from customer_details;
select * from customer_details;
ROLLBACK;

start transaction;
delete from customer_details;
select * from customer_details;
commit;

start transaction;
insert into customer_details values
(11,'vidita','female','ass-manager','indore',55000);
update customer_details set name = 'Shyam' where id = 6;
delete from customer_details where id = 10;
select * from customer_details;
rollback;
select * from customer_details;



-- nth highest salary -- desc order
select * from empsale order by sales desc;

-- max func
select max(sales) from empsale;

-- 2nd highest sale
select max(sales) from empsale where sales <
(select max(sales) from empsale);

-- 3rd highest sale


select max(sales) from empsale where sales <
(select max(sales) from empsale where sales<
(select max(sales) from empsale));


-- fetch all the class name where music thought as a subject

select class_name from subject as sub
join classes as cls 
on sub.subject_id = cls.subject_id
where subject_name = 'music';

-- count no of student in each class
select class_id, count(1) as 'no_student' from class_detail
group by class_id order by class_id;

-- more than hundred student in each class 
select class_id, count(1) as 'no_student' from class_detail
group by class_id having count(1) > 100;

-- parents with more than 1 kid in school
select parent_id, count(1) as 'no_parent' from class_detail
group by parent_id having count(1) >1;


-- aggregation  function
select avg(sf.salary) as avg_salary from staff as sf
join class_detail as cd 
on cd.staff_id = stf.staff_id
where stf.staff_type = 'non-teaching';

select sum(stf.salary) as total_salary from staff as stf
join class_detail as cd
on cd.staff_id = stf.staff_id
group by stf.staff_type;

-- fetch all staff name and salary info matching records
select count(1) from staff stf
join class_detail cd on cd.staff_id = stf.staff_id
order by 1;

-- What are the full names of staff members along with their salaries
select distinct concat(cd.first_name,' ',cd.last_name) as full_name, stf.salary
from class_detail 
join staff stf on stf.staff_id = cd.staff_id
order by 1;


show databases; 
use my_work;
show tables;

create table employee2
(
emp_id int (5),
emp_name varchar(20),
salary int (20),
dept_id text,
manager_id text
);

insert into employee2
values(1,'rahul',15000,'D1','M1'),
(2,'manoj',15000,'D1','M1'),
(3,'james',40000,'D2','M2'),
(4,'michal',55000,'D2','M2'),
(5,'aman',20000,'D10','M3'),
(6,'rocky',35000,'D10','M3');
desc employee2;

create table department2
(
dept_id text,
dept_name varchar(20)
);

insert into department2
values('D1','IT'),
('D2','HR'),
('D3','Finance'),
('D4','admin');

create table manager
(
manager_id text,
manager_name varchar(20),
dept_id text
);

insert into manager
values('M1','prem','D3'),
('M2','sham','D4'),
('M3','nick','D1'),
('M4','cory','D1');

create table project
(
project_id text,
project_name varchar(20),
team_member_id text
);

insert into project
values('p1','data migrat','e1'),
('p1','data migrat','e2'),
('p1','data migrat','M3'),
('p2','etl tool','e1'),
('p2','etl tool','M4');

DELETE FROM manager WHERE manager_id = 'p2';

select * from employee2;
select * from department2;
select * from manager;
select * from project;

-- fetch the employee name and the department name they belong to.
select emp_name , dept_name from employee2 as e2
join department2 as d2 on e2.dept_id = d2.dept_id;

-- fetch all the employee name and their department name they belong to.
select emp_name , dept_name from employee2 as e2
left join department2 as d2 on e2.dept_id = d2.dept_id;

-- right join = inner join + any additional records from the right table.
select emp_name , dept_name from employee2 as e2
right join department2 as d2 on e2.dept_id = d2.dept_id;
 
 -- fetch detail of all emp their manager their department and the projects they work on
 select e2.emp_name, d2.dept_name, m2.manager_name, p2.project_name
 from employee2 e2
 left join department2 d2 on e2.dept_id = d2.dept_id
 join manager m2 on m2.manager_id = e2.manager_id
 left join project p2 on p2.team_member_id = e2.emp_id;
 
-- full join = inner join + all remaining left table and right table

select e2.emp_name, d2.dept_name from employee2 as e2
full join department2 as d2 on e2.dept_id = d2.dept_id;

select emp_name , p2.project_name from employee2 as e2
cross join project p2;

-- SUB-Query
-- find the employee who's salary is more than the average salary earned by all employees.

select avg(salary) from employee2

select * from employee2
where salary > (select avg(salary) from employee2); 

-- Scalar subquery - it always returns 1 row and 1 column.

select * from employee2 e2
join (select avg(salary) sal from employee2)  avg_salary
on e2.salary > avg_salary. sal   -- get one additional column

-- Multiple row subquery
-- subquery which returns multiple column and multiple row
-- subquery which returns only 1 column and multiple rows

/* find the employee who earn the highest salary in each department */

select max(salary), dept_id from employee2
group by dept_id;

select * from employee2
where (dept_name,salary) in (
select max(salary),dept_name from employee2
group by dept_name);


/* find department who not have any employee */
select * from department2
where dept_name not in (select distinct dept_name from employee2)

-- correlated subquery 

-- Nested subquery - subquery inside a subquery
 /* find stores who's sales where better than the average sales accross all stores */
 1) find the total sales for each store.
 2) find avg sales for all the stores.
 3) compare 1 & 2 
 
 select * from
 (select store_name, sum(price) as total_sales
 from sales
 group by store_name) sales
 join select avg(total_sales)  sales
 from (select store_name, sum(price) as total_sales 
 from sales
 group by store_name) avg_sales
 on  sales.total_sales > avg_sales.sales;
 
 -- with clause is better way to represent nested subquery it's written simple way of complex query
 with sales as 
 (select store_name, sum(price) as total_sales
 from sales
 group by store_name)
select *
from sales
 join select avg(total_sales)  sales
 from sales) avg_sales
 on  sales.total_sales > avg_sales.sales;
 
 -- Using a subquery in SELECT clause
 /* fetch all the employee details and add remarks to those employees who earn more than the average pay. */
 
 select * ,
 (case when salary > avg_sal.sal
 then "Higher than average"
 else null
 end) as remarks
 from employee2
  cross join (select avg(salary) sal from employee2) avg_sal 
  
  -- HAVING
  /* find the stores who have sold more units than the average units sold by all stores. */
  
  select store_name, sum(quantity)
  from sales
  group by store_name
  having sum(quantity) > (select avg(quantity) from sales);
  
  -- INSERT UPDATE DELETE
  /* Insert data to employee_data table. make sure not insert duplicate records */
  select * from employee_data
  
  insert into employee_data(emp_id, emp_name, salary, dept_name, location)
  select ed.emp_id, ed.emp_name, ed.salary, d.dept_name, d.location
  from employee_data ed
  join department_data d on d.dept_name = ed.dept_name
  where not exists (select 1
                   from employee_data er
                   where er.emp_id = er.emp_id);
	

INSERT INTO target_table (column1, column2, column3)
SELECT source_table.column1, source_table.column2, source_table.column3
FROM source_table
LEFT JOIN target_table ON source_table.column1 = target_table.column1
WHERE target_table.column1 IS NULL;

insert into employee_data (emp_id, emp_name, salary, dept_name, location)
select dep.emp_id, dep.emp_name, dep.salary, dep.dept_name, dep.location
from department dep
left join employee_data ON dep.emp-id = emp.emp-id
where emp.emp-id IS NULL;


-- UPDATE 
/* Give 10% increment to all employees in Bangalore location based on the maximum salary earned by an employee in each dept
dept. only consider employee i employee_data table */

update employee_data ed
set salary = (select max(salary) + (max(salary) * 0.1)
            from employee_hist eh
            where eh.dept_name = ed.dept_name)
where ed.dept_name in (select dept_name from department
                     where location='Bangalore')
and ed.emp_id in (select emp_id from employee_hist);


UPDATE employee_data e1
SET e1.salary = e1.salary * 1.10
WHERE e1.location = 'Bangalore'
AND e1.salary = (
    SELECT MAX(e2.salary)
    FROM employee_data e2
    WHERE e2.dept_name = e1.dept_name

-- DELETE 
/* Delete all departments who do not have any employees. */

delete from department
where dept_name in (select dept_name from department dep
                   where not exists
                   (select 1 from employee_data emp
                   where emp.dept_name = dep.dept_name)
                   );
                   
-- WITH Clause
with average_salary() as(select avg(salary) from employee_data)
select * from employee_data ed
where ed.salary > average_salary;



-- data duplicated delete from car table
-- duplicate record is identified based in the model and brand name

select model, brand, count(*) from cars
group by model, brand
having count(*)>1

select model, brand, max(id) from cars
group by model, brand
having count(*)>1

delete from cars
where id in ( select max(id) from cars
            group by model, brand
            having count(*)>1)
		
DELETE FROM employee
WHERE (dept_id, salary) IN (
    SELECT dept_id, MIN(salary)
    FROM employee
    GROUP BY dept_id
    HAVING MIN(salary) < 30000
);
            
-- by self join 
delete from cars
where id in(
            select c2.id from cars c1
            join cars c2 on c1.model = c2.model and c1.brand =c2.brand
            where c1.id < c2.id)

DELETE e1
FROM employee e1
JOIN employee e2 ON e1.emp_id = e2.emp_id 
AND e1.id > e2.id;

-- delete duplicate rows           
 DELETE c1 FROM contacts c1
INNER JOIN contacts c2 
WHERE
    c1.id > c2.id AND 
    c1.email = c2.email;
    
DELETE t1
FROM your_table t1
JOIN your_table t2
ON t1.column_to_check = t2.column_to_check
AND t1.id > t2.id;