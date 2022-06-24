/*

Using SQL to explore data

*/

--Creating a table that shows the world happiness score progression

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



--Probability of dying & happiness score by Country 2015 vs 2019
SELECT s.Country, s.ProbBothDying,
	(SELECT a.[Happiness Score]
	FROM Hap15 a
	WHERE a.Country = s.Country
	) AS '2015 Score'
FROM Suicide s
WHERE year = '2015'

SELECT s.Country, s.ProbBothDying,
	(SELECT e.Score
	FROM Hap19 e
	WHERE e.[Country or region] = s.Country
	) AS '2019 Score'
FROM Suicide s
WHERE year = '2019'



--Looking at the Happiness Score by Region

SELECT Region, AVG([Happiness Score]) AS AvgHapScore,
MAX([Happiness Score]) AS MaxHapScore,
MIN([Happiness Score]) AS MinHapScore,
COUNT([Happiness Score]) AS NumberOfCountries
FROM HVS..Hap15
GROUP BY Region
ORDER BY NumberOfCountries DESC



--The below queries give you stats on happiness, death, and suicide for years 2015-2019
SELECT DISTINCT(s.Country), a.[Happiness Rank], a.[Happiness Score], s.ProbSuicideFemale, s.ProbSuicideMale, s.ProbBothDying
FROM Suicide s
INNER JOIN Hap15 a
ON s.Country = a.Country
WHERE s.year = '2015'
ORDER BY a.[Happiness Rank]

SELECT DISTINCT(s.Country), b.[Happiness Rank], b.[Happiness Score], s.ProbSuicideFemale, s.ProbSuicideMale, s.ProbBothDying
FROM Suicide s
INNER JOIN Hap16 b
ON s.Country = b.Country
WHERE s.year = '2016'
ORDER BY b.[Happiness Rank]

SELECT DISTINCT(s.Country), c.[Happiness#Rank], c.[Happiness#Score], s.ProbSuicideFemale, s.ProbSuicideMale, s.ProbBothDying
FROM Suicide s
INNER JOIN Hap17 c
ON s.Country = c.Country
WHERE s.year = '2017'
ORDER BY c.[Happiness#Rank]

SELECT DISTINCT(s.Country), d.[Overall rank], d.Score, s.ProbSuicideFemale, s.ProbSuicideMale, s.ProbBothDying
FROM Suicide s
INNER JOIN Hap18 d
ON s.Country = d.[Country or region]
WHERE s.year = '2018'
ORDER BY d.Score

SELECT DISTINCT(s.Country), e.[Overall rank], e.Score, s.ProbSuicideFemale, s.ProbSuicideMale, s.ProbBothDying
FROM Suicide s
INNER JOIN Hap19 e
ON s.Country = e.[Country or region]
WHERE s.year = '2019'
ORDER BY e.Score


--List 134 Countries that these two tables have in common. Hap## tables have 158 and Suicide table has 183 countries
SELECT DISTINCT(s.Country), a.Country
FROM Suicide s
INNER JOIN Hap15 a
ON s.Country = a.Country











