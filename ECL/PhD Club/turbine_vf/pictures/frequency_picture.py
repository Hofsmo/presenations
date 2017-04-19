"""Create frequency plot."""
import csv
import datetime as date
import numpy as np
from matplotlib import pyplot as plt
from matplotlib import dates

fname = '150916-Nea-T2-Normal.csv'

frequency = []
datestr = []

with open(fname, 'r') as csvfile:
    reader = csv.reader(csvfile)
    next(reader, None) # Skip the header
    for row in reader:
        frequency.append(float(row[1]))
        datestr.append(row[0])

time = [date.datetime.strptime(t, '%Y/%m/%d %H:%M:%S.%f') for t in datestr]
t_start = 40*60*50
t_end = t_start + 20*60*50
t_step = 50

base = np.ones(int((t_end-t_start)*0.02))*50

plt.plot(time[t_start:t_end:t_step],
         frequency[t_start:t_end:t_step],
        color='blue')
plt.plot(time[t_start:t_end:t_step],
         base,
        color='red')
hfmt = dates.DateFormatter('%H:%M')
ax = plt.gca() 
ax.xaxis.set_major_formatter(hfmt)
plt.title("Snapshot of frequency in Norway")
plt.xlabel("{0}-{1}-{2}".format(time[0].year, time[0].month, time[0].day))
plt.ylabel("Frequency[Hz]")
plt.xlim((time[t_start], time[t_end-1]))

ax.set_facecolor('black')


fig = plt.gcf()
fig.set_facecolor('grey')

plt.rc('grid', linestyle='dashed', color='grey')
plt.grid(True)

plt.savefig('frequency.pdf')

