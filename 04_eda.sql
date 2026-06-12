-- Total Revenue
SELECT
ROUND(SUM(TotalSales),2) AS Revenue
FROM ecommerce;

-- Total Orders
SELECT
COUNT(DISTINCT InvoiceNo) AS Orders
FROM ecommerce;

-- Total Customers
SELECT
COUNT(DISTINCT CustomerID) AS Customers
FROM ecommerce;

-- Counteries served
SELECT
COUNT(DISTINCT Country)
FROM ecommerce;
