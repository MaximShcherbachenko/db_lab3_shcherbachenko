---------------------------
-- Populate Racedate table
---------------------------
INSERT INTO Racedate(race_id, race_date)
VALUES(1, TO_DATE('2009-03-29', 'yyyy-mm-dd'));
INSERT INTO Racedate(race_id, race_date)
VALUES(2, TO_DATE('2009-04-05', 'yyyy-mm-dd'));
INSERT INTO Racedate(race_id, race_date)
VALUES(3, TO_DATE('2009-04-19', 'yyyy-mm-dd'));
INSERT INTO Racedate(race_id, race_date)
VALUES(4, TO_DATE('2009-04-26', 'yyyy-mm-dd'));
INSERT INTO Racedate(race_id, race_date)
VALUES(5, TO_DATE('2009-05-10', 'yyyy-mm-dd'));


-------------------------
-- Populate Racename table
-------------------------
INSERT INTO Racename(race_name, race_id)
VALUES('Australian Grand Prix', 1);
INSERT INTO Racename(race_name, race_id)
VALUES('Malaysian Grand Prix', 2);
INSERT INTO Racename(race_name, race_id)
VALUES('Chinese Grand Prix', 3);
INSERT INTO Racename(race_name, race_id)
VALUES('Bahrain Grand Prix', 4);
INSERT INTO Racename(race_name, race_id)
VALUES('Spanish Grand Prix', 5);


--------------------------
-- Populate Constructors table
--------------------------
INSERT INTO Constructors(constr_id, constr_name)
VALUES(1, 'McLaren');
INSERT INTO Constructors(constr_id, constr_name)
VALUES(2, 'Red Bull');
INSERT INTO Constructors(constr_id, constr_name)
VALUES(3, 'Mercedes');
INSERT INTO Constructors(constr_id, constr_name)
VALUES(4, 'Ferrari');
INSERT INTO Constructors(constr_id, constr_name)
VALUES(5, 'Alpine');


----------------------------
-- Populate Drivercarnumber table
----------------------------
INSERT INTO Drivercarnumber(driver_id, driver_num)
VALUES(1, '44');
INSERT INTO Drivercarnumber(driver_id, driver_num)
VALUES(2, '3');
INSERT INTO Drivercarnumber(driver_id, driver_num)
VALUES(3, '33');
INSERT INTO Drivercarnumber(driver_id, driver_num)
VALUES(4, '14');
INSERT INTO Drivercarnumber(driver_id, driver_num)
VALUES(5, '16');


------------------------
-- Populate Drivername table
------------------------
INSERT INTO Drivername(driver_id, driver_forename, driver_surname)
VALUES(1, 'Lewis', 'Hamilton');
INSERT INTO Drivername(driver_id, driver_forename, driver_surname)
VALUES(2, 'Daniel', 'Ricciardo');
INSERT INTO Drivername(driver_id, driver_forename, driver_surname)
VALUES(3, 'Max', 'Verstappen');
INSERT INTO Drivername(driver_id, driver_forename, driver_surname)
VALUES(4, 'Fernando', 'Alonso');
INSERT INTO Drivername(driver_id, driver_forename, driver_surname)
VALUES(5, 'Charles', 'Leclerc');


----------------------------
-- Populate Results table
----------------------------
INSERT INTO Results(res_id, race_id, driver_id, constr_id, points)
VALUES(1, 1, 1, 1, '10');
INSERT INTO Results(res_id, race_id, driver_id, constr_id, points)
VALUES(2, 1, 2, 2, '8');
INSERT INTO Results(res_id, race_id, driver_id, constr_id, points)
VALUES(3, 1, 3, 3, '25');
INSERT INTO Results(res_id, race_id, driver_id, constr_id, points)
VALUES(4, 1, 4, 4, '5');
INSERT INTO Results(res_id, race_id, driver_id, constr_id, points)
VALUES(5, 1, 5, 5, '4');