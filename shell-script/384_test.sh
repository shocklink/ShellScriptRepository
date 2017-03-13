#!/bin/bash
### Author: Roy Chen ###
### Usage: dump dump
### $1 is core number
### $2 is freq
echo "parameter string is" $1 $2 $3 $4 $5
sleep 2

if [ "$1" = "1" ]; then
echo "Recording Core0 ""$2" >> /data/thermal.txt
echo "$2" >/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo "$2" >/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
elif ["$1" = "2"]; then
echo "Recording Core0 ""$2 ""Core1 ""$3" >> /data/thermal.txt
echo 1 > /sys/devices/system/cpu/cpu1/online
sleep 1
echo "$2" >/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo "$2" >/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "$3" >/sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo "$3" >/sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
elif ["$1" = "3"]; then
echo "Recording Core0 ""$2 ""Core1 ""$3 ""Core2 ""$4" >> /data/thermal.txt
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
sleep 1
echo "$2" >/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo "$2" >/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "$3" >/sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo "$3" >/sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo "$4" >/sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
echo "$4" >/sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
else
echo "Recording Core0 ""$2 ""Core1 ""$3 ""Core2 ""$4 ""Core3 ""$5" >> /data/thermal.txt
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online
sleep 1
echo "$2" >/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo "$2" >/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "$3" >/sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo "$3" >/sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo "$4" >/sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
echo "$4" >/sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo "$5" >/sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo "$5" >/sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
fi

echo 1 > /d/nohlt
./data/cputest -d -c 1000000000000 &
./data/cputest -d -c 1000000000000 &
./data/cputest -d -c 1000000000000 &
./data/cputest -d -c 1000000000000 &
./data/cputest -d -c 1000000000000 &
./data/cputest -d -c 1000000000000 &
./data/cputest -d -c 1000000000000 &
./data/cputest -d -c 1000000000000 &
sleep 1
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq
cat /sys/devices/system/cpu/cpu2/cpufreq/scaling_cur_freq
cat /sys/devices/system/cpu/cpu3/cpufreq/scaling_cur_freq
sleep 1

echo "Recording start"
while
do
echo `date;cat /sys/devices/virtual/thermal/thermal_zone7/temp;cat /sys/devices/virtual/thermal/thermal_zone8/temp;cat /sys/devices/virtual/thermal/thermal_zone9/temp;cat /sys/devices/virtual/thermal/thermal_zone10/temp;cat /sys/devices/virtual/thermal/thermal_zone0/temp;cat /sys/devices/virtual/thermal/thermal_zone1/temp;cat /sys/devices/virtual/thermal/thermal_zone2/temp` >> /data/thermal.txt;
sleep 1
done
exit 0
