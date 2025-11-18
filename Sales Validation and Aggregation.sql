-- Data Validation And Aggregation --


-- Table Creation --
create table superstore_data(
Row_ID serial primary key,
Order_ID varchar,
Order_Date date,
Ship_Date date,
Ship_Mode varchar,
Customer_ID varchar,
Customer_Name varchar,
Segment varchar,
Country varchar,
City varchar,
State varchar,
Postal_Code int,
Region varchar,
Product_ID varchar,
Category varchar,
SubCategory varchar,
Product_Name varchar,
Sales decimal,
Quantity int,
Discount decimal,
Profit decimal
);

-- Total Row Count --
select count(*) as total_rows from superstore_data;

-- Missing Sales --
select sales from superstore_data as missing_sales 
where sales is null;

-- Missing profit --
select profit from superstore_data as missing_profit 
where profit is null;

-- Missing Quantity --
select quantity from superstore_data as missing_quantity
where quantity is null;

-- Missing order_date --
select order_date from superstore_data as missing_order_date
where order_date is null;

-- Checking Duplicates --
select order_id, count(*) as duplicate_count from superstore_data 
group by order_id having count(*) > 1;

-- Inconssistent Data --
select * from superstore_data
where profit > sales;

-- Negative or Zero Sales/Quantity --
select * from superstore_data 
where sales <= 0 or quantity <= 0;

-- Total Sales, Profit & Discount--
select sum(sales) as total_sale from superstore_data;
select sum(discount) as total_discount from superstore_data;
select sum(profit) as total_profit from superstore_data;

-- Min & Max sales & Profit --
select  max(sales) as maximum_sale,
min(sales) as minimum_sale
from superstore_data;
select  max(profit) as maximum_profit, 
min(profit) as minimum_profit
from superstore_data;

--Total Sales And Profit By Region --
select region,
       sum(sales) as total_sales,
       sum(profit) as total_profit
from superstore_data 
group by region 
order by total_sales desc;

-- Average Profit By Category --
select category,
       avg(profit) as avg_profit
from superstore_data 
group by category
order by avg_profit;

-- Monthly Sales Trend --
select extract(year from order_date) as year,
       extract(month from order_date) as month,
	   sum(sales) as monthly_sales
from superstore_data
group by year,month
order by year,month;

-- Top 5 product by Sales--
select product_id,
       product_name,
       sum(sales) as Total_sale
from superstore_data 
group by product_id,product_name
order by total_sale desc limit 5


select min(profit) from superstore_data

