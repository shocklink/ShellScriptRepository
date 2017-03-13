#!/bin/bash

adb wait-for-devices
echo -n "A53_CPU0_PATH " ; adb shell cat /sys/class/thermal/thermal_zone8/temp
echo -n "A53_CPU1_PATH " ; adb shell cat /sys/class/thermal/thermal_zone9/temp
echo -n "A53_CPU2_PATH " ; adb shell cat /sys/class/thermal/thermal_zone10/temp
echo -n "A53_CPU3_PATH " ; adb shell cat /sys/class/thermal/thermal_zone11/temp
echo -n "A57_CPU0_PATH " ; adb shell cat /sys/class/thermal/thermal_zone14/temp
echo -n "A57_CPU1_PATH " ; adb shell cat /sys/class/thermal/thermal_zone15/temp
echo -n "A57_CPU2_PATH " ; adb shell cat /sys/class/thermal/thermal_zone16/temp
echo -n "A57_CPU3_PATH " ; adb shell cat /sys/class/thermal/thermal_zone7/temp
