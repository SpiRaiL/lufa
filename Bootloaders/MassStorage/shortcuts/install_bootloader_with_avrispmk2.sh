#!/bin/sh
#avrdude -cavrisp2 -Pusb -b9600 -pm32u4 -e -U lfuse:w:0xde:m
#avrdude -cavrisp2 -Pusb -b9600 -pm32u4 -e -U hfuse:w:0xd8:m
avrdude -cavrisp2 -Pusb -b115200 -pm32u4 -e -v -Uflash:w:BootloaderMassStorage.hex

