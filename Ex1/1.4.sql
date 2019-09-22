-- 1.4 shows how many products there are in each category. 
-- Include Category Name in result set and list the highest number first.
USE Northwind
SELECT P.CategoryID, COUNT(*) AS 'Amount Of Products', Categories.CategoryName
-- COUNT() counted everything from products table
FROM Products P
Join Categories ON Categories.CategoryID = P.CategoryID
GROUP BY P.CategoryID, Categories.CategoryName
-- GROUP BY() grouped categoryID from Products table 
-- working in conjuction with COUNT() displays result of how many products there are per CategoryID
ORDER BY [Amount Of Products] DESC
-- Orders in descending order by the AmountofProducts
