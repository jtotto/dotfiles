from datetime import datetime, timedelta

now = datetime.now()
now += timedelta(9)
bow = now - timedelta(now.weekday())
eow = datetime(bow.year, bow.month, bow.day) + timedelta(6, 86399)
print eow.strftime('%Y-%m-%dT%H:%M:%S')
