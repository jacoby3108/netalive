#!/bin/sh

################################################
# Pin 17 is used to  controlling the router
# Pin 22 is used for reading the modem
################################################

#Define pin 17 as output 

echo "17" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio17/direction

#Define  Pin  22 as output 

echo "22" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio22/direction


#Define  Pin  22 as output 

echo "23" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio23/direction

# Define useful aliases

export ROUTER="/sys/class/gpio/gpio17/value"
export MODEM="/sys/class/gpio/gpio22/value"
export LED="/sys/class/gpio/gpio23/value"
