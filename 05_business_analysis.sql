-- Top 10 Customers
SELECT
CustomerID,
SUM(TotalSales) AS Revenue
FROM ecommerce
GROUP BY CustomerID
ORDER BY Revenue DESC
LIMIT 10;

-- Top Selling Products
SELECT
Description,
SUM(Quantity) AS UnitsSold
FROM ecommerce
GROUP BY Description
ORDER BY UnitsSold DESC
LIMIT 10;

-- Revenue by Country
SELECT
Country,
SUM(TotalSales) Revenue
FROM ecommerce
GROUP BY Country
ORDER BY Revenue DESC;

-- Monthly Revenue Trend
SELECT
YEAR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) Year,
MONTH(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) Month,
SUM(TotalSales) Revenue
FROM ecommerce
GROUP BY
YEAR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')),
MONTH(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i'))
ORDER BY
Year,
Month;

-- Best Sales Month
SELECT
MONTH(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) Month,
SUM(TotalSales) Revenue
FROM ecommerce
GROUP BY Month
ORDER BY Revenue DESC;

-- Customer Lifetime Value
SELECT
CustomerID,
SUM(TotalSales) AS CLV
FROM ecommerce
GROUP BY CustomerID
ORDER BY CLV DESC;

-- Average Order Value
SELECT
SUM(TotalSales) /
COUNT(DISTINCT InvoiceNo) AS AvgOrderValue
FROM ecommerce;

-- Top Countries by Orders
SELECT
Country,
COUNT(DISTINCT InvoiceNo) Orders
FROM ecommerce
GROUP BY Country
ORDER BY Orders DESC;

-- Revenue Ranking
SELECT
CustomerID,
SUM(TotalSales) Revenue,
RANK() OVER(
ORDER BY SUM(TotalSales) DESC
) CustomerRank
FROM ecommerce
GROUP BY CustomerID;

-- Running Revenue
SELECT
InvoiceDate,
SUM(TotalSales) DailyRevenue,
SUM(SUM(TotalSales))
OVER(
ORDER BY InvoiceDate
) RunningRevenue
FROM ecommerce
GROUP BY InvoiceDate;