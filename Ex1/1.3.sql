USE Northwind
-- 1.3	Repeat question above, but add in the Supplier Name and Country.
SELECT S.CompanyName, S.Country, P.* 
FROM Products P
-- Products P aliases P for the Products table
JOIN Suppliers S ON P.SupplierID = S.SupplierID
--JOIN looks for overlapping data in 2 tables, combines them and returns information into one new table
WHERE QuantityPerUnit LIKE '%bottle%'
ORDER BY Country