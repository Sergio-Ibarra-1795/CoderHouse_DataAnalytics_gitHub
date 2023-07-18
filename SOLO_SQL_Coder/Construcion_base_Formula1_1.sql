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

SELECT * FROM Constructors_standings;



CREATE TABLE Drivers (
    driverId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    driverRef VARCHAR(50) NOT NULL,
    number INT NOT NULL,
    Code VARCHAR(50) NOT NULL,
    Forename VARCHAR(50) NOT NULL,
    Surname VARCHAR(50) NOT NULL,
    nationality VARCHAR(50) NOT NULL
);

SELECT * FROM Drivers;



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

SELECT * FROM Drivers_standings;


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

SELECT * FROM results  ;



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

SELECT * FROM sprint_results  ;
