# SQL - Structured Query Language

## what is data ?

Data is a collection of raw facts, like numbers, words, or observations, that can be stored and used to understand or analyze something. For example, the names and ages of customers in a table is data.

## What is Database?

A database is a collection of data that is stored in a structured way, usually in tables, so you can easily find, update, and manage the information.

Databases help keep data organized and allow us to retrieve or modify it quickly using SQL.

## **Type of Database:**

1. **Relational Database**

- Stores data in tables (rows and columns), with relationships between them.
- Think of it like Excel sheets where each sheet is linked to another.
- **Example**:
    - A school database with tables: `Students`, `Courses`, `Enrollments`
- **Popular Tools**: MySQL, PostgreSQL, Oracle, SQL Server

Banking systems, e-commerce websites, employee databases.

### 2. **NoSQL Database**

- **Non-tabular format**: These are used for unstructured or semi-structured data Can store data as documents, key-value pairs, graphs, or columns.
- Good for unstructured or flexible data.
- **Popular Tools**: MongoDB (document), Redis (key-value), Cassandra (wide-column),Neo4j (graph)
- Social media apps, chat apps, recommendation engines.

### **3. In-Memory Database**

- Stores data in **RAM** (instead of disk) for super-fast access.
- Best for: Real-time analytics, caching
- **Example**:
    - Redis used to quickly show the most recent notifications

### 4. **Graph Database**

- Stores data as nodes and edges (relationships).
- Social networks, recommendation engines
- **Example**:
    - A database showing “User A follows User B”
- **Popular Tool**: Neo4j

🔗 Think of it like a spider web — all about connections.

### 5. **Time-Series Database**

- Specially designed to store **data over time**.
- Monitoring, sensor data, logs
- **Example**:
    - Tracking website traffic every minute
- **Popular Tool**: InfluxDB

🕒 Think of it like a line graph that keeps growing.

### 6. **Object-Oriented Database**

- Stores data as objects (like in OOP programming).
- Applications using complex data and object models
- **Example**: db4o, ObjectDB
    - A multimedia app storing video, image, and audio objects

## Evolution of Databases

### 1. **Flat Files (Before 1970s)**

- Data was stored in text files like `.txt` or `.csv`
- No structure, hard to search or update
- Example: A text file listing all employees

💡 **Problem**: No way to relate different types of data easily (like employees and departments)

---

### 2. **Hierarchical Databases (1970s)**

- Data stored like a **tree** (parent-child structure)
- Example: One company has many departments, each department has many employees

💡 **Problem**: Hard to rearrange or query data unless it fits a strict tree shape

---

### 3. **Network Databases**

- More flexible than hierarchical: allowed **many-to-many** relationships
- Used pointers to connect records

💡 **Problem**: Complex to manage; needed special knowledge to navigate

---

### 4. **Relational Databases (1980s–Present)**

- **Game changer** — proposed by **Edgar F. Codd**
- Data stored in **tables** (rows and columns)
- Use **SQL** to query and manage data
- Examples: MySQL, PostgreSQL, Oracle, SQL Server

💡 **Advantage**: Easy to understand, flexible, powerful queries

---

### 5. **Object-Oriented Databases (1990s)**

- Combined object-oriented programming with databases
- Stored data as objects (used in C++, Java)

💡 **Problem**: Not widely adopted due to complexity and lack of standard

---

### 6. **NoSQL Databases (2000s–Now)**

- Designed for **big data**, scalability, flexibility
- Not just tables: can be **key-value**, **document**, **graph**, or **column-based**
- Examples: MongoDB (document), Redis (key-value), Neo4j (graph), Cassandra (column)

💡 **Used when**: data is huge, unstructured, or changing frequently

---

### 7. **NewSQL Databases**

- Combine the **speed of NoSQL** with the **reliability of SQL**
- Try to get the best of both worlds
- Examples: Google Spanner, CockroachDB

---

### 8. **Cloud Databases (Now & Future)**

- Databases run on the cloud (e.g., AWS, Azure, GCP)
- Auto-scaling, backup, and maintenance built-in
- Examples: Amazon RDS, Google BigQuery, Azure SQL

💡 **Future trend**: serverless, real-time, AI-integrated databases

## **SQL** stands for **Structured Query Language**.

It is the language used to talk to databases.

SQL(Structured Query Language) is a programming language 
designed for managing and manipulating data stored in relational 
databases.

You use SQL to:

- Read data from a database
- Add, update or delete data

**example:-**

Show me the names of all employees in the HR department

```sql
SELECT name FROM employees WHERE department = 'HR';
```

 **SQL vs MySQL**

| Feature | **SQL** | **MySQL** |
| --- | --- | --- |
| 🧠 **What is it?** | A **language** used to interact with databases | A **database system** (software) that uses SQL |
| 📄 **Function** | Tells the database what to do: fetch, add, update, delete | Actually stores and manages the data |
| 🗣️ **Example** | `SELECT * FROM users;` | MySQL understands this command and gives you the data |

## **Database Languages** or **SQL Sub-languages**

Communicates with the database used to create and maintain database on computer

there are five type of database language.

1. DDL – **Data Definition Language:** 

DDL is used to define or change the structure of a database (like creating or modifying tables).

| `CREATE` | Makes a new table, database, view, index, etc. |
| --- | --- |
| `ALTER` | Changes an existing table (add/modify columns) |
| `DROP` | Deletes a table, database, or object entirely |
| `TRUNCATE` | Deletes all rows from a table **faster** than DELETE (can’t undo) |
| `RENAME` | Renames a table or column |

2. DML – **Data Manipulation Language:** 

DML is used to add, change, or delete the actual data inside tables.

| `INSERT` | Adds new rows into a table |
| --- | --- |
| `UPDATE` | Changes existing data in one or more rows |
| `DELETE` | Removes rows from a table |
| `MERGE` | Combines INSERT, UPDATE, and DELETE in one (for upsert logic) |
| `SELECT` | used to retrieve data  |

3. DCL – **Data Control Language:** 

DCL is used to control access to data in a database. It's all about who can do what.

| `GRANT` | Gives a user permission to perform actions (e.g., SELECT, INSERT) |
| --- | --- |
| `REVOKE` | Removes previously granted permissions |
|  |  |

4. TCL – **Transaction Control Language:** 

TCL is used to manage changes made by DML statements (like INSERT, UPDATE, DELETE). It helps ensure that changes are saved properly or undone if something goes wrong.

| Command | What it does (Simple Explanation) |
| --- | --- |
| `BEGIN` | Starts a transaction (may be implicit in some DBs) |
| `COMMIT` | Saves all changes made in the current transaction |
| `ROLLBACK` | Undoes changes in the current transaction |
| `SAVEPOINT` | temporarily save a transaction so that you can rollback that point whenever necessary |
| `SET TRANSACTION` | Sets properties like isolation level |
1. DQL - **Data Query Language:-**

SELECT-Retrieve and view data form one or many tables

**SQL Commands:-**

### 1. **`SELECT`**

Retrieves data from a table.

```sql
SELECT column1, column2 FROM table_name;
SELECT name, age FROM employees;
```

### 2. **`FROM`**

Specifies the table to retrieve data from.

```sql
SELECT * FROM customers;
```

### 3. **`WHERE`**

 Filters records based on a condition.

```sql
SELECT * FROM products WHERE price > 100;
```

### 4. **`AND` / `OR` / `NOT`**

Combines multiple `WHERE` conditions.

```sql
SELECT * FROM employees WHERE department = 'HR' AND age < 30;
SELECT * FROM employees WHERE NOT department = 'Finance';
```

### 5. **`ORDER BY`**

**Purpose**: Sorts the result set by one or more columns.

```sql
SELECT * FROM customers ORDER BY name ASC;
SELECT * FROM customers ORDER BY age DESC;
```

### 6. **`LIMIT`**

Restricts the number of rows returned.

```sql
SELECT * FROM orders LIMIT 5;
```

### 7. **`DISTINCT`**

Removes duplicate values from results.

```sql
SELECT DISTINCT country FROM customers;
```

### 8. **`AS` (Alias)**

 Renames a column or table temporarily for readability.

```sql
SELECT name AS employee_name FROM employees;
```

### 9. **`IN`**

Filters results where a value matches any in a list.

```sql
SELECT * FROM employees WHERE department IN ('HR', 'IT');
```

### 10. **`BETWEEN`**

Checks if a value falls within a range (inclusive).

```sql
SELECT * FROM products WHERE price BETWEEN 50 AND 100;
```

### 11. **`LIKE`**

 Searches for a pattern in a column.

```sql
SELECT * FROM customers WHERE name LIKE 'A%';
```

### 12. **`IS NULL` / `IS NOT NULL`**

Checks for `NULL` (missing) values.

```sql
SELECT * FROM employees WHERE manager_id IS NULL;
```

### 13.  **(Asterisk)**

**Purpose**: Selects all columns.

```sql
SELECT * FROM employees;
```

### 14. **`INSERT INTO`**

 Adds new data into a table.

```sql
INSERT INTO table_name (column1, column2)
VALUES ('value1', 'value2');

INSERT INTO employees (name, age)
VALUES ('Alice', 30);
```

### 15. **`UPDATE`**

 Modifies existing data in a table.

```sql
UPDATE table_name
SET column1 = value1
WHERE condition;

UPDATE employees
SET age = 31
WHERE name = 'Alice';

```

### 16. **`DELETE`**

 Removes rows from a table.

```sql
DELETE FROM table_name
WHERE condition;

DELETE FROM employees 
WHERE name = 'Alice';
```

### 17. **`CREATE TABLE`**

 Defines a new table and its columns.

```sql
create table employee(
    id INT Primary key,
    name varchar(20),
    age int
    );
```

### 18. **`DROP TABLE`**

 Deletes an entire table permanently.

remove the database objects(such as table,view,functions etc)form database               

```sql
DROP TABLE employees;
```

### 19. **`ALTER TABLE`**

modify structure of an existing table.
can be used to rename a table, rename a column, modify column data type, add new columns, remove columns, add constraints, remove constraints etc.

```sql

-- Add a new column
ALTER TABLE employees ADD email VARCHAR(100);

-- Drop a column
ALTER TABLE employees DROP COLUMN email;

--Drop a column
ALTER TABLE employee DROP COLUMN date;

-- Rename column
ALTER TABLE employees RENAME COLUMN age TO employee_age;

-- Rename the table
ALTER TABLE employee to new_employee;

-- Change the data type of a column
ALTER TABLE employee ALTER COLUMN  age type varchar(5);

```

### 20. **`TRUNCATE TABLE`**

 Deletes all rows in a table (faster than DELETE) but cannot be rolled back.

```sql
TRUNCATE TABLE employees;
```

### **21.`CREATE DATABASE` / `DROP DATABASE`**

 Manages databases.

```sql
CREATE DATABASE my_db;
DROP DATABASE my_db;
```

### 22. **`UNION` / `UNION ALL`**

**Purpose**: Combines result sets from two queries.

```sql
SELECT name FROM customers
UNION
SELECT name FROM suppliers
```

- `UNION`: The `UNION` function combines the results of two or more `SELECT` queries into a single result set, removing duplicate rows.
- `UNION ALL`: The `UNION ALL` function combines the results of two or more `SELECT` queries, including all duplicate rows. This function is faster than `UNION` because it doesn’t bother removing duplicates.

### 23. **`CASE`**

 Adds conditional logic in queries.

```sql
SELECT name,
       CASE
           WHEN age < 18 THEN 'Minor'
           ELSE 'Adult'
       END AS age_group
FROM employees;

SELECT emp_id, salary 
	CASE WHEN salary >= 50000 THEN 'high salary'
	WHEN salary between 30000 AND 40000 THEN 'Average Salary'
	WHEN salary < 15000 THEN 'low'
	END AS Range
 FROM employee;
```

### 24. **`GROUP BY`**

 Groups rows with the same values for aggregation.

The `GROUP BY` statement is often used with aggregate functions (COUNT(),MAX(),
MIN(), SUM(),AVG()) to group the result-set by one or more columns.

```sql
SELECT department, COUNT(*) AS num_employees
FROM employees
GROUP BY department;
```

### 27. **`HAVING`**

 Filters groups after aggregation.

The `HAVING` clause was added to SQL because the `WHERE` keyword cannot be 
used with aggregate functions.

```sql
SELECT department, COUNT(*) AS num_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
```

### 28. `OFFSET`

`OFFSET` is used to skip a specific number of rows before starting to return the result set. It is commonly used with the `LIMIT` clause to implement pagination (i.e., showing data page by page).

Page 1 (First 2 products):

```sql
SELECT * FROM products
ORDER BY id
LIMIT 2 OFFSET 0;
```

Page 2 (Next 2):

```sql
SELECT * FROM products
ORDER BY id
LIMIT 2 OFFSET 2;
```

**Working with Dates & Time**

1. `NOW()`

Returns the current date and time (timestamp).

```sql
SELECT NOW();
```

2. `DATE()`

Extracts just the date (YYYY-MM-DD) from a datetime or timestamp.

```sql
SELECT DATE(order_date) AS only_date
FROM orders;
--output 2021-02-01
```

3. `DATEDIFF()`

Returns the number of days between two dates.

```sql
SELECT DATEDIFF('2025-08-01', '2025-07-01') AS days_between;
-- Output: 31
```

4. `DATE_ADD()`

Adds a specific interval (e.g., days, months) to a date.

```sql
SELECT customer_id,
       DATE_ADD(subscription_start, INTERVAL 1 YEAR) AS expiry_date
FROM customers;
```

5. `EXTRACT()`

Pulls out a part of the date (like year, month, day, etc.)

```sql
SELECT *
FROM orders
WHERE EXTRACT(MONTH FROM order_date) = 7;
```

**Questions:**

```sql
-- count no of students in each class
select class_id, count(*) as 'no_of_student" from class
group by class_id
order by class_id
```

```sql
-- More than 100 students in each class
select class_id, count(*) as 'no_of_student" from class
group by class_id
having count(*) > 100
order by class_id
```

```sql
-- parents with more than 1 kid in school
select parent_id, count(*) as 'no_of_kids"
form parents
group by parent_id
having count(*) > 1;
```

```sql
-- average salary pay to non-teaching staff

SELECT avg(ss.salary) FROM staff_salary as ss
JOIN staff stf
ON stf.id = ss.id
WHERE stf = 'Non-teaching'

```

## **What is a JOIN in SQL?**

In SQL, a JOIN is used to combine rows from two or more tables based on a related column between them. 

### **INNER JOIN**

An INNER JOIN returns only those records that have matching values in both tables.

```sql
-- fetch the empoyee name and the department name they belong to.
SELECT e.emp_name, d.dept_name
FROM employee e 
INNER JOIN department d 
ON e.dep_id = d.dept_id;
```

### **LEFT JOIN**

A LEFT JOIN returns all rows from the left table (employee), and the matched rows from the right table (department). If no match is found, it returns `NULL` for the right table columns.

```sql
--left join = inner join + any additional records in the left table.
SELECT e.emp_name, d.dept_name
FROM employee e 
LEFT JOIN department d 
ON e.dep_id = d.dept_id;
```

### **RIGHT JOIN**

A RIGHT JOIN returns all rows from the right table (department), and the matched rows from the left table (employee). If no match is found, it returns `NULL` for the left table columns.

```sql
-- --right join = inner join + any  additional records from the right table.
SELECT e.emp_name, d.dept_name
FROM employee e 
RIGHT JOIN department d 
ON e.dep_id = d.dept_id;
```

### **FULL JOIN (FULL OUTER JOIN)**

Returns all records from both tables. If there is no match, it fills with `NULL`.

**FULL JOIN** = INNER JOIN + all remaining records from the left table (with `NULL` for columns from the right table) + all remaining records from the right table (with `NULL` for columns from the left table)

```sql
SELECT e.emp_name, d.dept_name
FROM employee e
FULL OUTER JOIN department d ON e.dep_id = d.dept_id;
```

### **CROSS JOIN**

Returns a Cartesian product — every row from the first table is combined with every row from the second table.

```sql
SELECT e.emp_name, d.dept_name
FROM employee e
CROSS JOIN department d;
--If employee has 4 rows and department has 3 rows → 4 × 3 = 12 rows in result.
```

### **NATURAL JOIN**

A `NATURAL JOIN` automatically joins tables based on all columns with the same name and datatype in both tables.

**Caution:** Not recommended for production use — it can lead to unexpected results if column names change or new ones are added.

```sql
SELECT *
FROM employee
NATURAL JOIN department;
```

### **SELF JOIN**

A `SELF JOIN` is when a table is joined to itself — useful for hierarchical data like employee-manager relationships.

**Example:**

```sql
SELECT e1.emp_name AS employee, e2.emp_name AS manager
FROM employee e1
JOIN employee e2 ON e1.manager_id = e2.emp_id;

--Result:
--employee   manager
--Alice      NULL
--Bob        Alice
--Charlie    Alice
--David      Bob
```

### Subquery in SQL?

A subquery (also known as an inner query or nested query) is a query embedded inside another SQL query. It is used to return data that will be used in the main query (also called the outer query).

**Types of Subqueries:**

1. **Scalar Subquery**: Returns a single value.

```sql
--Find the names of employees who earn more than the average salary of all employees.
SELECT name FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);
```

1. **Row Subquery**: Returns a single row with multiple columns.

```sql
/* Find the employee(s) who earn the highest salary in any one department
 (only one department due to LIMIT 1). */
SELECT * FROM employees WHERE (department_id, salary) = 
(SELECT department_id, MAX(salary) FROM employees GROUP BY department_id LIMIT 1);
```

1. **Column Subquery**: Returns a single column of values.

```sql
-- Find the names of employees who work in departments located in New York (NY).
SELECT name FROM employees WHERE department_id IN 
(SELECT department_id FROM departments WHERE location = 'NY');
```

**examples:**

```sql
--find the employees who earn the highest salary in  each department
SELECT *
FROM employee
WHERE (dept_name, salary) IN (
    SELECT dept_name, MAX(salary)
    FROM employee
    GROUP BY dept_name
);
```

```sql
-- find the department who do not have any employees
SELECT *
FROM departments
WHERE department_id NOT IN (
    SELECT DISTINCT department_id
    FROM employees
);
```

### What is a CTE (WITH Clause)?

A CTE is like creating a temporary table or view inside your SQL query. It makes your query cleaner, easier to read, and more manageable especially when working with complex joins or subqueries.

```sql
WITH it_employees AS (
    SELECT * FROM employees WHERE department = 'IT'
)
SELECT * FROM it_employees
WHERE salary > 6000;
```

### Advantages of CTEs:

1. Improves readability – Breaks down complex queries into simpler parts.
2. Reusable in the same query – You can refer to the CTE multiple times.
3. Supports recursion – Useful for hierarchical data (e.g., org charts).
4. Easier to maintain – Cleaner than using subqueries everywhere.

### What is a Window Function?

A window function in SQL performs a calculation across a set of table rows that are somehow related to the current row. Unlike regular aggregate functions (SUM, AVG, etc.), window functions do not collapse rows into one—they return a value for every row.

### Why Use Window Functions?

Window functions are great when you want to:

- Get a running total
- Find a row’s rank
- Compare a row with the previous or next row
- Get values within a group, but without grouping the results

### **OVER() Clause**

All window functions use the `OVER()` clause, which tells SQL how to group (PARTITION BY) and how to order (ORDER BY) the data for the function to work.

it’s create window for multiple rows.

- `PARTITION BY` — divides the data into groups (like GROUP BY).
- `ORDER BY` — orders rows within each group.

## 1. `ROW_NUMBER()`

Gives a unique number to each row within a partition.

```sql
/* this assigns a unique row number to each employee within their department,
based on amount (highest first).*/

SELECT employee, department, amount,
       ROW_NUMBER() OVER (PARTITION BY department ORDER BY amount DESC) AS rank
FROM sales;
```

### 2. **RANK() and DENSE_RANK()**

- `RANK()` skips numbers if there’s a tie.
- `DENSE_RANK()` does not skip numbers.

```sql
SELECT employee, amount,
       RANK() OVER (ORDER BY amount DESC) AS rank,
       DENSE_RANK() OVER (ORDER BY amount DESC) AS dense_rank
FROM sales;
```

3. **LAG() and LEAD()** – Previous and next row values

`LAG()` shows the previous row's value, and 

`LEAD()` shows the next row's value based on the order.

```sql
SELECT employee, amount,
       LAG(amount) OVER (ORDER BY sale_date) AS previous_sale,
       LEAD(amount) OVER (ORDER BY sale_date) AS next_sale
FROM sales;
```

example:

```sql
--fetch the first 2 employees form each department to join the company

select * from(
select  e.*, row_number() over(partition by dept_name order by  emp_id) as rn
from employee e) x
where x.rn <3;
```

```sql

--fetch the top 3 employees in each department earning the max salary
select * from(
select e.*, rank() over(partition by dep_name order by salary desc) as rnk from employee e) x
where x.rnk < 4;

```

### What are Constraints in SQL?

Constraints are rules applied to columns or tables to enforce data integrity, accuracy, and consistency.

They ensure that only valid data is inserted into a table.

 **Types of SQL Constraints:-**

### 1.  `PRIMARY KEY`

Primary key is used to uniquely identify records in database table.

- Uniquely identifies each record.
- Only **one primary key** per table.
- Cannot be `NULL`.

### 2.  `FOREIGN KEY`

Foreign key is used to link two table together.

- Establishes a **relationship** between two tables.
- References the **primary key** of another table.

### 3. `UNIQUE`

- The UNIQUE constraint uniquely identify each record in a database table.
- There can be many unique constraints per table.
- A unique key column can contain null value

### 4. `NOT NULL`

- Prevents NULL values in a column.

### 5. `CHECK`

- Enforces a condition on the values.

### 6. `DEFAULT`

- Assigns a default value if none is specified.

### **What are Keys in SQL?**

keys are special type of constrain that used to establish relationships and  uniqueness in database

**there are following keys:**

1. primary key
2. foreign key
3. composite key
4. candidate key 
5. alternate key
6. surrogate key

 

**Composite key:** 

composite key is uses two or more columns to make unique key.

ex:- a student can enroll multiple courses ,but once per course

student_id and course_id is together to make unique key.

Note: student can’t enroll in the same course twice.

```sql
CREATE TABLE Enrollments (
  student_id INT,
  course_id INT,
  PRIMARY KEY (student_id, course_id)
);
```

**Candidate key:**

A candidate key is column or set of column in that uniquely  each row. and is a candidate key to become a primary key

- It must have unique values (no duplicates).
- It cannot be NULL.
- A table can have multiple candidate keys.
- From the candidate keys, we choose one to be the Primary Key.
- The others become Alternate Keys.

**Alternate key:**

Alternate key is once you choose the primary key, the other candidate key becomes Alternate key.

**Super key:**

A super key is any combination of multiple columns in a table that can uniquely idetify a row.

1. Every Primary Key is a Super Key.
2. But not every Super Key is a Primary Key.

All of these are **Super Keys**:

1. `emp_id`, `email`, `phone`,`emp_id + email`

**Surrogate key:**

A system generated key with no meaning like an AUTO_INCREMENT ID.

It has no real-world meaning  it’s just a placeholder ID that acts as the Primary Key.

## What is a Transaction?

In databases, a transaction is a group of operations that:

> Must either happen completely or not happen at all.
> 

Just like a **bank transaction**, where either:

- Money is debited from your account and credited to another
    
    OR Nothing happens at all, if something fails
    

### example:

Imagine you're sending ₹100 to a friend using a mobile app like Google Pay or PhonePe.

- First, ₹100 is taken from your account
- Then, ₹100 is added to your friend’s account

If Step 1 succeeds and Step 2 fails (e.g., due to a crash), then money is lost. That's unacceptable.

So both steps must succeed together or fail together → That’s a transaction.

## ACID Properties

To ensure transactions are safe, reliable, and consistent, databases follow ACID properties.

### 1. **Atomicity**

 All steps must be done, or none at all

example: You go to an ATM.

- You enter ₹500 withdrawal
- If cash doesn’t come out, your money should not be deducted

 **Database ensures**: if even one step fails, entire transaction is rolled back.

### 2. **Consistency**

> The data must stay correct before and after the transaction.
> 

example:

A bank has rules — like “nobody can have a negative balance”.

If a transaction breaks this rule, it **must be cancelled**.

 Consistency means rules are always followed.

### 3. **Isolation**

> Two people can do things at the same time without messing each other up.
> 

example:

You and your brother both try to buy pizza online at the same time using the same card.

The system must make sure:

- Your payment and his payment don’t get mixed
- You don’t spend the same money twice

### 4. **Durability**

> Once done, the result stays saved — even if the system crashes.
> 

📱 Real-life:

You transfer money to a friend.

You get a “Payment successful” message.

Then your app crashes or your phone shuts down.

Still, the money is sent and it doesn’t vanish.

## What is Normalization in SQL?

Normalization is a process of organizing data in a database to reduce redundancy (repeated data)

and ensure data integrity.

To avoid insertion, update and deletion anamoly

Normalization is divides large table into smaller tables and link them using relationships

| emp_id | name | address | dept |
| --- | --- | --- | --- |
| 1 | ajay | usa | sales |
| 1 | ajay | usa | product |
| 2 | sharad | uk | account |

Here: dept have not null constrain

what if emp_id = 2 does not have any dept yet, but you can’t keep is null

what if i need to change dept of emp_id = 1 form sales to IT, but here both would be change

what if i want to delete emp_id = 1, but here both would be deleted

## Why Use Normalization?

- Eliminates data duplication
- Ensures data consistency
- Improves query efficiency
- Makes the database easier to maintain

### Types of Normalization:

**1NF (First Normal Form)**

- Each cell should contain only one value (no arrays, no lists).
- Each record should be unique.

**Table** (Not in 1NF):

| StudentID | Name | Courses |
| --- | --- | --- |
| 101 | Alice | Math, Physics |
| 102 | Bob | Chemistry |

Split `Courses` into separate rows:

| StudentID | Name | Course |
| --- | --- | --- |
| 101 | Alice | Math |
| 101 | Alice | Physics |
| 102 | Bob | Chemistry |

**2NF (Second Normal Form)**

- Must be in 1NF
- No partial dependency

### 🤔 What is Partial Dependency?

> A column is partially dependent if it depends on part of a composite primary key, not the full key.
> 

Suppose this table:

| StudentID | CourseID | StudentName |
| --- | --- | --- |
| 1 | MATH01 | Alice |
| 1 | PHYS01 | Alice |
| 2 | CHEM01 | Bob |

Here, primary key = `(StudentID, CourseID)` (composite key)

But `StudentName` depends only on `StudentID`, not on both that’s a partial dependency.

Split the table:

**Students:**

| StudentID | StudentName |
| --- | --- |
| 1 | Alice |
| 2 | Bob |

**Enrollments:**

| StudentID | CourseID |
| --- | --- |
| 1 | MATH01 |
| 1 | PHYS01 |
| 2 | CHEM01 |

Now each non-key column depends on the **full primary key** — no partial dependency 

**3NF – Third Normal Form**

- Must be in 2NF
- No transitive dependency

### What is Transitive Dependency?

A non-key column depends on another non-key column, instead of depending directly on the primary key.

| EmployeeID | EmployeeName | DeptID | DeptName |
| --- | --- | --- | --- |
| 101 | Alice | D1 | HR |
| 102 | Bob | D2 | Finance |

Here:

- Primary key: EmployeeID
- DeptName depends on DeptID, which depends on EmployeeID → transitive

   

Split into two tables:

**Employees:**

| EmployeeID | EmployeeName | DeptID |
| --- | --- | --- |
| 101 | Alice | D1 |
| 102 | Bob | D2 |

**Departments:**

| DeptID | DeptName |
| --- | --- |
| D1 | HR |
| D2 | Finance |

Now `DeptName` doesn’t depend on `EmployeeID`

## What is a **Stored Procedure** in SQL?

A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.

So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.

You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed.

### ✅ Why use it?

- Reusable and maintainable
- Increases performance (precompiled)
- Adds security by controlling access to data

```sql
CREATE PROCEDURE procedure_name
AS
BEGIN
   -- SQL statements
END;
```

### Example: Stored Procedure (No Parameters)

```sql
CREATE PROCEDURE GetAllEmployees
AS
BEGIN
    SELECT * FROM Employees;
END;
```

To call it:

```sql
EXEC GetAllEmployees;
```

## What is a **Trigger** in SQL?

A Trigger is a special kind of stored procedure that automatically runs when a certain event happens on a table.

### ✅ When does it run?

- `AFTER` or `BEFORE` an `INSERT`, `UPDATE`, or `DELETE`

## What is **Data Modeling**?

Data Modeling is the process of visually and logically designing the structure of a database — including how data is stored, related, and organized.

Think of it as blueprint of your database, just like an architect creates a blueprint for a building.

 **Example:**

Imagine you’re building an app like **Amazon**.

You need to store:

- Customer details
- Orders
- Products
- Payments

You can’t just dump everything in one table.

So you design a data model like this:

- A `Customer` table (customer_id, name, email)
- An `Orders` table (order_id, customer_id, date)
- A `Products` table (product_id, name, price)
- A `Payments` table (payment_id, order_id, amount)

This structure and relationships between them is your data model.

### Types of Data Models:

1. **Conceptual Model** – High-level overview (e.g., entities like "Customer", "Order")
2. **Logical Model** – Relationships & attributes (like ER diagram)
3. **Physical Model** – Actual implementation in SQL (tables, columns, types, constraints)

### What is Denormalization?

Denormalization is the process of intentionally adding redundancy (duplicate data) to improve read performance.

Basically, combining tables or repeating data to make queries faster (at the cost of some storage or data consistency risk).

**Example:**

In normalized form:

- `Orders` table only stores `customer_id`
- You must JOIN with Customers table to get customer name or address

In denormalized form:

- `Orders` table directly stores `customer_name`, `customer_address` — avoiding the JOIN

## What is a View in SQL?

A View is a virtual table based on a SQL query. It doesn’t store data itself, it just shows data from one or more tables when you query it.

```sql
CREATE VIEW hr_view AS
SELECT name, department
FROM employees;

SELECT * FROM hr_view;

```

## What is a Materialized View?

A Materialized View is similar to a view, but it stores the result of the query physically like a table.

> 🔹 It is like a snapshot of the data.
> 

You can refresh it manually or automatically to keep it up-to-date

**example**: If you often need a report that shows total sales per customer, and the data doesn't change frequently — use a materialized view.

```sql
CREATE MATERIALIZED VIEW customer_sales_summary AS
SELECT customer_id, SUM(amount) AS total_sales
FROM sales
GROUP BY customer_id;

SELECT * FROM customer_sales_summary;
```

## what is Index in sql ?

Indexes are used to retrieve data from the database more quickly than otherwise. The users cannot see the indexes, they are just used to speed up searches/queries.

Without an index, the database does a full table scan (i.e., checks every row).
With an index, it can jump directly to the needed row(s)

```sql
CREATE INDEX idx_pname
ON Persons (LastName, FirstName); 

select  firstname, lastname from persons;
```