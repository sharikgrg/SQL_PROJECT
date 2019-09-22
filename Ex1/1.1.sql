USE Northwind
-- 1.1 List all customers in either Paris or London. 
-- Include CustomerID, Company Name and all address fields

SELECT CustomerID, CompanyName, Address + ', ' + City + ', ' + Country + ', ' + PostalCode AS 'Full Address' 
-- select  chooses columns to be displayed. 
-- + and AS: Joins Address, City, Country, Post code columns and joins them to display under the full address heading
FROM Customers
-- The columns chosen above are chosen from the table named Customers
WHERE City = 'Paris' OR City = 'London' 
-- Information is only displayed if the city is Paris Or London 
ORDER BY City 
-- Outcome is ordered by City in a ascending manner
