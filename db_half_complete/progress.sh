#!/bin/bash 
# your real command hsleep 7 & PID=$! i=1 sp="/-\|" echo -n ' ' while [ -d /proc/$PID 
] do printf "\b${sp:i++%${#sp}:1}" sleep .1 done ere, instead of sleep 
sleep 7 & 
PID=$! 
i=1 
sp="/-\|" 
echo -n ' ' 
while [ -d /proc/$PID ] 
do   
printf "\b${sp:i++%${#sp}:1}" 
sleep .1
done
