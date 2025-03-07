use employees;
select * from employees;
select * from departments;
select * from salaries;
select * from titles;
# emo no where salary is less than the salary of 10003 se kam ho

select emp_no from salaries where salary<all
(select salary from salaries where emp_no=10003);

select * from titles;
select * from employees;
describe employees;
describe titles;

select e.emp_no, t.title from employees as e join title as t on
 e.emp_no=t.emp_no;
 
 select e.emp_no,e.first_name,t.title
from employees as e join titles as t
on e.emp_no=t.emp_no
where t.title!="manager";


#mujhe sare emp ka naam chaiye jo cureently mere comaony me akaam 
#k rhe hai and worjing on non manager
 select e.emp_no,e.first_name,t.title
from employees as e join titles as t
on e.emp_no=t.emp_no
where t.title!="manager";




#i need to get the emp no the first name last n ame ttile from this emp tabble where cureent position 
#is managr and also worked in other post 

select e.emp_no, e.first_name, t1.title
from employees as e
join titles as t1 on e.emp_no = t1.emp_no 
join titles as t2 on e.emp_no = t2.emp_no 
where t1.title = 'manager' 
and t2.title <> 'manager'; 

#i need to get  emp no first name title and hire date from all thee emploeyess
select * from employees;
select e.emp_no,e.first_name,e.last_name,t.title,e.hire_date
from employees as e join titles as t
on e.emp_no=t.emp_no;

select e.emp_no,e.first_name,e.last_name,t.title,e.hire_date
from employees as e join titles as t
on e.emp_no=t.emp_no where title="Assistant Engineer";

# i need to get imformation of those   where  hire date is less than 
#is before the hiring DATE Of hiring date of any manger

select e.emp_no,e.first_name,e.last_name,t.title,e.hire_date
from employees as e join titles as t
on e.emp_no=t.emp_no where title="Assistant Engineer"and 
				hire_date <any(select e.hire_date
from employees as e join titles as t
on e.emp_no=t.emp_no where title="manager");

#from title table get the emp no th ttile of person an dthe year
 #of hiring date for the current position manager hwe
 #e the person is promoted manager in the same year of the working
 
 
select e.emp_no,e.first_name,e.last_name,year(e.hire_date)
from employees as e join titles as t
on e.emp_no=t.emp_no where title="manager";

#single row quere ke and == sare operator use kr sqe and or it comes multiple calues 
#in any all =all ni chltaaa multi columns subquere hum in operator he lgega any or ni lgegga
# corerelated me koi bhi dynamic condition ho swte hai kise pr bhi




# tcl---> transaction control langauge
#--transaction--->set of logical statement 
#ddl,dml,dcl command is also transaction 

#A transaction in SQL is a sequence of one or more SQL operations that are executed as a single unit of work.
# Transactions ensure data consistency, integrity, and reliability in databases.

#types: commit , savepoint , rollback

set autocommit=0;
select @@autocommit;

use regex;
create table yash(id int ,fname varchar(30));
insert into yash values(10,'rajat');
select * from yash;
commit; # now its saved in our data and complete the transsaction

insert into yash values(11,'bharti');
rollback;# it remove the pensing transaction


insert into yash values(11,'bharti');
update yash set fname="regex";

# when we use the ddl command all pending transaction is saved automatically

create table dd(id int);

# if u make a savepoint and the use rollback it delete all pendind transaction
# including save point to

# rollback to savepoint name that whT IS used



#learning asssighnmemnt 
#what is windows funtion and rank dense rank row number

# it is a special type funtions where we perform calculation over specific records and then it comapre with cureent data
# this calculation is do on specicific data called window 
# what are acid properties in database and why we use it and normalization 














