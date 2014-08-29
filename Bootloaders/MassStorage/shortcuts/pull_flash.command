#!/bin/sh
avrdude -cavrisp2 -b9600 -pm32u4 -P/dev/tty.usbmodem00079721 -v -Ueeprom:r:eeprom_out.bin:r -Uflash:r:flash_out.bin:r

