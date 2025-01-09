use sakila;
select * from sales_cc;

#Q1 get all transaction done for beauty category in the month of  december
UPDATE sales_cc
SET sales_date = STR_TO_DATE(sales_date, '%m/%d/%Y');
select * from sales_cc where categoryProduct = 'Beauty' and
month(sales_date) = 12;

#q2-----------Get the total sales done for each category in each month

select categoryProduct,sum(total_sale), month(sales_date) from 
sales_cc group by categoryProduct, month(sales_date);

# Q3 find the maximum , minium , average age for people
#  buying beauty products
select * from sales_cc;
select max(age), min(age), avg(age), categoryProduct from sales_cc 
where categoryProduct = 'Beauty';

#Q4 GEt number of transaction done by each user in each category
select customer_id, categoryProduct,count(customer_id)  from sales_cc
group by customer_id, categoryProduct order by customer_id;

#5
select * from sales_cc;

WITH MonthlySales AS (
    SELECT 
        YEAR(sales_date) AS year, 
        MONTH(sales_date) AS month, 
        AVG(total_sale) AS avg_sales
    FROM 
        sales_cc
    GROUP BY 
        YEAR(sales_date), MONTH(sales_date)
)
SELECT 
    year,
    month,
    avg_sales,
    MAX(avg_sales) OVER (PARTITION BY year) AS best_month_sales
FROM 
    MonthlySales
WHERE 
    avg_sales = MAX(avg_sales) OVER (PARTITION BY year);






#6
(select customer_id , avg(total_sale) as avg_sales from sales_cc 
group by customer_id order by avg_sales asc limit 3 )
union all(
select customer_id , avg(total_sale) as avg_sales from sales_cc 
group by customer_id order by avg_sales asc limit 3);

# 7
select categoryproduct,count(distinct customer_id)  from sales_cc group by categoryproduct;

# 8
select 
    sum(case 
        when time(time) < '13:00:00' then 1 
        else 0 
    end) as morning_orders,
    sum(case 
        when time(time) between '13:00:00' and '15:00:00' then 1 
        else 0 
    end) as lunch_orders,
    sum(case 
        when time(time) > '17:00:00' then 1 
        else 0 
    end) as evening_orders
from sales_cc;



