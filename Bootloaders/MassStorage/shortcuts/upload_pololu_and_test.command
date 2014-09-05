#!/bin/sh
avrdude -cavrisp2 -b9600 -pm32u4 -P/dev/tty.usbmodem00079721  -e -v -Uflash:w:BootloaderMassStorage.hex
sleep 5
echo "Copy flash"
cp shortcuts/CLOCK.APP /Volumes/CLOCKCLOCK/CLOCK.APP
echo "Copy eeprom"
cp shortcuts/CONFIG.TXT /Volumes/CLOCKCLOCK/CONFIG.TXT
echo "dismount"
diskutil unmount /dev/disk1
diskutil eject /dev/disk1
echo "Done! green light should come on. "
echo "press up-arrow and enter to program the next one!"
