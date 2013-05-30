dmesg | grep ttyACM | sed -r 's/.*(ttyACM.).*/\1/' | tail -n1
