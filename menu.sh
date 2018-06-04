#!/bin/bash
clear
awk -F"\";\"" 'NR==1, NR==10{ printf "%20s| %20s|\n", $2, $3 }' 2015_2.csv
# echo foooobazbarrrrr | gawk '{ if (match($0, /(fo+).+(bar*)/, arr))  print arr[1], arr[2] }'

echo 0x11 | gawk '{ printf "%.2f\n", strtonum($1) }'
awk 'BEGIN {print "Number of seconds since the Epoch = " systime()}'
awk -v name=Jerry 'BEGIN{printf "Name = %s\n", name}'
awk 'BEGIN {print "OFMT = " OFMT}'
awk 'BEGIN { str1 = "Hello, "; str2 = "World~"; str3 = str1 str2; print str3 }'
awk 'BEGIN {str="daabaaaL";gsub(/a+/, "<&>", str);print str}'

 ############################################################
 ##   echo -e "cat\nbat\nfun\nfin\nfan" | awk '/f.n/'      ##
 ##   echo -e "111\n22\n123\n234\n456\n222"  | awk '/2+/'  ##
 ##   echo -e "Apple Juice\nApple                          ##
 ############################################################
