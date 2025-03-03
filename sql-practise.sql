use sakila;
select * from payment;

select max(amount) from payment where amount<(select max(amount) from payment);

# ddl command-----> 
# dml command-->insert update delete 

create database march3;

create table regex4(id int,name varchar(20));

insert into regex4 values(1,"rajat");
select * from regex4;

#----ctas--> create table as 

create table y3 as select actor_id,first_name from sakila.actor;


insert into regex4(name)values("rajat"),("bharti");

select * from y3;


create table y4 as select actor_id as id ,first_name as name from sakila.actor;

select * from y4;

# delete ---> it deletes the data only 


delete from y3 where actor_id in (2,5);


# its long process because it have to go all over the data 


# update --> it update the

update y3 set first_name="regex";

# all rows  willl se shown as regex so it is used with condition only

update y3 set first_name="rajat nandi" where actor_id>2;

# ddl--data defination language ---->it delete the structure of the tablle complete 
# --> drop truncate 

drop table y3;

create table y5 as select actor_id , first_name from sakila.actor;


select * from y5;

# difff btw drop delete truncate 

# drop--it delete the full table , it is an ddl command , it is faster than delete and slower than truncate , it affect the structure 
# delete--- it delete only one and two row based on condition , it dml command 
# truncate --- it cannnot be roll back , it delete all rows not its structure, it is faster

# deelete can be roll back



create table y6(id int);
insert into y6 values(10);
select * from y6;

desc y6;

# add columns 

alter table y6 add column phone varchar(15);

alter table y6 add column counts int not null;

select * from y6;

alter table y6 drop column counts;

select * from y6;

# rename 

rename table y6 to rajat_company;


select * from rajat_company;

alter table rajat_company  rename to my_company;

select * from my_company;

alter table my_company rename column phone to telephone;

select * from my_company;

alter table my_company add primary key (id);

alter table my_company add unique (telephone);

desc my_company;

alter table my_company add constraint regex_company_j unique(telephone);

alter table my_company modify id varchar(20);  

