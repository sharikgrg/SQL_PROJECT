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