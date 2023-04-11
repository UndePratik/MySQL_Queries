-- Q1. Show all the student whose course id is either 1,3;
       select * from student;
       select * from student where cId = 1 or cId = 3;
-- Q2. Show student name whose name starts with s
       select * from student where sName like "s%";

-- Q3. Show all the faculty whose email id is not null
       select * from faculty;
       select * from faculty where email is not null;
       
-- Q4. Show the number of student in each course
       select cId, count(*) as total
       from student
       group by cId;
    
-- Q5. Show the numbers of courses according to duration
        select * from course;
        select cDuration, count(*) as total_course
        from course group by cDuration;
-- Q6. Increase the fees of all courses by 10%
        update course set cFees = cFees + (cFees*0.2);
        
-- Q7. Increase the salary of faculty by 20% whose experience is greater than 5 years
       select * from faculty;
       alter table faculty add column experience float;
       
       update faculty set fSalary = fSalary + (fSalary * 0.2) where experience>5;
-- Q8. Delete the course BCS
       select * from course;
       delete from course where cName = "BCS";
-- Q9. Delete the students who has not paid the fees
		select * from student;
        delete from student where feestatus = "not paid";
-- Q10.Show the faculty in desc order of salary 
		select * from faculty;
        select * from faculty order by fSalary desc;
-- Q11. Show the student in asc order of course id and if the course is same then desc order of joining date
        select * from student order by cId asc,  joindate desc;
-- q12. Show the total student in each course in asc order
         select * from student;
         select cId , count(*) as total from student 
         group by cId order by cId asc;
-- q13. Add the column joining date in faculty
        select * from faculty ;
        alter table faculty 
        add column location text;
        
-- q14. Change the column to experience of exp 
        alter table faculty rename column experience to exp;
		alter table faculty change column exp  experience float;
        
        desc faculty;
	#q15. between query
        select * from faculty where fId between 103 and 105;
        
        select * from faculty where fSalary between 20000 and 80000 order by fSalary desc;
        
        