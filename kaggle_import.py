import psycopg2
import csv

username = "postgres"
password = "admin"
database = "formula1_DB"
host = "localhost"
port = "5432"

INPUT_CSV_FILE = 'drivers.csv'

query_0 = '''
CREATE TABLE drivername_new
(
    driver_id   	   char(10)	NOT NULL,
    driver_forename    char(50)	NOT NULL,
    driver_surname     char(50)	NOT NULL,
    CONSTRAINT pk_drivername_new PRIMARY KEY (driver_id)
);
'''

query_1 = '''
DELETE FROM drivername_new
'''

query_2 = '''
INSERT INTO drivername_new (driver_id, driver_forename, driver_surname) 
VALUES (%s, %s, %s)
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:
    cur = conn.cursor()
    cur.execute(query_1)
    with open(INPUT_CSV_FILE, 'r') as inf:
        reader = csv.DictReader(inf)
        for row in reader:
            values = (row['driverId'], row['forename'], row['surname'])
            cur.execute(query_2 , values)

    conn.commit()
