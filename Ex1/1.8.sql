-- 1.8 Write an SQL Statement to identify the Order Number of the 
--Order with the highest amount of discount applied to that order.
USE Northwind
SELECT TOP 5 OrderID, ROUND(SUM((Quantity * UnitPrice * Discount)),2) AS 'Discounted Amount'
-- TOP 5 only shows the top 5 results
-- ROUND(x,2) rounds to 2 decimal place 
-- By multiplying Quantity, UnitPrice and Discount, the discounted amount from an order
-- By summing the discounted amount, GROUP BY() can be done to find the total discounted amount of each order 
FROM [Order Details]
GROUP BY OrderID
ORDER BY 'Discounted Amount' DESC
-- by putting in descending order we see the highest value first
-- ORDER with ID 1053 and 10372 has the highest discount applied at 2108