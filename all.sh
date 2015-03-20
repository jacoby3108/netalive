#!/bin/bash


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


#-----------------------------
OFF="1"
ON="0"

LEDON="1"
LEDOFF="0"

SEND_A_MAIL="0"

ADDRESS="8.8.8.8" 
NO_NET="1"

NORMAL_POOL_TIME=8 
LONG_POOL_TIME=60 
POOL_TIME=$((NORMAL_POOL_TIME/2))

function blink_led
{
	echo $LEDON > $LED
	sleep 1
	echo $LEDOFF > $LED
	sleep 1

}

function network_ok
{
   echo "Hay red"
   if [ "$SEND_A_MAIL" == "1" ]; then
   SEND_A_MAIL="0"
#sendmail here  


echo "Newwork has been restored" | mail -s "RPI Watchddog" itba.jacoby@gmail.com

echo "Newwork has been restored" > temp.txt
echo "Internal IP address: " >> temp.txt
ifconfig | grep "inet"  >> temp.txt
echo "External IP address: " >> temp.txt

wget -qO- icanhazip.com >> temp.txt

cat temp.txt |  mail -s "RPI Watchddog" itba.jacoby@gmail.com




echo "mail" $SEND_A_MAIL
   fi
   
POOL_TIME=$((NORMAL_POOL_TIME/2))
}

function network_nok
{
   echo "No Hay red"

echo $OFF > $MODEM  # turn off cable modem 
echo $OFF > $ROUTER # turn off router 
sleep 3 # sleep 5

echo $ON > $MODEM   # turn on cable modem

sleep 2 # sleep 2m  (2 minutes) 

echo $ON > $ROUTER # turn on router

SEND_A_MAIL="1"  

POOL_TIME=$((LONG_POOL_TIME/2))



}


echo $ON > $MODEM  # turn off cable modem 
echo $ON > $ROUTER # turn off router 


while true
do


for (( i=1,RESULT=$NO_NET; "$i" <= "9"  &&  $RESULT == $NO_NET ; i++ ))
do

  ping -w 2 $ADDRESS > /dev/null 2>&1  
RESULT=$?

   echo $i
done

echo $RESULT

if [ "$RESULT" == $NO_NET ]; then
        network_nok
else
        network_ok
fi


for (( i=1; i<=$POOL_TIME; i++ ))
do

   blink_led
   echo $i
done

 

sleep 3

done


# http://stackoverflow.com/questions/2341023/what-does-the-ampersand-indicate-in-this-bash-command-12
# http://stackoverflow.com/questions/1727907/how-to-use-ping-in-a-script
# http://stackoverflow.com/questions/2237080/how-can-i-compare-strings-in-bash-script





