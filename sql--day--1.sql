use sakila;

select * from actor;

show databases;

use sakila;

show tables;
desc actor;
select * from actor;

select actor_id from actor where first_name in ('nick','ed');



select * from actor where first_name like 'e%';

select * from actor where first_name like 'e_';

select * from actor where first_name like '_a%';

#first name has onluy 4 character

#get all information from actor table last third word i 


#get thode data where e in midle

#get those user which have altesst 4 character and the last three leteer  r


#ee presenst in present name



#here second letter is h and second last teer z 
select * from actor where first_name like '_h%z_'; 


select * from actor where first_name like '__i%'; 

select * from actor where first_name like '_h%z_'; 

select * from actor where first_name like '%e%'; 

select * from actor where first_name like '%_r__'; 



use sakila; 

# today we are discussing and or operator 

select * from actor where actor_id>2 or first_name="johnny";



select * from actor where  first_name="nick" or first_name="ed";



select * from actor where

(first_name="nick" or first_name="ed") and actor_id>2;



# funtions --> block of code ---> make it usable again again--> code readable



#---> predefined 
#--->string funtions

select first_name ,lower(first_name),upper(lower(first_name)) from actor;



select first_name,last_name , concat(first_name,"--",last_name) from actor;



select * from actor where concat(first_name,last_name)="edchase";


select first_name ,substr(first_name,2,4) from actor;


select first_name ,substr(first_name,-2) from actor;


select first_name ,instr(first_name,'e'),char_length(first_name) from actor;
#  length and charlength



select length("李娜"),char_length("李娜") from dual;



select lpad(first_name,5,'*') from actor;



select rpad(first_name,5,'*') from actor;

select trim(first_name) from actor;



select first_name, replace(first_name,'E','X') from actor;


