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