#!/bin/sh

#unlocked system allows reading for debugging
#sudo avrdude -catmelice_isp -b9600 -pm32u4 -Pusb -v -e -U lfuse:w:0xde:m -U hfuse:w:0xd8:m -Ulock:w:0xFF:m -Uflash:w:BootloaderMassStorage.hex

#locked system, disallows all reading
sudo avrdude -catmelice_isp -b9600 -pm32u4 -Pusb -v -e -U lfuse:w:0xde:m -U hfuse:w:0xd8:m -Ulock:w:0xFF:m -Uflash:w:BootloaderMassStorage.hex -Ulock:w:0xc4:m 

