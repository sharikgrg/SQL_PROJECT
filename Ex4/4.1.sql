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