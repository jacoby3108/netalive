#!/bin/bash -x  


# !/bin/bash followed by -x is for bash debug i.e.:    #!/bin/bash -x

# We will ping to an Universal always avaiable IP 8.8.8.8 (The Google Public DNS IP addresses (IPv4))


NORMAL_POOL_TIME=2
LONG_POOL_TIME=6 

POOL_TIME=$((LONG_POOL_TIME/2))


for (( i=1; i<=$POOL_TIME; i++ ))
do

  
   echo $i
done
