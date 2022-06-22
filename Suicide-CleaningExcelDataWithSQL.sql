/*

Cleaning up excel using SQL

*/

SELECT *
FROM HVS..Suicide 


--Renaming columns for better understanding.
EXEC sp_rename 'Suicide.BothSexes', 'ProbBothDying', 'COLUMN'
EXEC sp_rename 'Suicide.Male', 'ProbMaleDying', 'COLUMN'
EXEC sp_rename 'Suicide.Female', 'ProbFemaleDying', 'COLUMN'
EXEC sp_rename 'Suicide.BothSexes2', 'ProbSuicideBoth', 'COLUMN'
EXEC sp_rename 'Suicide.Male2', 'ProbSuicideMale', 'COLUMN'
EXEC sp_rename 'Suicide.Female2', 'ProbSuicideFemale', 'COLUMN';


--Updating the columns to show probability only. Removing excess information. 
UPDATE Suicide
SET ProbBothDying = 
SUBSTRING(ProbBothDying, 1, CHARINDEX('[', ProbBothDying)-1)
FROM Suicide

UPDATE Suicide
SET ProbMaleDying = 
SUBSTRING(ProbMaleDying, 1, CHARINDEX('[', ProbMaleDying)-1)
FROM Suicide

UPDATE Suicide
SET ProbFemaleDying = 
SUBSTRING(ProbFemaleDying, 1, CHARINDEX('[', ProbFemaleDying)-1)
FROM Suicide

UPDATE Suicide
SET ProbSuicideBoth = 
SUBSTRING(ProbSuicideBoth, 1, CHARINDEX('[', ProbSuicideBoth)-1)
FROM Suicide

UPDATE Suicide
SET ProbSuicideMale = 
SUBSTRING(ProbSuicideMale, 1, CHARINDEX('[', ProbSuicideMale)-1)
FROM Suicide

UPDATE Suicide
SET ProbSuicideFemale = 
SUBSTRING(ProbSuicideFemale, 1, CHARINDEX('[', ProbSuicideFemale)-1)
FROM Suicide