CREATE TABLE Racedate
(
    race_id      char(10)  NOT NULL,
    race_date    date      NOT NULL
);

CREATE TABLE Racename
(
    race_name  char(50)      NOT NULL,	
    race_id        char(10)       NOT NULL
);

CREATE TABLE Results
(
    res_id            char(10)                  NOT NULL,	
    race_id         char(10)	NOT NULL,
    driver_id      char(10)	NOT NULL,
    constr_id   char(10)	NOT NULL,
    points           int		NOT NULL
);

CREATE TABLE Constructors
(
    constr_id        char(10)	NOT NULL,
    constr_name char(50)	NOT NULL
);

CREATE TABLE Drivername
(
    driver_id   	char(10)	NOT NULL,
    driver_forename    char(50)	NOT NULL,
    driver_surname      char(50)	NOT NULL
);

CREATE TABLE Drivercarnumber
(
    driver_id       char(10)	NOT NULL,
    driver_num  char(50)	NOT NULL
);


----------------------
-- Define primary keys
----------------------
ALTER TABLE Racename ADD CONSTRAINT PK_Racename PRIMARY KEY (race_name);
ALTER TABLE Racedate ADD CONSTRAINT PK_Racedate PRIMARY KEY (race_id);
ALTER TABLE Constructors ADD CONSTRAINT PK_Constructors PRIMARY KEY (constr_id);
ALTER TABLE Drivername ADD CONSTRAINT PK_drivername PRIMARY KEY (driver_id);
ALTER TABLE Drivercarnumber ADD CONSTRAINT PK_Drivercarnumber PRIMARY KEY (driver_id);
ALTER TABLE Results ADD CONSTRAINT PK_Resultse PRIMARY KEY (res_id, race_id, driver_id, constr_id);


----------------------
-- Define foreign keys
----------------------
ALTER TABLE Results
ADD CONSTRAINT FK_Results_Racedate FOREIGN KEY (race_id) REFERENCES Racedate (race_id);
ALTER TABLE Results
ADD CONSTRAINT FK_Results_Drivername FOREIGN KEY (driver_id) REFERENCES Drivername (driver_id);
ALTER TABLE Results
ADD CONSTRAINT FK_Results_Constructors FOREIGN KEY (constr_id) REFERENCES Constructors (constr_id);
ALTER TABLE Drivername
ADD CONSTRAINT FK_Drivername_Drivercarnumber FOREIGN KEY (driver_id) REFERENCES Drivercarnumber (driver_id);
ALTER TABLE Racename
ADD CONSTRAINT FK_Racename_Racedate FOREIGN KEY (race_id) REFERENCES Racedate (race_id);

