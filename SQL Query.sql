-- to find out which customers made the most significant purchases

SELECT c.customerName , SUM(p.amount) AS TotalPurchaseAmount
FROM payments p
inner join customers as c on
p.customerNumber= c.customerNumber
GROUP BY c.customerName
ORDER BY TotalPurchaseAmount DESC
LIMIT 10; 

-- Which product sold the most in the last quarter

SELECT
    ProductName, SUM(quantityOrdered) AS TotalSold FROM products p
    inner join orderdetails od on
    p.productCode = od.productCode
    inner join orders o on 
    od.orderNumber = o.orderNumber
WHERE orderDate BETWEEN '2004-10-01' AND '2004-12-31'
GROUP BY ProductName
ORDER BY TotalSold DESC
LIMIT 5;

-- The exact car models that performed the best. 

SELECT productName AS CarModel, SUM(quantityOrdered) AS TotalSales FROM products as p
inner join orderdetails od on
    p.productCode = od.productCode
    inner join orders o on 
    od.orderNumber = o.orderNumber
WHERE orderDate >= '2003-01-01' AND OrderDate <= '2005-12-31'
GROUP BY productName
ORDER BY TotalSales DESC limit 10;

-- 4.	Creating View for top selling Product

CREATE VIEW TopSellingProducts AS
SELECT productName AS CarModel, SUM(quantityOrdered) AS TotalSales FROM products as p
inner join orderdetails od on
    p.productCode = od.productCode
    inner join orders o on 
    od.orderNumber = o.orderNumber
WHERE orderDate >= '2003-01-01' AND OrderDate <= '2005-12-31'
GROUP BY productName
ORDER BY TotalSales DESC limit 10;

SELECT * FROM TopSellingProducts;

-- Shipping Status of the product

SELECT status, COUNT(*) AS OrderCount
FROM orders
GROUP BY status;


-- Maximum number of employees belongs which country

SELECT country, COUNT(*) AS EmployeeCount
FROM employees as e
inner join offices as o on 
e.officeCode = o.officeCode
GROUP BY country
ORDER BY EmployeeCount DESC
;











































