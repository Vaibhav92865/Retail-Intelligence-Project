SELECT
ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail;

SELECT
COUNT(DISTINCT InvoiceNo) AS total_orders
FROM retail;

SELECT
COUNT(DISTINCT CustomerID) AS total_customers
FROM retail;

SELECT
Description, SUM(Quantity) AS total_quantity
FROM retail
GROUP BY Description
ORDER BY total_quantity DESC
LIMIT 10;

SELECT 
Country, SUM(Revenue) AS total_revenue
FROM retail
GROUP BY Country    
ORDER BY total_revenue DESC;

SELECT 
STRFTIME('%Y-%m', InvoiceDate) AS month, ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail
GROUP BY month
ORDER BY month;

SELECT
CustomerID,
ROUND(SUM(Revenue), 2) AS total_spending,
COUNT(DISTINCT InvoiceNo) AS total_orders
FROM retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY total_spending DESC
LIMIT 10;

SELECT
ROUND(
SUM(Revenue) * 1.0 /
COUNT(DISTINCT InvoiceNo),
2) AS average_order_value
FROM retail;

SELECT
COUNT(*) AS repeat_customers
FROM (SELECT CustomerID
FROM retail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
HAVING COUNT(DISTINCT InvoiceNo) > 1);

SELECT
STRFTIME('%Y-%m', InvoiceDate) AS month,
COUNT(DISTINCT InvoiceNo) AS total_orders,
ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail
GROUP BY month
ORDER BY month;

SELECT
Country,
COUNT(DISTINCT CustomerID) AS total_customers
FROM retail
WHERE CustomerID IS NOT NULL
GROUP BY Country
ORDER BY total_customers DESC;

SELECT
DATE(InvoiceDate) AS sales_date,
ROUND(SUM(Revenue), 2) AS daily_revenue
FROM retail
GROUP BY DATE(InvoiceDate)
ORDER BY sales_date;