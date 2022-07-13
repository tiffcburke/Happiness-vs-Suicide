/*
Examples of more complex SQL queries 
*/


-- CTE: Improves readability
WITH CTE_Ranks AS
(
SELECT a.Country, a.[Happiness Rank] AS '2015',
b.[Happiness Rank] AS '2016',
c.[Happiness#Rank] AS '2017',
d.[Overall Rank] AS '2018',
e.[Overall Rank] AS '2019'
FROM HVS..Hap15 a 
INNER JOIN HVS..Hap16 b
ON a.Country = b.Country
INNER JOIN HVS..Hap17 c
ON c.Country = b.Country
INNER JOIN HVS..Hap18 d
ON d.[Country or region] = c.Country
INNER JOIN HVS..Hap19 e
ON d.[Country or region] = e.[Country or region]
)

SELECT *
FROM CTE_Ranks


--Temp Table: temporary stores data
CREATE TABLE #temp_Ranks (
Country varchar(50), 
"2015" int ,
"2016" int,
"2017" int,
"2018" int,
"2019" int)

INSERT INTO #Temp_Ranks 
SELECT a.Country, a.[Happiness Rank] AS '2015',
b.[Happiness Rank] AS '2016',
c.[Happiness#Rank] AS '2017',
d.[Overall Rank] AS '2018',
e.[Overall Rank] AS '2019'
FROM HVS..Hap15 a 
INNER JOIN HVS..Hap16 b
ON a.Country = b.Country
INNER JOIN HVS..Hap17 c
ON c.Country = b.Country
INNER JOIN HVS..Hap18 d
ON d.[Country or region] = c.Country
INNER JOIN HVS..Hap19 e
ON d.[Country or region] = e.[Country or region]

SELECT *
FROM #temp_Ranks
WHERE "2015" < 11
AND "2016" < 11
AND "2017" < 11
AND "2018" < 11
AND "2019" < 11

SELECT *
FROM #temp_Ranks
WHERE "2015" = 1
OR "2016" = 1
OR "2017" = 1
OR "2018" = 1
OR "2019" = 1


--Subquries: aggregates in multiple stages.
SELECT Country, Year, ProbSuicideFemale, ProbSuicideMale,
(SELECT AVG(CONVERT(DECIMAL(18,2), ProbBothDying)) 
FROM Suicide) AS AVGDeathProb
FROM Suicide


