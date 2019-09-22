use Northwind
-- 1.2 List all products stored in bottles.
SELECT * 
-- Chooses all the column to be displayed
FROM Products
-- specifies the table, the columns are chosen from
WHERE QuantityPerUnit LIKE '%bottle%'
-- LIKE clause searches specified pattern in a column
-- in this case, looks for any word with bottle on it
-- % sign represents zero, one or multiple charactes
