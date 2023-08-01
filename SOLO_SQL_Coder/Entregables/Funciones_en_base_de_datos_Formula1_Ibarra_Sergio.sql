
-- a) Constructor standings for a year (TRY 2)


CREATE FUNCTION dbo.GetConstructorStandings2 (@year INT)  
RETURNS TABLE
AS
RETURN
(
  SELECT C.name, SUM(CS.points) AS total_points
  FROM Constructors_standings CS
  JOIN Constructors C ON CS.constructorId = C.constructorId 
  WHERE CS.raceId IN (SELECT raceId FROM Races WHERE year_race = @year)
  GROUP BY C.name
);

SELECT *
FROM dbo.GetConstructorStandings2(2010)
ORDER BY total_points DESC;




-- b) Driver standings for a year 

CREATE FUNCTION dbo.GetDriverStandings2 (@year INT)
RETURNS TABLE
AS  
RETURN
(
    SELECT d.surname, SUM(ds.points) AS total_points
    FROM Drivers_standings ds
    JOIN Drivers d ON ds.driverId = d.driverId
    WHERE ds.raceId IN (SELECT raceId FROM Races WHERE year_race = @year)
    GROUP BY d.surname
);

SELECT *
FROM dbo.GetDriverStandings2(2021) 
ORDER BY total_points DESC;




-- c) Final standings for a driver over all years
CREATE FUNCTION dbo.GetDriverFinalStandings2(@driverName VARCHAR(100))  
RETURNS TABLE
AS
RETURN
(
  SELECT R.year_race, DS.position
  FROM Races R
  JOIN Drivers_standings DS ON R.raceId = DS.raceId
  JOIN Drivers D ON DS.driverId = D.driverId
  WHERE D.surname = @driverName 
);

-- To order results:

SELECT *
FROM dbo.GetDriverFinalStandings2('Alonso')
ORDER BY year_race;


