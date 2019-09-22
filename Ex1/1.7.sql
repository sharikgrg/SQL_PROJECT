-- 1.7	Count how many Orders have a Freight amount greater than 100.00 
-- and either USA or UK as Ship Country.
USE Northwind 
SELECT ShipCountry, COUNT(Freight) AS 'OVER 100 FREIGHT' 
FROM Orders
WHERE ShipCountry = 'UK' OR ShipCountry = 'USA'
AND Freight > 100
-- sets the condition so it only displays information of UK and USA 
-- where the freight of order's over a 100
Group BY ShipCountry

