-- select * from resultscopy
-- select * from results
-- delete from resultscopy

DO $$
DECLARE
    RES_ID   RESULTSCOPY.POINTS%TYPE;
    POINTS RESULTSCOPY.POINTS%TYPE;
BEGIN
    RES_ID := 5;
    POINTS := 10;
    FOR COUNTER IN 1..5
        LOOP
            INSERT INTO resultscopy(res_id, points)
            VALUES (COUNTER + RES_ID, POINTS);
        END LOOP;
END;
$$