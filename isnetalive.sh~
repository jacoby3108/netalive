#!/bin/bash -x  


# !/bin/bash followed by -x is for bash debug i.e.:    #!/bin/bash -x

# We will ping to an Universal always avaiable IP 8.8.8.8 (The Google Public DNS IP addresses (IPv4))
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


ping -w 2 $ADDRESS > /dev/null 2>&1  
RESULT=$?

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





