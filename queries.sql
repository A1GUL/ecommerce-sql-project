USE ECommerceDB;
GO

-- 1. List all customers
SELECT *
FROM Customers;
GO

-- 2. Find products with stock greater than 10
SELECT *
FROM Products
WHERE Stock > 10;
GO

-- 3. List products from highest to lowest price
SELECT *
FROM Products
ORDER BY Price DESC;
GO

-- 4. List customers and their orders
SELECT
    C.FirstName,
    C.LastName,
    O.OrderID
FROM Customers AS C
INNER JOIN Orders AS O
    ON C.CustomerID = O.CustomerID;
GO

-- 5. Count orders for each customer
SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    COUNT(O.OrderID) AS OrderCount
FROM Customers AS C
LEFT JOIN Orders AS O
    ON C.CustomerID = O.CustomerID
GROUP BY
    C.CustomerID,
    C.FirstName,
    C.LastName
ORDER BY OrderCount DESC;
GO

-- 6. Calculate total sales for each product
SELECT
    P.ProductName,
    SUM(OD.Quantity) AS TotalSold,
    SUM(OD.Quantity * OD.UnitPrice) AS TotalRevenue
FROM Products AS P
INNER JOIN OrderDetails AS OD
    ON P.ProductID = OD.ProductID
GROUP BY
    P.ProductID,
    P.ProductName
ORDER BY TotalRevenue DESC;
GO