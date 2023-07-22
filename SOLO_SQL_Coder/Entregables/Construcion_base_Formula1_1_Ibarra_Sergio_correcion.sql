USE Formula1_1;

 CREATE TABLE Circuits (circuitID  INT IDENTITY(1,1) NOT NULL PRIMARY KEY,   
 circuitRef varchar(50) NOT NULL,    
 name varchar(50) NOT NULL,  
 location varchar(50) NOT NULL,    
 Country varchar(50) NOT NULL,  
 url varchar(50));

 SELECT * FROM Circuits;



 CREATE TABLE Constructors (
    constructorID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    constructorRef INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    Nationality VARCHAR(50) NOT NULL,
    URL VARCHAR(50) NOT NULL
);

SELECT * FROM Constructors;



CREATE TABLE Races (
    raceId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    year_race INT NOT NULL,
    round_race INT NOT NULL,
    circuitID INT NOT NULL,
    name_race INT NOT NULL,
    date_race INT NOT NULL,
    time_race VARCHAR(50) NOT NULL,
    FOREIGN KEY (circuitID) REFERENCES Circuits(circuitID)
);


-- Modify the data type of name_race column to VARCHAR(50)
ALTER TABLE Races
ALTER COLUMN name_race VARCHAR(50) NOT NULL;

-- Modify the data type of date_race column to DATE
ALTER TABLE Races
ALTER COLUMN date_race DATE NOT NULL;

SELECT * FROM Races;


CREATE TABLE Constructors_results (
    constructorResultsId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    raceId INT NOT NULL,
    constructorId INT NOT NULL,
    Points INT NOT NULL,
    Status_constructor VARCHAR(50) NOT NULL,
    FOREIGN KEY (raceId) REFERENCES Races(raceId),
    FOREIGN KEY (constructorId) REFERENCES Constructors(constructorId)
);

SELECT * FROM Constructors_results;



CREATE TABLE Constructors_standings (
    constructorStandingsId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    raceId INT NOT NULL,
    constructorId INT NOT NULL,
    Points INT NOT NULL,
    Position VARCHAR(50) NOT NULL,
    PositionText VARCHAR(50) NOT NULL,
    Wins INT NOT NULL,
    FOREIGN KEY (raceId) REFERENCES Races(raceId),
    FOREIGN KEY (constructorId) REFERENCES Constructors(constructorId)
);

-- Modify the data type of date_race column to DATE
ALTER TABLE Constructors_standings
ALTER COLUMN Position INT NOT NULL;


SELECT * FROM Constructors_standings;

-- Replace 'Constructors_standings' with the actual name of your table
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Constructors_standings';


CREATE TABLE Drivers (
    driverId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    driverRef VARCHAR(50) NOT NULL,
    number INT NOT NULL,
    Code VARCHAR(50) NOT NULL,
    Forename VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL,
    nationality VARCHAR(50) NOT NULL
);


-- To change the 'NOT NULL' constraint to 'NULL' for columns 'number' and 'Code' in the table 'Drivers'
ALTER TABLE Drivers
ALTER COLUMN number INT NULL;

ALTER TABLE Drivers
ALTER COLUMN Code VARCHAR(50) NULL;

-- To add a new column 'DOB' with data type 'DATE' to the table 'Drivers'
ALTER TABLE Drivers
ADD DOB DATE NOT NULL;


SELECT * FROM Drivers;

-- Replace 'Constructors_standings' with the actual name of your table
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Drivers';



CREATE TABLE Drivers_standings (
    driverStandingsId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    Points INT NOT NULL,
    Position VARCHAR(50) NOT NULL,
    PositionText VARCHAR(50) NOT NULL,
    Wins INT NOT NULL,
    FOREIGN KEY (raceId) REFERENCES Races(raceId),
    FOREIGN KEY (driverId) REFERENCES Drivers(driverId)
);


-- Modify the data type 
ALTER TABLE Drivers_standings
ALTER COLUMN Position INT NOT NULL;


SELECT * FROM Drivers_standings;

-- Replace 'Constructors_standings' with the actual name of your table
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Drivers_standings';




CREATE TABLE Lap_times (
    lapID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    Position VARCHAR(50) NOT NULL,
    Time VARCHAR(50) NOT NULL,
    Miliseconds INT NOT NULL,
    FOREIGN KEY (raceId) REFERENCES Races(raceId),
    FOREIGN KEY (driverId) REFERENCES Drivers(driverId)
);


-- Modify the data type 
ALTER TABLE Lap_times
ALTER COLUMN Position INT NOT NULL;



-- To rename the column 'Time' to 'Time_lap'
EXEC sp_rename 'Lap_times.Time', 'Time_lap', 'COLUMN';

-- To modify the data type of the 'Time_lap' column to 'TIME'
ALTER TABLE Lap_times
ALTER COLUMN Time_lap TIME NOT NULL;



-- Replace 'Constructors_standings' with the actual name of your table
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Lap_times';

SELECT * FROM Lap_times;



CREATE TABLE PIT_stops (
    StopsID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    lap INT NOT NULL,
    Wins INT NOT NULL,
    Time INT NOT NULL,
    duration VARCHAR(50) NOT NULL,
    Miliseconds INT NOT NULL,
    FOREIGN KEY (raceId) REFERENCES Races(raceId),
    FOREIGN KEY (driverId) REFERENCES Drivers(driverId),
    FOREIGN KEY (lap) REFERENCES Lap_times(lapID)
);





-- To rename the column 'Time' to 'Time_lap'
EXEC sp_rename 'PIT_stops.Time', 'Time_stops', 'COLUMN';

-- Truncate the table to remove all existing data
TRUNCATE TABLE PIT_stops;

-- Modify the data type of the 'Time_stops' column to 'TIME'
ALTER TABLE PIT_stops
ALTER COLUMN Time_stops TIME NOT NULL;



-- Check for default constraint on the 'Time_stops' column
SELECT OBJECT_NAME(default_object_id) AS default_constraint_name
FROM sys.columns
WHERE OBJECT_ID = OBJECT_ID('PIT_stops') AND name = 'Time_stops';



-- Drop the table PIT_stops
DROP TABLE PIT_stops;




CREATE TABLE PIT_stops (
    StopsID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    lap INT NOT NULL,
    Time_stops TIME NOT NULL,
    duration FLOAT NOT NULL,
    Miliseconds INT NOT NULL,
    FOREIGN KEY (raceId) REFERENCES Races(raceId),
    FOREIGN KEY (driverId) REFERENCES Drivers(driverId),
    FOREIGN KEY (lap) REFERENCES Lap_times(lapID)
);



-- Replace 'Constructors_standings' with the actual name of your table
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'PIT_stops';


SELECT * FROM PIT_stops;




CREATE TABLE qualifying (
    qualifyId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    constructorId INT NOT NULL,
    number INT NOT NULL,
    Position VARCHAR(50) NOT NULL,
    q1 VARCHAR(50) NOT NULL,
    q2 VARCHAR(50) NOT NULL,
    q3 VARCHAR(50) NOT NULL,
    q4 VARCHAR(50) NOT NULL,
    FOREIGN KEY (raceId) REFERENCES Races(raceId),
    FOREIGN KEY (driverId) REFERENCES Drivers(driverId),
    FOREIGN KEY (constructorId) REFERENCES Constructors(constructorId)
);

-- Modify the data type of the 'Time_stops' column to 'TIME'
ALTER TABLE qualifying 
ALTER COLUMN Position INT NOT NULL;


ALTER TABLE qualifying
ALTER COLUMN q1 VARCHAR(50) NULL;

ALTER TABLE qualifying
ALTER COLUMN q2 VARCHAR(50) NULL;

ALTER TABLE qualifying
ALTER COLUMN q3 VARCHAR(50) NULL;


-- To delete the column 'q4' from the table 'qualifying'
ALTER TABLE qualifying
DROP COLUMN q4;



-- Replace 'Constructors_standings' with the actual name of your table
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'qualifying';


SELECT * FROM qualifying ;



CREATE TABLE results (
    resultID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    constructorId INT NOT NULL,
    number INT NOT NULL,
    Grid INT NOT NULL,
    Position VARCHAR(50) NOT NULL,
    PositionText VARCHAR(50) NOT NULL,
    PositionOrder VARCHAR(50) NOT NULL,
    Time VARCHAR(50) NOT NULL,
    Miliseconds INT NOT NULL,
    fastestLap INT NOT NULL,
    rank_results INT NOT NULL,
    statusID INT NOT NULL,
    FOREIGN KEY (raceId) REFERENCES Races(raceId),
    FOREIGN KEY (driverId) REFERENCES Drivers(driverId),
    FOREIGN KEY (constructorId) REFERENCES Constructors(constructorId)
);

-- Change the data type of the 'Position' column to INT
ALTER TABLE results
ALTER COLUMN Position INT NOT NULL;


-- Rename the 'Time' column to 'Time_results'
EXEC sp_rename 'results.Time', 'Time_results', 'COLUMN';

-- Allow NULL values in specific columns
ALTER TABLE results
ALTER COLUMN Position INT NULL;

ALTER TABLE results
ALTER COLUMN Time_results VARCHAR(50) NULL;

ALTER TABLE results
ALTER COLUMN Miliseconds INT NULL;

ALTER TABLE results
ALTER COLUMN fastestLap INT NULL;

ALTER TABLE results
ALTER COLUMN rank_results INT NULL;



-- Replace 'Constructors_standings' with the actual name of your table
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'results';

SELECT * FROM results  ;


CREATE TABLE status_ (
    statusID INT NOT NULL PRIMARY KEY,
    statusDescription VARCHAR(100) NOT NULL
);

ALTER TABLE results
ADD CONSTRAINT FK_results_status
FOREIGN KEY (statusID) REFERENCES status_(statusID);

SELECT * FROM status_;



CREATE TABLE sprint_results (
    resultID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    raceId INT NOT NULL,
    driverId INT NOT NULL,
    constructorId INT NOT NULL,
    number INT NOT NULL,
    Grid INT NOT NULL,
    Position VARCHAR(50) NOT NULL,
    PositionText VARCHAR(50) NOT NULL,
    PositionOrder VARCHAR(50) NOT NULL,
    Time VARCHAR(50) NOT NULL,
    Miliseconds INT NOT NULL,
    fastestLap INT NOT NULL,
    rank_sprint_res INT NOT NULL,
    statusID INT NOT NULL,
    FOREIGN KEY (raceId) REFERENCES Races(raceId),
    FOREIGN KEY (driverId) REFERENCES Drivers(driverId),
    FOREIGN KEY (constructorId) REFERENCES Constructors(constructorId)
);

-- Change the data type of the 'Position' column to INT
ALTER TABLE sprint_results
ALTER COLUMN Position INT NOT NULL;

-- Rename the 'Time' column to 'Time_sprints_res'
EXEC sp_rename 'sprint_results.Time', 'Time_sprints_res', 'COLUMN';

-- Allow NULL values in specific columns
ALTER TABLE sprint_results
ALTER COLUMN Position INT NULL;

ALTER TABLE sprint_results
ALTER COLUMN Time_sprints_res VARCHAR(50) NULL;

ALTER TABLE sprint_results
ALTER COLUMN Miliseconds INT NULL;

ALTER TABLE sprint_results
ALTER COLUMN fastestLap INT NULL;

ALTER TABLE sprint_results
ALTER COLUMN rank_sprint_res INT NULL;



-- Replace 'Constructors_standings' with the actual name of your table
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'sprint_results';


SELECT * FROM sprint_results  ;
