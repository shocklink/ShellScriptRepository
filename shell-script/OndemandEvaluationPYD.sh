#!/bin/sh

chmod 777 /data/cputest
sleep 15
rm -r /data/ondemand
mkdir /data/ondemand

echo "=========Before=========" >> /data/ondemand/ondemand_before.txt
cat /sys/devices/system/cpu/cpu0/cpufreq/stats/* >> /data/ondemand/ondemand_before.txt
/data/cputest d 1 10000000
echo "=========After=========" >> /data/ondemand/ondemand_after.txt
cat /sys/devices/system/cpu/cpu0/cpufreq/stats/* >> /data/ondemand/ondemand_after.txt

