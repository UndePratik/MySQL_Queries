-- 1. Write a query to find the addresses (location_id, street_address, city,
-- state_province, country_name) of all the departments.
    select l1.location_id, l1.street_address, l1.city,
    l1.state_province, c1.country_name, d1.DEPARTMENT_NAME from departments d1 join locations l1 join countries c1 
    on l1.LOCATION_ID = d1.LOCATION_ID and  l1.COUNTRY_ID = c1.COUNTRY_ID;



-- 2. Write a query to find the names (first_name, last name), department ID
-- and name of all the employees.
select e1.FIRST_NAME,e1.LAST_NAME,e1.DEPARTMENT_ID,d1.DEPARTMENT_NAME
from employees e1 join departments d1 
on e1.DEPARTMENT_ID = d1.DEPARTMENT_ID;



-- 3. Find the names (first_name, last_name), job, department number, and
-- department name of the employees who work in London.
select e1.FIRST_NAME,e1.LAST_NAME,j1.JOB_TITLE,d1.DEPARTMENT_ID,d1.DEPARTMENT_NAME
from employees e1 join departments d1 join locations l1 join jobs j1 
on e1.department_id = d1.department_id and d1.location_id = l1.location_id
and e1.JOB_ID = j1.JOB_ID where l1.city = "london";

-- 4. Write a query to find the employee id, name (last_name) along with their
-- manager_id, manager name (last_name).

SELECT e1.employee_id as 'Emp_Id', e1.last_name as 'Employee', 
m1.employee_id as 'Mgr_Id', m1.last_name as 'Manager' 
FROM employees e1 
join employees m1 
ON (e1.manager_id = m1.employee_id);


-- 5. Find the names (first_name, last_name) and hire date of the employees
-- who were hired after 'Jones'.

SELECT e.first_name, e.last_name, e.hire_date FROM employees e JOIN employees davies 
ON (davies.last_name = 'Jones') WHERE davies.hire_date < e.hire_date;

-- 6. Write a query to get the department name and number of employees in the
-- department.
SELECT department_name AS 'Department ', 
COUNT(*) AS 'Total Emp' 
FROM departments d JOIN employees e
ON e.department_id = d.department_id GROUP BY d.department_id, department_name ORDER BY department_name;

-- 7. Find the employee ID, job title, number of days between ending date and
-- starting date for all jobs in department 90 from job history.

SELECT employee_id, job_title, end_date-start_date Days FROM job_history 
NATURAL JOIN jobs 
WHERE department_id=90;

-- 8. Write a query to display the department ID, department name and
-- manager first name
SELECT d.department_id, d.department_name, d.manager_id, e.first_name 
FROM departments d 
INNER JOIN employees e 
ON (d.manager_id = e.employee_id);


-- 10. Write a query to display the job title and average salary of
-- employees.
SELECT job_title, AVG(salary) 
FROM employees 
 JOIN jobs 
GROUP BY job_title;

-- 11. Display job title, employee name, and the difference between salary
-- of the employee and minimum salary for the job.
SELECT job_title, first_name, salary-min_salary 'Salary - Min_Salary' 
FROM employees 
 JOIN jobs;

-- 12. Write a query to display the job history that were done by any
-- employee who is currently drawing more than 10000 of salary
SELECT jh.* FROM job_history jh 
JOIN employees e 
ON (jh.employee_id = e.employee_id) 
WHERE salary > 10000;


-- 13. Write a query to display department name, name (first_name,
-- last_name), hire date, salary of the manager for all managers whose
-- experience is more than 15 years
-- SELECT first_name, last_name, hire_date, salary, 
-- (DATEDIFF(now(), hire_date))/365 Experience 
-- FROM departments d JOIN employees e 
-- ON (d.manager_id = e.employee_id) 
-- WHERE (DATEDIFF(now(), hire_date))/365>15;
