#!/bin/sh
cp shortcuts/flash.bin /media/david/CLOCKCLOCK/CLOCK_82.BIN;
sleep 5
udisks --unmount /dev/sdd;
sleep 1
sudo dd if=/dev/sdd of=/tmp/dd1.out;
sleep 3
./shortcuts/pull_eeprom.sh
