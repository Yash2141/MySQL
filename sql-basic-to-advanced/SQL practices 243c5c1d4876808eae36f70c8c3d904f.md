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
select d.name, count(*) as count_emp from employee as e
join department d
on e.id = d.id
group by count_emp
order by id desc
limit 1;
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
FROM employee e
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
```

1. **How to delete all employee from a department in one query?**

```sql
delete form department where dep_id = 10;
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

1. **write a query to fetch all employees whose nae end with ‘n’.**

```sql
select * from employees where name like '%n'
```

1.