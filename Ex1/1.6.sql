-- 1.6 List Sales Totals for all Sales Regions (via the Territories table using 4 joins)
-- with a Sales Total greater than 1,000,000. 
--Use rounding or FORMAT to present the numbers. 
use northwind
select R.RegionDescription, R.RegionID, CAST(SUM(Quantity*UnitPrice) AS INT) AS 'Sales Total'
-- CAST() allows to converted the data type to integer
-- SUM(Quantity*UnitPrice) is a calculation for Sales total
FROM [Order Details] OD
JOIN Orders O ON OD.OrderID = O.OrderID
JOIN EmployeeTerritories E on O.EmployeeID = E.EmployeeID
JOIN Territories T ON E.TerritoryID = T.TerritoryID
JOIN Region R ON T.RegionID = R.RegionID
-- 4 JOINS were made to ensure the correct info corresponded with correct column
GROUP BY R.RegionID, R.RegionDescription
HAVING SUM(Quantity*UnitPrice)> 1000000
-- HAVING clause sets out condition for grouped datas
-- in this case, only groups with SUM(Quantity*UnitPrice)> 1000000 shows
ORDER BY [Sales Total] DESC
