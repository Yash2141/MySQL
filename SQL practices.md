# SQL practices

## SQL Question and Answers

1. **How to retrive the second highest salary of an employee?**

```sql
select max(salary) from employee
where salary < (select max(salary) from employee);
```

```sql
select salary from (select salary, row_number() over(order by salary desc) as rn
from employee ) as ranked
where rn =2
```

```sql
select salary from (select salary, dense_rank() over(order by salary desc) as rn
from employee) as ranked
where rn = 2
```

1. **how to get the nth highest salary in ?**

```sql
select salary from (select salary, dense_rank(order by salary desc) as rn
from employee) as ranked
where rn = N;
```

1. **How do you fetch all employees whose salary is greater than the average salary?**

```sql
select * from employee
where salary > (select avg(salary) from employee);
```

1. **write a query to display the current date and time in**

```sql
select current_timestamp;
```

1. **How to find duplicate records in a table ?**

```sql
select empid, count(*) as count_emp from employee
group by empid
having count(*) > 1
```

1. **how can delete duplicate row in ?**

```sql
with cte as(
select id, row_number() over(partition by email order by id) as rn
from employee) 

delete from employee
where id in (selectt id from cte where rn > 1) 
```

1. **How to get the common records from two tables?**

```sql
select * from employee e
inner join manager m
on m.emp_id = e.emp_id
```

```sql
select * from employee
where id in (select id from manager)
```

1. **How to retrieve the last 10 records from a table?**

```sql
select * from employee order by emp_id desc limit 10
```

1. **How do you fetch the top 5 employees with the highest salaries?**

```sql
select * from employee oder by salary desc limit 5;
```

1. **How to calculate the total salary of all employee?**

```sql
select sum(salary) from employee;
```

1. **How to write a query to find all employees who joined in the year 2020?**

```sql
select * from employee where year(data_joining) = 2020
```

```sql
select * from employee where extract(year form date_joining) = 2020
```

```sql
select * from employee where date_joining between '2020-01-01' and '2020-12-31'
```

1. **write a query to find employees whose name starts with 'A’**

```sql
select * from employee where name like '%A'
```

1. **How can you find the employees who do not have a manager?**

```sql
select e.* from employee e 
join manager m
on m.mid = e.mid
where m.mid is null
```

1. **How to find the department with the highest number of employees ?**

```sql
SELECT department_id, COUNT(*) AS emp_count
FROM employees
GROUP BY department_id
ORDER BY emp_count DESC
LIMIT 1;

```

1. **How to get the count of employees in each department?**

```sql
select d.name as dep_name, count(*) as count_emp from employee as e
left join department as d
on e.id = d.id
group by d.name
```

1. **write a query to fetch employees having the highest salary in each department?**

```sql
SELECT e.*, d.name AS department_name
FROM employee eHow to find the department with the highest number of employees ?
sql
JOIN department d ON e.department_id = d.id
WHERE e.salary = (
  SELECT MAX(salary)
  FROM employee
  WHERE department_id = e.department_id
);

```

```sql
SELECT *
FROM (
  SELECT e.*, d.name AS department_name,
         ROW_NUMBER() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS rn
  FROM employee e
  JOIN department d ON e.department_id = d.id
) t
WHERE rn = 1;
```

1. **How can you find employees whose salary is between 50,000 and 1,00,000**

```sql
SELECT *
FROM employee
WHERE salary BETWEEN 50000 AND 100000;
```

1. **How to find the youngest employee in the organization**

```sql
select * from employee where dob = (select max(dob) from employee)
```

1. **How to fetch the first and last records from a table?**

```sql
(select * from employees order by employee_id asc limit 1)
union all
(select * from employees order by employee_id desc limit 1);
```

1. **write a query to find all employee who report to a specific manager.**

```sql
select * from employee where manager id = ""
```

1. **How can you find the total number of departments in the company?**

```sql
select count(*) AS total_departments
from department;
```

1. **How to find the department with the lowest average salary?**

```sql
select d.name as dep_name, avg(e.salary) as avg_salary from employee as e
inner join department d
on e.emp_id = d.emp_id
group by d.name
order by avg_salary
limit 1
```

1. **How to delete all employee from a department in one query?**

```sql
delete from department where dep_id = 10;
```

1. **How to display all employees who have been in the company for more than 5 years?**

```sql
select * from employees where data_of_joining <= current_date - interval 5 year

```

```sql
select * from employees where date_diff('year', date_of_joining ,current_date) >5
```

1. **How to write a query to remove all records from a table but keep the table structure?**

```sql
truncate from employee
```

1. **How to get the current month’s name from ?**

```sql
SELECT format_datetime(current_date, 'MMMM') AS month_name;
```

1. **How to convert a string to lowercase in ?**

```sql
select lower(name) as emp_name from employe
```

1. **write a query to calculate the total sales per customer in a sales table.**

```sql
select cust_id, sum(sales) as total_sales from sales 
group by cust_id

```

1. **How to find the second highest salary for each department?**

```sql
select id, salary from (
  select id, row_number() over(partition by id order by salary desc) as rnk
  from employee) as ranked
  where rnk = 2
```

1. **write a query to fetch all employees whose name end with ‘n’.**

```sql
select * from employees where name like '%n'
```

1. **How to find all employees who work in both departments 101 and 102?**

```sql
select emp_id from employees
where dep_id in (101,102)
group by emp_id
having count(distinct dep_id) = 2
```

1. **write a query to fetch the details of employees with the same salary.**

```sql
select * from employees
where salary in (select salary from employees group by salary having count(*)>1)
```

1. **How to update salaries of employees based on their department?**

```sql
update employees
set salary = 50000
where dep_id = '20'
```

```sql
update employees
set salary = case when dep_id = 10 then salary * 1.10
                  when dep_id = 20 then salary * 1.20
                  else salary
                  end ;
```

1. **How to write a query to list all employees without a department?**

```sql
select * from employees
where dep_id is null

select *  from employee
where dep_id not in (select id from department where id is not null)
```

1. **write a query to find the maximum and minimum salary  in each department.**

```sql
select dep_id, max(salary) as max_salary, min(salary) as min_salary from employee
group by dep_id
```

1. **How to list all employees hired in the last 6 month?**

```sql
select emp_id from employees where date_of_joining >= current_date - interval 6 month
```

1. **write a query to display department wise total and average salary.**

```sql
select dep_id,sum(salary) total_salary, avg(salary) avg_salary from employees
group by dep_id
```

1. **How to find employees who joined the company in the same month and year as their manager?**

```sql
select * from employees as e
join manager as m
on e.id = m.id
where extract(month from e.date_of_joining) = extract(month from m.date_of_joining)
and extract(year form e.date_of_joining) = extract(year from m.date_of_joining)
```

1. **write a query to count the number of employees whose name start and end with the same letter.**

```sql
select count(*) as count_of_emp from employees
where lower(left(emp_name,1)) = lower(right(emp_name, 1))
```

```sql
select count(*) as cout_of_emp from employees where
lower(substring(emp_name,1)) = lower(substring(emp_name, length(emp_name), 1))
```

1. **How to retrieve employee names and salaries in a single string?**

```sql
select concat(name,'-',salary) from employees
```

1. **How to find  employees whose salary is higher  than their manager’s salary?**

```sql
select e.* from employees as e 
where e.salary >
(select m.salary from employees as m where e.man_id = m.id)
```

```sql
select e.* from employees as e
join employees as m
on e.id = m.man_id
where e.salary > m.salary
```

1. **write a query to get employees who belong to departments with less than 3 employees.**

```sql
select e.* from employees as e
join department as d
on e.id = d.id
where e.dep_id in( select dep_id from employees 
group by dep_id
having count(*) < 3)
```

```sql
select * from employees as e
where dep_id in (select d.dep_id,count(*) emp_count from department as d
group by d.dep_id
having count(*) <3
```

1. **How to write a query to find employees with the same first name?**

```sql
select * from employees
where first_name in 
(select first_name  from employees 
group by first_name
having count(*)>1
```

```sql
select first_name, count(*) as emp_count from employees
group by first_name
having count(*) >1
```

1. **How to write a query to delete employees who have been in the company for more than 15 years?**

```sql
delete from employees 
where date_of_joining <= current_date - interval 15 year 

delete from employees
where datediff(year, date_of_joining, getdate()) > 15
```

1. **write a query to list all employees working under the same manager.**

```sql
SELECT 
    e1.employee_id,
    e1.employee_name,
    e1.manager_id,
    e2.employee_name AS manager_name
FROM 
    employees e1
JOIN 
    employees e2 ON e1.manager_id = e2.employee_id
ORDER BY 
    e1.manager_id, e1.employee_id;
```

```sql
SELECT e.id AS employee_id, e.name AS employee_name, m.name AS manager_name
FROM employees e
JOIN employees m
  ON e.managerId = m.id
ORDER BY m.name;

```

1. **How to find the top 3 highest paid employees in each department?**

```sql
select emp_id,dep_name, salary from ( 
select emp_id, dep_name,salary, dense_rank() over(partition by dep_name order by salary desc) rnk
from employees) ranked
where rnk <= 3
```

1. **write  a query to list all employees with more than 5 years of experience in each department.**

```sql
select * from employees 
where datediff(year, date_of_joining, current_date()) > 5

select * from employees
where timestampdiff(year, date_of_joining, curdate()) > 5

select * from employees
where date_of_joining <= current_date - interval 5 year

```

1. **How to list all employees in departments that have not hired anyone in the past 2 years?**

```sql
select * from employees 
where dep_id not in(select distinct dep_id from employees 
where date_of_joining >= current_date() - interval 2 year)
```

```sql
select e1.* from employees e1 
where not exists 
(select 1 from employees e2 
where e2.dep_id = e1.dep_id and 
timestampdiff(year, e2.date_of_joining, curdate()) <=2
```

1. **write a query to find all employees who earn more than the average salary of their department.**

```sql
select * from employees e1
where salary > (select avg(salary) from employees e2
where e2.dep_id = e1.dep_id)
```

1. **How to list all managers who have more than 5 subordinates?**

```sql
select man_id, count(*) as sub_ordin from employees
group by man_id
having count(*) > 5
```

```sql
select * from employees
where emp_id in (select man_id from employees 
group by man_id
having count(*) > 5)
```

1. **how to find employees whose salary is in the top  10%**

```sql
select * from 
( select *, percent_rank() over(order by salary desc) as rnk
from employees) ranked
where rnk <= 0.1 
```

```sql
select * from 
( select *, ntile(10) over(order by salary desc) as rnk
from employees) ranked
where rnk =10
```

1. **write a query to display employees grouped by their age brackets (e.g. 20-30, 31-40 etc)**

```sql
select case 
when age between 20 and 30 then '20-30'
when age between 31 and 40 then '31-40'
else '41+'
end as age_bracket,
count(*) from employees
group by age_bracket
```

1. **How to find the average salary of the top 5 highest paid employees in each department?**

```sql
select dep_id, avg(salary) 
from (select dep_id, salary,
row_number() over(partition by dep_id order by salary desc) as rnk
from employees) as ranked
where rnk <= 5
group by dep_id
```

```sql
with ranked_salary as (
select dep_id, salary, 
row_number() over(partition by dep_id order by salary desc) as rnk
from employees
)
select dep_id, avg(salary) as avg_salary
from ranked_salary
where rnk <= 5
group by dep_id
```

1. **How to calculate the percentage of employees in each department?**

```sql
select dep_id, count(*) as emp_count, 
round(100.0 * count(*)/(select count(*) from employees),2) as percent_count
from employees
group by dep_id
```

1. **write a query to display the highest, lowest, and average salary for each job role.**

```sql
select roll_id,max(salary) as highsalary, avg(salary) as avgsalary, min(salary) as minsalary
from empoyees 
group by roll_id
```

1. **Write a query to list employees in departments that have fewer than 5 employees**

```sql
select * from department where dep_id in
(
select dep_id from department
group by dep_id
having count(*) < 5
```