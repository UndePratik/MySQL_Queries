create database employeedb;
use employeedb;
use studentdb;
select * from faculty;

select sum(salary) as totalSalary
from faculty;

select count(*)
from faculty;


desc faculty;
select * from student;

alter table course
modify cid varchar(30);

alter table faculty
modify facultyId varchar(30);

desc coursefaculty;
desc student;


desc student;
#Queries
#1.Show all the student whose course id is either 103,102;
select * from student;

select * from student
where cfid=103 or cfid=102;
#select * from student where cfid = 104 or cfid = 103;

-- Q2. Show student name whose name starts with s
       select * from student where sname like "s%";

-- Q3. Show all the faculty whose email id is not null
       select * from faculty;
       select * from faculty where email is not null;
       
-- Q4. Show the number of student in each course
       select cfid, count(*) as total
       from student
       group by cfid;
    
-- Q5. Show the numbers of courses according to duration
        select * from course;
        select duration, count(*) as total_course
        from course group by duration;
-- Q6. Increase the fees of all courses by 10%
        update course set cfees = cfees + (cfees*0.2);
        
-- Q7. Increase the salary of faculty by 20% whose experience is greater than 5 years
       select * from faculty;
       alter table faculty add column experience float;
       
       update faculty set salary = salary + (salary * 0.2) where experience>5;
-- Q8. Delete the course BCS
       select * from course;
       delete from course where cname = "php";
-- Q9. Delete the students who has not paid the fees
		select * from student;
        delete from student where feesstatus = "notpaid";
-- Q10.Show the faculty in desc order of salary 
		select * from faculty;
        select * from faculty order by salary desc;
-- Q11. Show the student in asc order of course id and if the course is same then desc order of joining date
        select * from student order by cfid asc,  joiningDate desc;
-- q12. Show the total student in each course in asc order
         select * from student;
         select cfid , count(*) as total from student 
         group by cfid order by cfid asc;
-- q13. Add the column joining date in faculty
        select * from faculty ;
        alter table faculty 
        add column location text;
        
-- q14. Change the column to experience of exp 
        alter table faculty rename column experience to exp;
		alter table faculty change column exp  experience float;
        
        desc faculty;
	#q15. between query
		select * from faculty;
        select * from faculty where facultyId between "f1" and "f3";
        
        select * from faculty where salary between 20000 and 80000 order by salary desc;


