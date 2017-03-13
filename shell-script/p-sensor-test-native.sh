#!/bin/sh
while :
do
sendevent /dev/input/event5 3 25 0
sendevent /dev/input/event5 0 0 0
sleep 6
sendevent /dev/input/event5 3 25 1
sendevent /dev/input/event5 0 0 0
sleep 2
done
