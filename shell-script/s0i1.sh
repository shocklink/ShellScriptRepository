#!/bin/sh
echo 1 > /sys/devices/system/cpu/cpu0/cpuidle/state4/disable
echo 1 > /sys/devices/system/cpu/cpu1/cpuidle/state4/disable
echo 1 > /sys/devices/system/cpu/cpu2/cpuidle/state4/disable
echo 1 > /sys/devices/system/cpu/cpu3/cpuidle/state4/disable
echo 999 > /sys/power/wake_lock
