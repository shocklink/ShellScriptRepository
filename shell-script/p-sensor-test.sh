#!/bin/sh
while :
do
adb shell sendevent /dev/input/event5 3 25 0
adb shell sendevent /dev/input/event5 0 0 0
sleep 1
adb shell sendevent /dev/input/event5 3 25 1
adb shell sendevent /dev/input/event5 0 0 0
sleep 1
done
