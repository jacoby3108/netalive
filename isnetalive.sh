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
   fi
   
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

}


echo $ON > $MODEM  # turn off cable modem 
echo $ON > $ROUTER # turn off router 

while true
do


ping -w 1 $ADDRESS > /dev/null 2>&1  
RESULT=$?

echo $RESULT

if [ "$RESULT" == $NO_NET ]; then
        network_nok
else
        network_ok
fi


for i in {1..5}
do

   blink_led
   echo "mail" $SEND_A_MAIL
done

sleep 3

done


# http://stackoverflow.com/questions/2341023/what-does-the-ampersand-indicate-in-this-bash-command-12
# http://stackoverflow.com/questions/1727907/how-to-use-ping-in-a-script
# http://stackoverflow.com/questions/2237080/how-can-i-compare-strings-in-bash-script





