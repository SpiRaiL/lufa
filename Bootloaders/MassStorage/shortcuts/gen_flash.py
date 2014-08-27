#!/bin/python

#should be 1664?
f = open('flash.bin', 'w')
#should be 1664?
for i in range(0,1664):
    f.write("F%014.0f\n" % (i))

# should be 64
f = open('eeprom.bin', 'w')
for i in range(0,56):
    f.write("E%014.0f\n" % (i))
