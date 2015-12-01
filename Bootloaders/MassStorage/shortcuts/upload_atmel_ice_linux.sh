#!/bin/sh

#unlocked system allows reading for debugging
#sudo avrdude -catmelice_isp -b9600 -pm32u4 -Pusb -v -e -U lfuse:w:0xde:m -U hfuse:w:0xd8:m -Ulock:w:0xFF:m -Uflash:w:BootloaderMassStorage.hex

#locked system, disallows all reading
#sudo avrdude -catmelice_isp -b9600 -pm32u4 -Pusb -v -e -U lfuse:w:0xde:m -U hfuse:w:0xd8:m -Ulock:w:0xFF:m -Uflash:w:BootloaderMassStorage.hex -Ulock:w:0xc4:m 


sudo avrdude -catmelice_isp -b300 -B128 -pm32u4 -Pusb -v -e -U hfuse:w:0xd8:m -U lfuse:w:0xde:m -Ulock:w:0xFF:m 
#sudo avrdude -catmelice_isp -b300 -B10 -pm32u4 -Pusb -v -e -Ulock:w:0xFF:m -U hfuse:w:0xd8:m -U lfuse:w:0xde:m -U efuse:w:0xC3:m

sudo avrdude -catmelice_isp -b9600 -B10 -pm32u4 -Pusb -v -Uflash:w:BootloaderMassStorage.hex -Ulock:w:0xc4:m 

