#write the query names of employee who was in it department
use coursedb;
select * from employee;
select first_name, last_name
from employees
where department_id = (select department_id
from departments
where department_name="IT");

select first_name, last_name
from employees
where salary = (select avg(salary)
from departments);

#names of the employyes whose salary equals to the min of job_id
select first_name, last_name
from employees
where salary = (select min_salary
				from jobs
                );