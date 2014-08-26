#!/bin/sh
avrdude -cavrisp2 -b9600 -pm32u4 -P/dev/ttyACM0 -v -Ueeprom:r:shortcuts/eeprom_out.bin:r -Uflash:r:shortcuts/flash_out.bin:r
