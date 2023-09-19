USE [Pizza DB]
SELECT * FROM pizza_sales
SELECT SUM(total_price) AS Total_Revenue from pizza_sales; 
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value from pizza_sales
SELECT SUM(quantity) AS Total_Pizzas_Sold from pizza_sales
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Per_Order FROM pizza_sales

--Hourly Trend for Total Pizzas Sold
SELECT DATEPART(HOUR, order_time) as order_hour, SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time) 

--Weekly Trend for Total Orders
SELECT DATEPART(ISO_WEEK, order_date) as week_number, YEAR(order_date) AS Order_Year, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY DATEPART(ISO_WEEK, order_date), YEAR(order_date)
ORDER BY DATEPART(ISO_WEEK, order_date), YEAR(order_date)

SELECT pizza_category, sum(total_price) AS Total_Sales, 
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) 
AS DECIMAL(10,2)) AS Percentage_of_Sales from pizza_sales
GROUP BY pizza_category

SELECT pizza_size, sum(total_price) AS Total_Sales, 
CAST(SUM(total_price) * 100/ (SELECT SUM(total_price) FROM pizza_sales) 
AS DECIMAL(10,2)) AS Percentage_of_Sales from pizza_sales
GROUP BY pizza_size

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC 

