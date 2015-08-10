#!/bin/sh
avrdude  -catmelice_isp -b9600 -pm32u4 -Pusb -v -Ueeprom:r:shortcuts/eeprom_out.bin:r -Uflash:r:shortcuts/flash_out.bin:r
