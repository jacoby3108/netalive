#!/bin/bash -x  


# !/bin/bash followed by -x is for bash debug i.e.:    #!/bin/bash -x

# We will ping to an Universal always avaiable IP 8.8.8.8 (The Google Public DNS IP addresses (IPv4))


NORMAL_POOL_TIME=2
LONG_POOL_TIME=6 

POOL_TIME=$((LONG_POOL_TIME/2))
#ADDRESS="8.8.8.8" 
ADDRESS="google.com" 


NO_NET="1"


for (( i=1,RESULT=$NO_NET; "$i" <= "4"  &&  $RESULT == $NO_NET ; i++ ))
do

  ping -w 2 $ADDRESS > /dev/null 2>&1  
RESULT=$?


   echo $i
done

echo $RESULT

