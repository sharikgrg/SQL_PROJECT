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
