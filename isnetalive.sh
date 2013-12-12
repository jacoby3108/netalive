#!/bin/bash -x  

# !/bin/bash followed by -x is for bash debug

# We will ping to an Universal always avaiable IP 8.8.8.8 (The Google Public DNS IP addresses (IPv4))

function network_ok
{
   echo "Hay red"
}

function network_nok
{
   echo "No Hay red"

# turn off cable modem 
# turn off router 
# sleep 5
# turn on cable modem

# sleep 2m  (2 minutes) 

# turn on router
  
}

ADDRESS="8.8.8.8" 
NO_NET="1"

ping -w 1 $ADDRESS > /dev/null 2>&1
RESULT=$?

echo $RESULT

if [ "$RESULT" == $NO_NET ]; then
        network_nok
else
        network_ok
fi


# http://stackoverflow.com/questions/2341023/what-does-the-ampersand-indicate-in-this-bash-command-12
# http://stackoverflow.com/questions/1727907/how-to-use-ping-in-a-script
# http://stackoverflow.com/questions/2237080/how-can-i-compare-strings-in-bash-script





