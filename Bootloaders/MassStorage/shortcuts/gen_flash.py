#!/bin/python

f = open('flash.bin', 'w')
for i in range(0,1000):
    f.write("%015.0f\n" % (i))

f = open('eeprom.bin', 'w')
for i in range(0,64):
    f.write("%015.0f\n" % (i))
