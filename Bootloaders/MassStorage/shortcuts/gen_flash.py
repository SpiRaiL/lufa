#!/bin/python

#should be 1664?
f = open('flash.bin', 'w')
#should be 1664?

#write header
f.write("CLOCK_82BIN\n")
for i in range(0,(512-13)):
    f.write(".")
f.write("\n")

for i in range(0,1664):
    f.write("F%014.0f\n" % (i))

# should be 64
f = open('eeprom.bin', 'w')

#write header
f.write("SETTINGSCON\n")
for i  in range(0,(512-13)):
    f.write(".")

f.write("\n")
for i in range(0,64):
    f.write("E%014.0f\n" % (i))
