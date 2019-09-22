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
