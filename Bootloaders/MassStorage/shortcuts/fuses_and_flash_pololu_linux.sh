#!/bin/sh
avrdude -cavrisp2 -b9600 -pm32u4 -P/dev/ttyACM0 -e -v -U lfuse:w:0xde:m -U hfuse:w:0xd8:m -Uflash:w:BootloaderMassStorage.hex 
