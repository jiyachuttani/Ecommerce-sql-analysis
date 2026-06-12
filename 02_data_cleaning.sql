SELECT *
FROM ecommerce
WHERE CustomerID = '';

SELECT COUNT(*)
FROM ecommerce
WHERE CustomerID = '';



WITH duplicates AS (
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY InvoiceNo,
StockCode,
CustomerID
) AS rn
FROM ecommerce
)

SELECT *
FROM duplicates
WHERE rn > 1;


SELECT *
FROM ecommerce
WHERE Quantity < 0;

SELECT *
FROM ecommerce
WHERE UnitPrice < 0;