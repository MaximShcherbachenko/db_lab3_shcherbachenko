import psycopg2
import csv

username = "postgres"
password = "admin"
database = "formula1_DB"
host = "localhost"
port = "5432"

OUTPUT_CSV_FILE = 'shcherbachenko_DB_{}.csv'

TABLES = [
    'constructors',
    'drivercarnumber',
    'drivername',
    'racedate',
    'racename',
    'results',
]

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:
    cur = conn.cursor()
    for table_name in TABLES:
        cur.execute('SELECT * FROM ' + table_name)
        fields = [x[0] for x in cur.description]
        with open(OUTPUT_CSV_FILE.format(table_name), 'w') as outfile:
            writer = csv.writer(outfile)
            writer.writerow(fields)
            for row in cur:
                writer.writerow([str(x) for x in row])
