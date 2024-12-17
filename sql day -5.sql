
create database regex;
use regex;
create table product(pid int,pname varchar(20),price int);
insert into product values(10,'tv',100),(20,'mobile',200),(30,'gyser',4000),(40,'yash',5000);
select * from product;
create table orders (oid int, city varchar(20), product_id int);
insert into orders values (1991, "jaipur",10), (1992, "goa", 20),(1993, "UK", 10), (1994, "shimla", 40), (1995, "kerala", 80);
select * from orders;

select o.oid,o.city,o.product_id,p.pname,p.price from orders as o  inner join product as p
on o.product_id=p.pid;

select o.oid,o.city,o.product_id,p.pname,p.price from orders as o  left join product as p

on o.product_id=p.pid;

select o.oid,o.city,o.product_id,p.pname,p.price from orders as o  right join product as p
on o.product_id=p.pid;


use sakila;

select * from actor;
select * from film_actor;

#get the actor id the full name of the actr film id and the last update column from the two table
select 
    a.actor_id, 
    a.first_name,
    fa.film_id, 
    f.last_update
from 
    actor a
join 
    film_actor fa on a.actor_id = fa.actor_id
join 
    film f on fa.film_id = f.film_id;

#foreign key
create database regexconst;
use regexconst;
create table product(pid int primary key, pname varchar(20), price int);
insert into product values(10, "tv",100), (20,"mobile", 200),(30, "gyser", 4000), (40, "yash", 5000);
select * from product;
create table orders1(oid int, city varchar(20), product_id int,foreign key(product_id) references product(pid));
insert into orders1 values(1991,"jaipur",10),(1992,"goa",20),(1993,"UK",10),(1994,"shimla",10);
select * from orders1;

#------DDL-DATA--DEFINATION-LANGUAGE----
# create , drop ,truncate,  alter
create table test(id int,name1 varchar(20));
insert into test values(10,"rajat"),(20,"ram");
insert into test(name1) values ("tushar");
select * from test;
update test set name1='xyz' where id= 20;
select * from test;
update test set name1='xyz' where id is null;
select * from test;
delete from test where id is null;
select * from test;
truncate test;
select * from test;
#-------------------------------------------
use regexconst;
create table companies(id int);
insert into companies values(10);
select * from companies;
alter table companies
add column phone varchar(15);
alter table companies
add column employee_count3 int not null;

select * from companies;
alter table companies drop column employee_count3;
rename table companies to newcompany1;

desc newcompany1;
 alter table newcompany1
 rename column id to ids;
select * from newcompany1;
 
insert into newcompany1 values (12);
desc newcompany1;
select * from newcompany1;

alter table newcompany1 add constraint regex_company_uk unique (ids);

alter table newcompany1 modify ids double;
desc newcompany1;
alter table newcompany1 change ids newids varchar(6);
desc newcompany1;
#rop delete truncate difference
#elete--- it is dml operwation where condtion ,delete can be roll back we can get the data again by undo
# drop --- ddl operation ,it delete both table data and structure bothh , we can not undo the data 
# truncatae -- ddl opertion ,it delete both table data and structure bothh but it recreate the structure without data and we cannot undo the data ;
use sakila;
select * from payment;
select max(amount) from payment where amount<(select max(amount) from payment);





