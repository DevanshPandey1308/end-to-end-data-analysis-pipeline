CREATE DATABASE order_analysis;

USE order_analysis;
SELECT * FROM orders;

SELECT * FROM orders LIMIT 10;

#Top 10 highest revenue generating products
SELECT product_id, SUM(sales_price) as sales
FROM orders
GROUP BY product_id
ORDER BY sales desc
LIMIT 10;


#Top 10 sales and product state-wise
SELECT
  state,
  SUM(sales_price) AS total_sales,
  SUM(profit)     AS total_profit
FROM orders
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;


#Category wise profit margin
SELECT
  category,
  SUM(sales_price) AS total_sales,
  SUM(profit)      AS total_profit,
  CASE 
    WHEN SUM(sales_price) = 0 THEN 0
    ELSE ROUND( (SUM(profit) / SUM(sales_price)) * 100, 2 )
  END AS profit_margin_pct
FROM orders
GROUP BY category
ORDER BY profit_margin_pct DESC;


#Shipping mode performance
SELECT
  ship_mode,
  SUM(sales_price)      AS total_sales,
  SUM(profit)           AS total_profit,
  ROUND(AVG(discount), 4) AS avg_discount
FROM orders
GROUP BY ship_mode
ORDER BY total_sales DESC;


#Sales Trend over quarterly period 
SELECT
  YEAR(order_date)   AS year,
  QUARTER(order_date) AS quarter,
  SUM(sales_price)   AS total_sales
FROM orders
GROUP BY YEAR(order_date), QUARTER(order_date)
ORDER BY YEAR(order_date), QUARTER(order_date);


#Top 5 highest selling project in each region
WITH cte AS (
    SELECT 
        region,
        product_id,
        SUM(sales_price) AS sales
    FROM orders
    GROUP BY region, product_id
),
ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY region ORDER BY sales DESC) AS rn
    FROM cte
)
SELECT *
FROM ranked
WHERE rn <= 5;


#Month over month growth comparison for 2022 and 2023 sales eg : jan 2022 vs jan 2023
WITH cte AS (
  SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(sales_price) AS sales
  FROM orders
  GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT
  order_month,
  SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
  SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
FROM cte
GROUP BY order_month
ORDER BY order_month;

#For each category which month had highest sales 
WITH cte AS (
    SELECT 
        category,
        DATE_FORMAT(order_date, '%Y%m') AS order_year_month,
        SUM(sales_price) AS sales
    FROM orders
    GROUP BY category, DATE_FORMAT(order_date, '%Y%m')
),
ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY category ORDER BY sales DESC) AS rn
    FROM cte
)
SELECT *
FROM ranked
WHERE rn = 1;

#Which sub-category had highest growth by profit in 2023 compare to 2022
WITH cte AS (
    SELECT 
        sub_category,
        YEAR(order_date) AS order_year,
        SUM(sales_price) AS sales
    FROM orders
    GROUP BY sub_category, YEAR(order_date)
),
cte2 AS (
    SELECT 
        sub_category,
        SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
        SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
    FROM cte
    GROUP BY sub_category
)
SELECT 
    sub_category,
    sales_2022,
    sales_2023,
    ((sales_2023 - sales_2022) / sales_2022) * 100 AS growth_percentage
FROM cte2
ORDER BY growth_percentage DESC
LIMIT 1;












