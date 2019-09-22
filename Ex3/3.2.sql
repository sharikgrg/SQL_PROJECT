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