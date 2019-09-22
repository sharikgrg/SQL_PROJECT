USE Northwind
--1.5 List all UK employees using concatenation to join their title of courtesy, first name and last name together.
-- include their city of residence.
SELECT TitleOfCourtesy + ' ' + FirstName + ' ' + LastName AS 'Employee Names', City
-- + concatenates titleOfCourtesy, first name and last name in a single column
FROM Employees
WHERE Country = 'UK'
-- sets the condition to only show UK based employees
ORDER BY FirstName
-- Displays in ascending order by the first name