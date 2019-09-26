# Exercise 1

##1.1

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

##1.2

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

##1.3

    USE Northwind
    -- 1.3	Repeat question above, but add in the Supplier Name and Country.
    SELECT S.CompanyName, S.Country, P.* 
    FROM Products P
    -- Products P aliases P for the Products table
    JOIN Suppliers S ON P.SupplierID = S.SupplierID
    --JOIN looks for overlapping data in 2 tables, combines them and returns information into one new table
    WHERE QuantityPerUnit LIKE '%bottle%'
    ORDER BY Country
    
##1.4

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
    
##1.5

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

##1.6

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
    
##1.7

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
    
##1.8

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

# Exercise 2

##2.1

    CREATE DATABASE SpartaAcademy
    --This created a database called SpartaAcademy
    
    
    USE SpartaAcademy
    CREATE TABLE Spartan -- CREATES TABLE NAME SPARTAN
    (
    SpartanID INT NOT NULL IDENTITY(1,1) PRIMARY KEY, -- Column Nam than DataType
    FirstName VARCHAR(16),
    LastName VARCHAR(16),
    CourseID INT,
    TrainerID INT,
    EmployeeID INT
    )
    
    CREATE TABLE Trainer
    (
    TrainerID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(16),
    LastName VARCHAR(16),
    EmployeeID INT
    )
    
    CREATE TABLE Course
    (
    CourseID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(56),
    TrainerID INT,
    AcademyID INT,
    RoomID INT,
    DateID INT
    )
    
    CREATE TABLE Room
    (
    RoomID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(16),
    AcademyID INT
    )
    
    CREATE TABLE Academy
    (
    AcademyID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Location VARCHAR(16)
    )
    
    CREATE TABLE Date
    (
    DateID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    StartDate DATE,
    EndDate DATE
    )
    
    CREATE TABLE Employee
    (
    EmployeeID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Type CHAR(1)
    )


    USE SpartaAcademy 
    INSERT INTO Date(StartDate, EndDate) -- Inserts into the 'table'('column Names') 
    Values('2018-01-15', '2018-03-02'), ('2018-01-22', '2018-03-03')
    -- values(Data) Data goes into corresponding column
    INSERT INTO Spartan (FirstName, LastName, CourseID, TrainerID, EmployeeID)
    Values('Adam', 'Smith', 1, 1, 1), ('John', 'Williams', 1, 1, 1), ('Nick', 'Willis', 1, 1, 1), ('Jenny', 'Jones', 1, 1, 1), ('Katie', 'Prince', 1, 1, 1), ('Peter', 'Brown', 1, 1, 1),
    ('Mo', 'Khan', 2, 2, 1), ('Juan', 'Carlos', 2, 2, 1), ('Jan', 'Miller', 2, 2, 1), ('Kyle', 'Carpenter', 2, 2, 1), ('Alvarao', 'Carlos', 2, 2, 1), ('Margaret', 'Baker', 2, 2, 1), ('Oti', 'Mwase', 2, 2, 1)
    
    INSERT INTO Trainer (FirstName, LastName, EmployeeID)
    VALUES('Tim', 'Cawte', 2), ('Richard', 'Gurney', 2)
    
    INSERT INTO Course(Name, TrainerID, AcademyID, RoomID, DateID)
    Values('BA-Test', 1, 1, 1, 1), ('Engineering', 2, 1, 2, 2)
    
    INSERT INTO Employee(Type)
    VALUES ('S'), ('T')
    
    INSERT INTO Room(Name, AcademyID)
    VALUES ('Room1', 1), ('Room2', 1)
    
    INSERT INTO Academy (Location)
    VALUES ('Richmond')

##2.2/2.3

    USE SpartaAcademy
    INSERT INTO Trainer (FirstName, LastName, EmployeeID)
    VALUES ('Samantha', 'Stark', 3)
    INSERT INTO Spartan (FirstName, LastName, CourseID, TrainerID, EmployeeID)
    VALUES ('Arim', 'Rai', 1, 1, 1)
    INSERT INTO Employee (Type)
    VALUES ('A')
    
#Exercise 3

##3.1

    -- 3.1 Produce a report similar to the above table (see 2.1) 
    -- from all 7 tables using one SQL statement (use FORMAT for the dates)
    USE SpartaAcademy
    SELECT c.Name AS 'Course', d.StartDate, d.EndDate, a.location, r.Name, 
    t.FirstName + ' ' + t.LastName AS 'Trainer', s.FirstName + ' ' + s.LastName AS 'Spartan'  
    FROM Course c
    JOIN Date d ON c.DateID = d.DateID
    JOIN Academy a ON a.AcademyID = c.AcademyID
    JOIN Room r ON r.RoomID = c.RoomID
    JOIN Trainer t ON c.TrainerID = t.TrainerID
    JOIN Spartan s ON t.TrainerID = s.trainerID
    ORDER BY Course
    
##3.2

    -- 3.2 Repeat 3.1 above but replace the Spartan Name column with Spartan Initials. 
    USE SpartaAcademy
    USE SpartaAcademy
    SELECT c.Name AS 'Course', d.StartDate, d.EndDate, a.location, r.Name, 
    LEFT(t.FirstName,1) + '.' + LEFT (t.LastName,1) AS 'Trainer', 
    LEFT(s.FirstName,1) + '.' + LEFT(s.LastName,1) AS 'Spartan'  
    --LEFT(t.FirstName,1) returns the first letter of the varchar or char
    FROM Course c
    JOIN Date d ON c.DateID = d.DateID
    JOIN Academy a ON a.AcademyID = c.AcademyID
    JOIN Room r ON r.RoomID = c.RoomID
    JOIN Trainer t ON c.TrainerID = t.TrainerID
    JOIN Spartan s ON t.TrainerID = s.trainerID
    ORDER BY Course
    
##3.3

    -- 3.3 Add a new column after End Date headed “Check Date” 
    -- which uses the DATEADD function to add 8 weeks to the Start Date column 
    -- for BA Test courses and 12 weeks for any others.
    USE SpartaAcademy
    SELECT c.Name AS 'Course', d.StartDate, d.EndDate,
    CASE -- CASE TO START A WHEN FUNCTION
        WHEN c.Name = 'BA-Test' -- SETTING THE CONDITION
        THEN DATEADD(WW, 8, d.StartDate) --IF CONDITION MET THIS COMMAND IS ACTIVATED
        -- DATEADD(WW, 8, d.StartDate) ADDS 8 WEEKS TO START DATE
        ELSE DATEADD(WW, 12, d.StartDate) -- IF CONDITION NOT MET THIS COMMAND IS ACTIVATED
        END AS 'Check Date',
    a.location, r.Name,
    LEFT(t.FirstName,1) + '.' + LEFT (t.LastName,1) AS 'Trainer', 
    LEFT(s.FirstName,1) + '.' + LEFT(s.LastName,1) AS 'Spartan'  
    FROM Course c
    JOIN Date d ON c.DateID = d.DateID
    JOIN Academy a ON a.AcademyID = c.AcademyID
    JOIN Room r ON r.RoomID = c.RoomID
    JOIN Trainer t ON c.TrainerID = t.TrainerID
    JOIN Spartan s ON t.TrainerID = s.trainerID
    ORDER BY Course
    
#Exercise 4

##4.1

    -- 4.1 Add Primary Keys and Foreign Keys to the Sparta Academy database, where needed
    
    USE SpartaAcademy
    
    ALTER TABLE Course
    ADD FOREIGN KEY (DateID) REFERENCES Date(DateID)
    
    ALTER TABLE Course
    ADD FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)
    
    ALTER TABLE Course
    ADD FOREIGN KEY (AcademyID) REFERENCES Academy(AcademyID)
    
    ALTER TABLE Course
    ADD FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
    
    
    ALTER TABLE Spartan
    ADD FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
    
    ALTER TABLE Spartan
    ADD FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)
    
    ALTER TABLE Spartan
    ADD FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
    
    
    ALTER TABLE Trainer
    ADD FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
    
    
    ALTER TABLE Room
    ADD FOREIGN KEY (AcademyID) REFERENCES Academy(AcademyID)
