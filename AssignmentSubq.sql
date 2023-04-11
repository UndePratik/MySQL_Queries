-- Write a query to find the names (first_name, last_name) and the salaries of
-- the employees who have a higher salary than the employee whose
-- last_name='Bull'

select * from employees where LAST_NAME = "Bull";
select first_name, last_name,salary from employees 
where salary > (select SALARY from employees where LAST_NAME = "Bull"); 

-- Write a query to find the names (first_name, last_name) of all employees
-- who works in the IT department.
select first_name, last_name from employees where DEPARTMENT_ID = (select DEPARTMENT_ID from departments where department_name = "It");

-- 3. Write a query to find the names (first_name, last_name) of the employees
-- who are managers.
SELECT first_name, last_name 
FROM employees 
WHERE (employee_id IN (SELECT manager_id FROM employees));

-- 4. Write a query to find the names (first_name, last_name), the salary of the
-- employees whose salary is greater than the average salary.

SELECT * FROM employees 
WHERE salary > 
ALL(SELECT avg(salary)FROM employees GROUP BY department_id);
-- 5. Write a query to find the names (first_name, last_name), the salary of the
-- employees whose salary is equal to the minimum salary for their job
-- grade.
SELECT first_name, last_name, salary 
FROM employees 
WHERE employees.salary = (SELECT min_salary
FROM jobs
WHERE employees.job_id = jobs.job_id);

-- 6. Write a query to find the names (first_name, last_name), the salary of the
-- employees who earn more than the average salary and who works in any
-- of the IT departments.
-- 7. Write a query to find the names (first_name, last_name), the salary of the
-- employees who earn more than Mr. Bell.
