#!/bin/bash
echo "Copy flash"
cp flash.bin /Volumes/CLOCKCLOCK/CLOCK_82.BIN 
echo "Copy eeprom"
cp eeprom.bin /Volumes/CLOCKCLOCK/SETTINGS.CON 
echo "dismount"
diskutil unmount /dev/disk1
sleep 2
echo "dd"
sudo dd if=/dev/disk1 of=/tmp/dd.out 
echo "pull"
./pull_flash.command 
