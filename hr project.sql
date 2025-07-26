use hr;
SHOW TABLES;
-- PRINT MULTIPLE COLUMNS
SELECT*FROM EMPLOYEES;
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM EMPLOYEES;

-- PRINT ONLY ONE COLUMN
SELECT EMPLOYEE_ID
FROM EMPLOYEES;

SELECT SALARY
FROM EMPLOYEES;

SELECT*FROM countries;
select*from jobs;
SELECT*FROM locations;
SELECT JOB_ID FROM EMPLOYEES
WHERE FIRST_NAME = 'DAVID';

SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE department_id = 90;
SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE salary <5000;
SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE salary >5000;
select*
from employees
where department_id=90;

select* 
from employees
where salary>5000;

select employee_id,salary, avg(salary) as avg_sal
from employees
group by employee_id,salary
having avg(salary)>5000;

select employee_id,first_name,last_name,avg(salary) as avg_sal
from employees
group by employee_id,first_name,last_name
having avg(salary)>5000;
use hr;
select employee_id,first_name,last_name,department_id from employees;

select*
from employees
where department_id=60;

show tables;

select job_title,min_salary
from jobs
where min_salary >5000;

select employee_id,salary
from employees
where salary > 10000 order by salary desc;

select* from departments;
select* from job_history;

select department_id, count(employee_id) as employee_num from employees group by department_id having count(employee_id)>5;
select department_id, count(employee_id) as employee_num from employees group by department_id;
-- Find the average salary of employees in each department. --
select department_id, avg(salary) as avg_salary from employees group by department_id;
use hr;
-- List job titles along with the number of employees in each job.--
select job_id,count(*) as employee_count from employees group by job_id order by employee_count desc;

select employee_id,first_name from employees where manager_id=100;
-- retreive all the employees without commisson_pct
select* from employees
where commission_pct is null;

-- retrieve all employees who have been assigened manager
select *
from employees
where manager_id is not null;

-- get the employee's salary sorted in descending order --
select employee_id, first_name, salary
from employees order by salary desc;

-- ascending order
select employee_id, first_name, salary
from employees
order by salary asc;

-- top 5 employees by salary
select employee_id, first_name, salary
from employees order by salary desc
limit 5;
-- top 2 employees by salary --

select employee_id, first_name, salary
from employees order by salary desc
limit 3 offset 2;

select employee_id, first_name, salary
from employees order by salary desc
limit 3 offset 1;

select employee_id, first_name, salary
from employees order by salary desc
limit 3 offset 3;

-- list out all unique job_id --
select distinct job_id
from employees;

select job_id from employees;

-- count number of empl in each department --
select department_id,count(*) as employee_count
from employees
group by department_id;

select* from employees
where departm is null;

select department_id,count(*) as employee_count
from employees where department_id is not null
group by department_id;


select department_id,employee_id,first_name,count(*) as employee_count
from employees
group by department_id,employee_id,first_name;

select department_id,employee_id,first_name,count(*) as employee_count
from employees where department_id is not null
group by department_id,employee_id,first_name;


-- find avg salary of each job_id
select job_id, avg(salary) as avg_sal from employees group by job_id;

-- list departments having more then 1 employee
select department_id, count(*) as emp_count
from employees group by department_id having count(*)>1;

-- calculate department wise minimum AND maximum salary
select department_id,min(salary) as min_sal, max(salary) as max_sal
from employees where department_id is not null
group by department_id;

-- fetch all the employee who are not belong to department 90 --
select* from employees where department_id!=90; -- != is not equal to
-- find all the employee who earn between 10000 to 15000
select employee_id, first_name,salary from employees
where salary between 10000 and 15000;

select employee_id, first_name, salary from employees where salary>15000;
select employee_id,first_name,hire_date from employees where hire_date>1990-01-01;
USE HR;
SELECT * FROM EMPLOYEES;

select* from employees;
select e.employee_id, e.first_name,d.department_name
from employees e
inner join
departments d
on
e.department_id = d.department_id;

select e.employee_id, e.first_name,d.department_name
from employees e
left join
departments d
on
e.department_id = d.department_id;

select e.employee_id, e.first_name,d.department_name
from employees e
right join
departments d
on
e.department_id = d.department_id;

 -- UNION --
select e.employee_id, e.first_name,d.department_name
from employees e
left join
departments d
on
e.department_id = d.department_id
UNION
select e.employee_id, e.first_name,d.department_name
from employees e
right join
departments d
on
e.department_id = d.department_id;
 USE HR;
 
 
-- DISPLAY EMPLOYEES NAME,JOB TITLE, DEPARTMENT NAME -- 
SELECT
E.EMPLOYEE_ID,E.FIRST_NAME,D.DEPARTMENT_NAME,J.JOB_TITLE
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN JOBS J ON J.JOB_ID = E.JOB_ID;

-- LIST OUT DEPARTMENT DOES NOT HAVE ANY EMPLOYEE ASIGN
SELECT
D.department_name,D.DEPARTMENT_ID
FROM DEPARTMENTS D
LEFT JOIN
EMPLOYEES E
ON
E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID IS NULL;

show variables like "secure_file_priv";
use hr;
show tables;
select * from batsman;

select*from employees order by salary desc limit 1;
-- find employees who earn the max salary
-- single row subquery
select employee_id,first_name,last_name,salary
from employees
where salary = (select max(salary)
from employees);

-- 2.find the employees who earn same salary of employee_id 101
select first_name,employee_id,last_name,salary
from employees
where salary =(select salary where employee_id=101);

-- 3.find employees who work in the samedeprtment as 'steven'
select employee_id,first_name,last_name,department_id
from employees
where department_id in (select department_id from employees where first_name = 'steven');

-- 4.find the employees who report to the same manager as the employee id 104
select employee_id,first_name,last_name,manager_id
from employees 
where manager_id = (select manager_id from employees where employee_id=104);

-- 5.find employees who salary is higher then average salary of the company
select employee_id,first_name,last_name,salary
from employees
where salary>(select avg(salary)from employees); 

-- subquery

SELECT*FROM EMPLOYEES
WHERE JOB_ID IN (SELECT JOB_ID FROM EMPLOYEES WHERE JOB_ID='SA_REP');
use hr;
show tables;
select salary,first_name from employees;

select * from employees
where salary > (select salary from employees where first_name = 'lex');

-- multi row subquery
-- employees who work in the department located in london
select first_name,last_name,department_id
from employees
where department_id in(
select department_id 
from departments 
where location_id
=(select location_id from locations where city = 'london')
);

-- find employees where salary is greater then atleast a employee in department 50
select first_name,salary,last_name,department_id
from employees
where salary >any (select salary from employees 
where department_id=50); 

/* find employees whose salary is higher
than all employees in department 60.
hint : use 'all' command*/

select first_name,salary,last_name,department_id
from employees
where salary > all (select salary from employees 
where department_id=60);

use hr;
/* employees with salary greater than the average salary of their  department*/
select employee_id,first_name,last_name,salary,department_id
from employees e1
where salary >(select avg(salary) as avg_sal
from employees e2
where e2.department_id = e1.department_id);

show tables;
select*from employees;

-- department with at least one employee earning more than 10000

SELECT d.department_id, d.department_name
FROM departments d
WHERE EXISTS (
SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
      AND salary > 10000);


select employee_id, first_name, salary,
row_number() over(order by salary desc)
as sal_rank
from employees;
-- 1.Ranking functions

-- rank() - Assigns ranks with gaps for ties:
select employee_id, first_name, salary,
rank() over(order by salary desc)
as sal_rank
from employees;

select employee_id, first_name, salary,
dense_rank() over(order by salary desc)
as sal_rank
from employees;

-- 2. aggregate window functions:

select first_name, last_name, department_id,salary,
sum(salary) over(order by hire_date)
as running_total,
round(avg(salary) over (partition by department_id),2)
as dept_avg_salary
from employees
order by hire_date;

 -- 3.value functions
 
select first_name, department_id, salary,
lag(salary, 1) over (order by salary)
as prev_salary,
lead(salary, 1) over (order by salary)
as next_salary,

salary - lag(salary,1)
over (order by salary) as salary_jump,

lead(salary, 1) over (order by salary) - salary
as gap_to_next
from employees
order by salary;

-- first value():
/*find the first employee hired in each department based on hire_date*/
select employee_id, department_id,first_name, last_name,hire_date,
first_value(first_name) over(
partition by department_id
order by hire_date) as first_hired_in_dect
from employees;

use hr;

/*find the last employee hired in each department based on hire_date*/
select employee_id, department_id,first_name, last_name,hire_date,
last_value(first_name) over(
partition by department_id
order by hire_date
rows between unbounded preceding
and unbounded following) as first_hired_in_dect
from employees;


-- 4. distribution functions
select first_name,department_id,salary,
percent_rank() over (order by salary)
as percentile_rank,
cume_dist() over (order by salary)
as cumulative_distribution
from employees;
use hr;
select * from employees;
