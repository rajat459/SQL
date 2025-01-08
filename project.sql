use sakila;
select * from new_employe;
# List the top 3 most recently joined employees along with their name, department, and joining date.
select  Name ,Department, JoiningDate from new_employe order by JoiningDate desc limit 3;

# ---Retrieve employees who earn above the average salary.
select name, department, salary
from new_employe e
where salary > (
    select avg(salary) from new_employe where department = e.department
);

# Find the top-rated employee in each location.

select name, location, rating,Department
from (select name, location, Department,rating,rank() over (partition by Department order by rating desc) as ranked
    from new_employe
)ranked2 where ranked = 1;

#4-------Find the average, minimum, and maximum salary for employees in each location.
select location, avg(salary) as avg_salary, min(salary) as min_salary, max(salary) as max_salary
from new_employe
group by location;

#5------Group employees into age ranges (e.g., 20–30, 31–40) and count them.
select case
       when age between 20 and 30 then '20-30'
       when age between 31 and 40 then '31-40'
       when age between 41 and 50 then '41-50'
       else '50+'
   end as age_group,
   count(*) as employee_count
from new_employe
group by age_group;

#6---------Write a query to find duplicate employee names and their counts in the dataset.
select name, count(*) as duplicate_count from new_employe group by name having count(*) > 1;

#7Group employees into experience ranges (e.g., 0–5, 6–10, etc.) and count them.
select
    case
        when experience between 0 and 5 then '0-5 years'
        when experience between 6 and 10 then '6-10 years'
        else '10+ years'
    end as experience_range,count(*) as employee_count from new_employe group by experience_range;
use rajat;
CREATE TABLE employees (
    employee_id int,
    first_name varchar(50),
    last_name varchar(50),
    device_serial varchar(15),
    salary int
);
INSERT INTO employees VALUES
    (1, 'John', 'Smith', 'ABC123', 60000),
    (2, 'Jane', 'Doe', 'DEF456', 65000),
    (3, 'Bob', 'Johnson', 'GHI789', 70000),
    (4, 'Sally', 'Fields', 'JKL012', 75000),
    (5, 'Michael', 'Smith', 'MNO345', 80000),
    (6, 'Emily', 'Jones', 'PQR678', 85000),
    (7, 'David', 'Williams', 'STU901', 90000),
    (8, 'Sarah', 'Johnson', 'VWX234', 95000),
    (9, 'James', 'Brown', 'YZA567', 100000),
    (10, 'Emma', 'Miller', 'BCD890', 105000),
    (11, 'William', 'Davis', 'EFG123', 110000),
    (12, 'Olivia', 'Garcia', 'HIJ456', 115000),
    (13, 'Christopher', 'Rodriguez', 'KLM789', 120000),
    (14, 'Isabella', 'Wilson', 'NOP012', 125000),
    (15, 'Matthew', 'Martinez', 'QRS345', 130000),
    (16, 'Sophia', 'Anderson', 'TUV678', 135000),
    (17, 'Daniel', 'Smith', 'WXY901', 140000),
    (18, 'Mia', 'Thomas', 'ZAB234', 145000),
    (19, 'Joseph', 'Hernandez', 'CDE567', 150000),
    (20, 'Abigail', 'Smith', 'FGH890', 155000);
    select * from employees;
    
    create index empl_sal on employees(salary);
    
    desc employees;
explain select * from employees where salary=10000;
 explain select * from employees where salary<90000;
drop index empl_sal on employees;
show indexes from employees;

    create index empl_sal on employees(salary, first_name);

 explain select * from employees where salary<90000;
  explain select * from employees where first_name='james';
  
   explain select * from employees where salary=10000 and first_name ='james';
   
   
   
   # what is the difference btw cluster index and non cluster index 
   The main difference between a clustered index and a non-clustered index lies in how data is stored and accessed in a database. Here's a breakdown:

1. Clustered Index
Definition: A clustered index determines the physical order of data in a table. The rows in the table are stored on disk in the same order as the clustered index.

Physical Sorting: The table itself is sorted based on the clustered index.

One Per Table: A table can have only one clustered index because the data can only be physically sorted in one way.

Direct Access: Since the data is physically stored in the order of the clustered index, it allows faster retrieval for range queries.

Example Use Case: A primary key is often used as a clustered index because it provides a unique and ordered way to store data.

Analogy: Think of a clustered index as a phone book where names (the index) determine the physical order of entries.

2. Non-Clustered Index
Definition: A non-clustered index creates a separate structure from the table that points to the location of the actual data. It does not affect the physical order of the data in the table.

Logical Sorting: The data is not stored in the order of the non-clustered index; instead, a separate index table maintains the mapping.

Multiple Per Table: A table can have multiple non-clustered indexes to optimize queries based on different columns.

Slower for Data Retrieval: Retrieving data using a non-clustered index may involve an additional step to fetch the actual data from the table (called a bookmark lookup or RID lookup).

Example Use Case: Frequently searched columns (e.g., email or last_name) that aren't part of the clustered index are ideal for non-clustered indexes.

Analogy: Think of a non-clustered index as the index section at the back of a book, pointing you to the page number where the actual content resides.




    

