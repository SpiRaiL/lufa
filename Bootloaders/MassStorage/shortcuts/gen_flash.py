#!/bin/python

import datetime
time = datetime.datetime.now().strftime("%H:%M:%S")

f = open('CLOCK.APP', 'w')
#should be 1664?

#write header
f.write("CLOCK   APP\n")
for i in range(0,(512-13)):
    f.write(".")
f.write("\n")

for i in range(0,1664):
    f.write("F %s %04d\n" % (time, i))

# should be 64
f = open('CONFIG.TXT', 'w')

#write header
f.write("CONFIG  TXT\n")
for i  in range(0,(512-13)):
    f.write(".")

f.write("\n")
for i in range(0,64):
    f.write("E %s %04d\n" % (time, i))
