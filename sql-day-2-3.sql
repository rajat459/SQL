#------joins---------
#-----data types--------
#----int (numerical)-----
create database rajat;
use rajat;
create table rajat_info(id int);
insert into rajat_info values(20);
select * from rajat_info;

create table employe(eid int unsigned);
insert into employe values(2147483648);
select * from employe;
# medium int----tiny int---small int----bigint---

create table abc(salary double(5,2));
insert into abc values(20.1);
select * from abc;

create table test_bool(i bool);
insert into test_bool values (True),(false);
select * from test_bool;
#----------------------------------
create table ep2(name1 char(4));
# char is fixed in size (if we gave the extra spaces it can truncate the space means it will delete the  lat space it does no count )
 insert into ep2 values('zz');
 select name1,length(name1) from ep2;
 select * from ep2;
 #-------------------------
 create table ep3(name1 varchar(4));
# char is fixed in size (if we gave the extra spaces it can truncate the space means it will delete the  lat space upto the size of column)
 insert into ep3 values('zz    ');
 select name1,length(name1) from ep3;
 
 #-------------------------------------------------------------------
 #----------conditional staememt------
 use sakila;
 select * from actor;
 select first_name,
				if (first_name='nick',0,if (first_name='ed',2,'not value')) from actor;

#------------case methode---------------

select first_name, 
		case 
            when first_name='nick' then 0
            when first_name='ed' then 0
            else 'no value'
            end as neww from actor;
# -----------------get the payment id ustomer id anount month of payment date and quarter of column date with the following ampon 
#if amount is more than 2 dollar then it increase the 10 percent ..5  increase by  25 ....8 ...50... other 5 percent
  select * from payment;
  -- Retrieve payment details and apply amount adjustments
SELECT 
    payment_id,
    customer_id,
    amount,
    MONTH(payment_date) AS month_of_payment,
    QUARTER(payment_date) AS quarter_of_date,
    CASE
        WHEN amount > 8 THEN amount * 1.50 -- Increase by 50%
        WHEN amount > 5 THEN amount * 1.25 -- Increase by 25%
        WHEN amount > 2 THEN amount * 1.10 -- Increase by 10%
        ELSE amount * 1.05 -- Increase by 5%
    END AS adjusted_amount
FROM 
    payment; 
 # what is the order in execution of statement 
 #primary key foreighn key candidate key super key
 # types of relationship
 #what are core related subquery
 
 
 

