import csv
import os
from datetime import date

USER = os.environ['USER']
HOME = f'/home/{USER}/'
FILEPATH = f'{HOME}/battery.csv'
FIELDNAMES = ['date', 'capacity']


def measure():
    with open('/sys/class/power_supply/BAT0/charge_full', 'r') as file:
        full = float(file.readline())

    with open('/sys/class/power_supply/BAT0/charge_full_design', 'r') as file:
        design = float(file.readline())

    return {
        'date': date.today(),
        'capacity': 100 * full / design,
    }


def load():
    try:
        with open(FILEPATH, 'r+') as csvfile:
            csv_reader = csv.DictReader(csvfile)
            rows = [
                {
                    'date': date.fromisoformat(row['date']),
                    'capacity': float(row['capacity']),
                }
                for row in csv_reader
            ]
    except FileNotFoundError:
        rows = list()

    return rows


def save(rows):
    with open(FILEPATH, 'w+') as csvfile:
        csv_writer = csv.DictWriter(csvfile, fieldnames=FIELDNAMES)
        csv_writer.writeheader()
        csv_writer.writerows(rows)


def main():
    capacity = measure()
    print('Capacity: {:.3f}%'.format(capacity['capacity']))

    rows = load()
    if date.today() in [row['date'] for row in rows]:
        return

    rows.append(capacity)
    save(rows)


if __name__ == '__main__':
    main()
