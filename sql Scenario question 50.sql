
1:write a query to retrive  name, and salaries of employees
   from employees tables and where department is finance?
select first_name,last_name,salaries from employees
where department='finance';

2:You need to add a new employee named
 John Doe to the employees table with a
 salary of 50,000 and a department of HR.?
 insert into employees(first_name,last_name,salary,department)
 values('john','Doe',50000,'HR');
 
 3:You need to increase the salary of all
 employees in the IT department by 10%.
 update employees
 set salary=salary*0.10
 where department='IT';
 
 4:The HR department has been closed,
 and all employees in HR must be
 removed from the database?
 delete  from employees 
 where department ='HR';
 
 5:You need to create a table that stores
 product prices, including whole
 numbers and decimal values
 
 create table products(
 product_id int primary key()
 Product_name varchar(100)
 price Decimal (10,2)
 quantity int;
 
 6:You need to filter employees with salaries
 between 30,000 and 60,000:
 select first_name,lastname,salaries from employees
 where salaries between 30000 and 60000;
 or
 where salaries >=30000 and <=60000;
 
 7:You want to retrieve employees whose
 salaries are not 40,000.
 select first_name,last_name salries from employees
 where salary!=40000;
 
 8:You need to find employees whose
 names contain the letter 'a'.?
 select (concat(first_name+last_name)) as name from employees
 where name like '%a%';
 
 9:You want to check if there are any
 employees in the Sales department?  (# checking if there are employees are not using subquery if it retuns result it its true)
 select EXISTS(select 1 from employees
 where department='Sales');
 
 10:You want to create a table that stores
 whether employees are active or
 inactive?
 create table employee_status(
 first_name varchar(100),
 employee_id primary key(),
 is_active Boolean();
 
 11:You need to retrieve the top 5 highest-paid
 employees from the employees table.?
 select first_name,last_name ,salaries from employees
 order by salaries desc
 limit 5;
 12:You want to calculate the total salary for
 each department?
 select department,sum(salary) as total_amount from employees
 group by department;
 
 13: You need to display departments with a
 total salary greater than 100,000?
 select department,sum(salary) as total_amount from employees
 group by department
 having sum(salary)>100000;
 14:You need to combine employees from
 two tables: employees_2023 and
 employees_2024.? 
 select first_name,last_name,salary from employees_2023 
 union( #no duplicates allowed)
 select first_name,last_name,salary from employees_2024;
 
 15:You want to keep duplicates while
 combining two datasets?
 select first_name,last_name,salary from employees_2023 
 union all( # duplicates allowed)
 select first_name,last_name,salary from employees_2024;
 
 16:You need to create a list of employees who
 belong to either the Finance or IT
 department?
 select first_name,last_name, department from employees
 where department in('IT','Finance');
 17:You need to calculate the average salary
 across all employees.?
 select  avg(salary) as avg_salary from employees;
 
 18:You need to find employees who don’t
 belong to the HR department.?
 select first_name, department from employees
 where department !='HR';
 or 
 where department Not in('HR');
 
 19:You need to retrieve only the first three
 employees in alphabetical order by
 their first names?
 select first_name,last_name from employees
 order by first_name asc
 limit 3;
 
 20:You want to join the employees table
 with the departments table to display
 employee names along with their
 department names?
 select e.first_name d.department_name from employees e
 join department d on e.department.id=e.employee_id;
 
 21:You need to retrieve employees who joined
 within the last six months.
 select  first_name,last_name,join_date from employees
 where join_date>=current_date-interval '6 months';
 
 22:You want to generate a list of employees
 with their total annual bonuses. Bonuses
 are 10% of their salary.?
 select first_name,salary,salary*0.10 as bonus from employees
 24:You need to assign unique IDs to each
 result row, grouped by department and
 ordered by salary
 
 25:You need to assign unique IDs to each
 result row, grouped by department and
 ordered by salary?
 select department,salary,first_name
 row number() over (partition by  department ordered by salary desc) as row_number
  from employees;
  
 26:You need to delete duplicate rows from  (#need to work)
 a table, keeping only one instance of
 each duplicate.?
 select count(*) as unique_columns from employees
 having count(*)>1;
 
 27: You want to list employees with their
 managers. Managers are also stored in
 the employees table?
 select e.first_name as employee_name m.first_name as manager_name
  from employees e leftjoin
  employee m on e.manager_id=e.employee_id
  28:You need to merge new employee records
 with existing ones. If an employee exists,
 update the salary; otherwise, insert the
 new employee?
 merged into employees e
 using new_employees n on e.employee_id=n.employee_id
 when matched then
 update set e.salary=n.salary
 when not matched then
 insert into(employee_id,first_name,last_name,salary)
 values(1,'hari','balu',1000);
 
 29: You need to find all employees who have
 not submitted their projects?
 select e.first_name from employee e
 left_join project_submission p on e.employee_id=p.employee_id
 where p.submission Is null;
 
 30: You want to display the total number of
 employees in each department,
 including departments with no
 employees.
 select d.department_name,count(e.employee_id) as employee_count
 from department d left join
 employees e from e.department_id= e.employment_id
 group by d.department_name
 
 31: You need to create a table that records
 the current timestamp when a row is
 inserted?
 create logs(
 log_id int primary key(),
 description varchar(250),
 created_at timestamp default current_timestamp;
 
 32:You want to ensure that each
 employee email is unique?
 create table employees(
 employee_id int primarykey(),
 first_name varchar(250),
 email  varchar(50) unique;
 
 33:You need to find the second highest salary
 from the employees table?
 select first_name,salary from employee
 order by salary desc
 limit 1 offset 1;
  or
  select max(salary) from employees
  where salary>(select max(salary) from employyes);
  
  34:You need to compare two columns in the
 same table to find discrepancies?
 here we can compare to columns using  where clause in sql:
 select first_name,last_name,salary,expected_salary from employees
 where salary!=expected_salary;
 35:You need to identify duplicate employee
 names in the employees table?
 select  first_name,last_name count(*) from employees
 group by first_name
 having count(*)>1;
 
 36:You want to update multiple columns
 for an employee in one query?
 update employees
 set salary=75000,department='it'
 where employee_id=1
 37: You need to insert data into one table
 by selecting it from another?
 insert into employees(first_name,last_name,department)
 select first_name,last_name,department from employees_2023;
 
 38:You want to calculate the cumulative
 salary for employees ordered by
 department.?
 The SUM() function with OVER() computes a running total
 for each row within a partition.
 select department,salary
 sum(salary)over ()(partition by department ordered by salary) as cummuilative_salary
  from employeees
  
  39: You want to delete employees who don’t
 belong to a specified list of departments?
 delete from employees
 where department is null;
 40:You need to count employees in each
 department but only display
 departments with more than five
 employees?
 select department,count(employee_id) as employee_count from employees
 group by department
 having count(employee_id)>5;
 41:You want to check if there are
 employees earning more than 100,000?
 select  first_name,salary
 from employees
 where salary>100000;
 
 or
 select exists(select 1 from employee where salary>100000)
 42:You want to rank employees within
 each department based on their salary?
 select first_name,last_name,salary,department
 rank() over(partition by  department order by salary desc)as rank_number
 from employees
 43:Inserting new employee data into a table?
 insert into employees
 (id,name,salary)
 values(1,'balu',1000)
 44:Updating employee salaries based on
 performance?
 update employees
 set salary=salary*0.10
 employee_id=1
 45:Deleting records of employees who left
 the company?
 delete from employees
 where id between 10 and 20;
 46:Inserting multiple rows at once?
 insert into employees(id,name,departemnt,salary)
 values(1,'balu',it,1000),
 (2,'hari,'finance',2000);
 47:Ensuring all employees have unique
 email addresses?
 create table employees
 emp_id int primarykey(),
 email varchar(50) unique;
 48:Scenario: Managing failed transactions
 with ROLLBACK?
 _-------
 
 49:Grouping employee records by
 department?
 select  department,employee_id from employee
 group by department
 
 50:Automatically updating a log
 table when employees are added?
 create table employees_logs(
 employee_id int,
 action varchar(50)
 
 insert into employees_logs(emp_id,name,department,salary)
 values(1,'bob','it',1000);
 
 51:
 
 
 
 
 
 