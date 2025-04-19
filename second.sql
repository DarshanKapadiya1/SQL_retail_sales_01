-- create table


create table retail_sales
(
transactions_id	int,
sale_date date, 	
sale_time time,	
customer_id	int,
gender varchar(10),
age	int,
category varchar(15),	
quantiy	int,
price_per_unit float,	
cogs float,	
total_sale float
);


select count(*) from retail_sales;


-- clean data
select * from retail_sales
where transactions_id is null
      or
	  sale_date is null
	  or
	  sale_time is null
	  or
	  customer_id is null
	  or
	  gender is null
	  or
	  age is null
	  or
	  category is null
	  or
	  quantiy is null
	  or
	  price_per_unit is null
	  or
	  cogs is null
	  or
	  total_sale is null
	  ;

--remove null
delete from retail_sales
where transactions_id in (432,1367,1391,1432,150,845,1150,1845,797,921,679,746,1225);  




--data analysis & business key problems & answers
select * from retail_sales;


-- 1) Write a SQL query to retrieve all columns for sales made on '2022-11-05'.
select * 
from retail_sales 
where sale_date = '2022-11-05';


-- 2) Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantiy sold is more than 4 in the month of Nov-2022.
select * 
from retail_sales 
where category = 'Clothing' 
  and quantiy >=4
  and sale_date >= '2022-11-01' 
  and sale_date <= '2022-11-30';


-- 3) Write a SQL query to calculate the total sales (total_sale) for each category.
select category, sum(total_sale)
from retail_sales
group by category;


-- 4) Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select avg(age)
from retail_sales
where category='Beauty';


-- 5) Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * 
from retail_sales
where total_sale > 1000;


-- 6) Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select gender,category,count(transactions_id) 
from retail_sales
group by gender,category;


-- 7) Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.
select 
  extract(YEAR from sale_date) AS sale_year,
  extract(MONTH from sale_date) AS sale_month,
  avg(total_sale) AS average_sale
from retail_sales
group by extract(YEAR from sale_date), extract(MONTH from sale_date);


-- 8) Write a SQL query to find the top 5 customers based on the highest total sales.
select customer_id,sum(total_sale)
from retail_sales 
group by customer_id
order by sum(total_sale) desc 
limit 5;


-- 9) Write a SQL query to find the number of unique customers who purchased items from each category.
select category, count(distinct customer_id) 
from retail_sales
group by category;





