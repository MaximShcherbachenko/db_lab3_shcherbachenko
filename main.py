import psycopg2
import matplotlib.pyplot as plt

username = "postgres"
password = "admin"
database = "formula1_DB"
host = "localhost"
port = "5432"

query_1 = '''
create view SuccessfulDrivers as
select drivername.driver_id, driver_forename, driver_surname, points
from drivername join results on (Drivername.driver_id = Results.driver_id)
where points > 9
'''

query_2 = '''
create view DriverStandings as
select driver_forename, driver_surname, points
from Drivername join Results on (Drivername.driver_id = Results.driver_id)
'''

query_3 = '''
create view PointsDepending as
select Drivername.driver_id, points
from Drivername join Results on (Drivername.driver_id = Results.driver_id)
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:
    cur = conn.cursor()

    cur.execute('DROP VIEW IF EXISTS SuccessfulDrivers')

    cur.execute(query_1)

    cur.execute('SELECT * FROM SuccessfulDrivers')

    driver_surname = []
    points = []

    for row in cur:
        driver_surname.append(row[2])
        points.append(row[3])

    x_range = range(len(points))

    figure, (bar_ax, pie_ax, graph_ax) = plt.subplots(1, 3)
    bar = bar_ax.bar(x_range, points, label='Points')
    bar_ax.set_title('Pilots with >= 10 points')
    bar_ax.set_xlabel('Pilots')
    bar_ax.set_ylabel('Points')
    bar_ax.set_xticks(x_range)
    bar_ax.set_xticklabels(driver_surname)


    cur.execute('DROP VIEW IF EXISTS DriverStandings')

    cur.execute(query_2)

    cur.execute('SELECT * FROM DriverStandings')

    driver_surname = []
    points = []

    for row in cur:
        driver_surname.append(row[1])
        points.append(row[2])


    def make_autopct(values):
        def my_autopct(pct):
            total = sum(values)
            val = int(round(pct * total / 100.0))
            return '{p:.2f}%  ({v:d})'.format(p=pct, v=val)

        return my_autopct

    pie_ax.pie(points, labels=driver_surname, autopct=make_autopct(points))
    pie_ax.set_title("Points of each pilot")

    cur.execute('DROP VIEW IF EXISTS PointsDepending')

    cur.execute(query_3)

    cur.execute('SELECT * FROM PointsDepending')
    driver_id = []
    points = []

    for row in cur:
        driver_id.append(row[0])
        points.append(row[1])

    graph_ax.plot(driver_id, points, marker='o')

    graph_ax.set_xlabel('Pilots')
    graph_ax.set_ylabel('Points')
    graph_ax.set_title('Pilot-dependent scores')

mng = plt.get_current_fig_manager()
mng.resize(1400, 600)

plt.show()