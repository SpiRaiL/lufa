#!/bin/sh
avrdude -cavrisp2 -b9600 -pm32u4 -P/dev/tty.usbmodem00079721  -e -v -Uflash:w:BootloaderMassStorage.hex
