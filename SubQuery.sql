
select sname, feestatus
from student
where courseid= (select courseid
                 from course
                 where cname="python");
                 
 #single values: =
 #single row: >,<,>=,<=
 # more than one value : in
 
 select sname, feestatus
from student
where courseid= (select courseid
                 from course
                 where cname="python") and feestatus="HalfPaid";
                 
# Show student whose faculty is same

select *
from student
where courseid in (select courseid 
                 from coursefaculty
                 where facultyId= (select facultyId
                                    from faculty
                                     where fname="Raksha"));                 
 
 # student details whose coursename is java
 
 select * from student
 where courseid=(select courseid
               from course
               where cname="java");
               
# student details whose course duration is 4 months

select * from student
where courseid in (select courseid
               from course
               where duration="4 months");    
               
               
  # Show the course who faculty salary is greater than 60000
  
  select * from course
  where courseId in (select courseid 
                   from coursefaculty
                   where facultyId in ( select facultyId
                                     from faculty
                                     where salary> 60000));


# show the course where number of student enrolled is greater than 3

select courseId,count(*) as Total
            from student 
             group by courseid
		      having Total>=2;

select * from course
 where exists(select courseId,count(*) as Total
                from student 
                where course.courseId= student.courseId
                 group by courseid
		          having Total>=2);  
                  
                  
 # within the table                 
# show the names of have faculty whose salary is greater than than salary of Shuruti

select * from faculty
where salary > (select salary 
               from faculty
				where fname="shuruti");
 # Show the names whose experience is greater than jayshree
 
 select * from faculty
where exp > (select exp
               from faculty
				where fname="jayshree");
                
 # show facutly name whose salary is greater than average salary
 
 select fname
 from faculty 
 where salary >=(select avg(salary)
                from faculty);
                
 # update the salary of faculty whose salary is greate than average salary
 
 update faculty
 set salary=salary+1000
 where salary > 2000;
 
 select * from faculty;
 #//////////////////////////////////
 
update faculty f1 
 set salary=salary+1000
 where salary > (select avg(salary) 
                  from faculty f2
                  where f1.facultyId=f2.facultyId); 
                  
 # update the salary of faculty whose are teaching more than one course
 
 select * from coursefaculty;
 
 select facultyid, count(*) as totalcourse
 from coursefaculty
 group by facultyId
 having totalcourse >1;


 select * 
 from faculty
 where exists (select facultyid, count(*) as totalcourse
                from coursefaculty
                where faculty.facultyId= coursefaculty.facultyId
                 group by facultyId
                  having totalcourse >1);
 
 select * from coursefaculty
 where facultyid=5;
 
 select * from course
 where courseid in (select courseId from coursefaculty
				where facultyid=5);
 
 
 
 
 
                  
                  
                
                
                
                
                
 