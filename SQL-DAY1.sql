use sakila;
select * from payment;
select distinct(customer_id) ,amount from payment;
select sum(amount),count(amount) ,count(*) ,avg(amount)from payment;  #count(amount) doest not count null values but count(*) count all values including null
select sum(amount) from payment where customer_id=1;
select sum(amount) from payment where customer_id=2;
select customer_id ,sum(amount),count(*)
					from payment  group by  customer_id;
# mujhe hr ek staaf me kitne customer ko deal kiya no nikalna hai 
select * from payment;
select staff_id ,count(customer_id)from payment group by staff_id;

# u have to find out the total number of paymnet , total amount spend ,total no of customer serverd in each month and u have payment date and last _ update
SELECT 
    DATE_FORMAT(payment_date, '%m') , COUNT(*),SUM(amount), COUNT(customer_id) FROM payment 
GROUP BY 
    DATE_FORMAT(payment_date, '%m') having count(*) > 2000;

select * from address;
select city_id ,count(district) from address order by district ,city_id;
select count(address_id),count(address2) from address;
# get the district name the totsl district present and asum of city id  for each district

select district,  count(district),sum(city_id) from address group by district;

select * from address order by district,city_id desc;

select customer_id ,sum(amount) as 'totalamount' from payment group by  customer_id order by totalamount desc;  #alias using for give a name to any coliumn

#---------subqueryy--------------------------learning------
select * from payment;

 select * from payment where amount=(select amount from payment where payment_id=5);
 
 #question--get the payment id staf id rental id and amount for only thast ppayment where rantal id is greaterthan the rental id for
  select payment_id,staff_id,rental_id from payment where rental_id > (select rental_id from payment where payment_id=4);

 #question---get the payment id amount, the 10 % increament in amount for those paymnet where the month of paymnet date is equal to the month of paymnet id =5
select payment_id , amount from payment where month(payment_date)=(select  month(payment_date) from payment
 where payment_id=5);

#question----->
 select customer_id,count(amount) from payment group by customer_id having count(amount)>
 (select count(amount) from payment where  customer_id=2);
 
 #question what is multi subquery ? in any or anout multi funrtion
 # what is core related subquery? importanttq
 

