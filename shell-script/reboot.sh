#!/system/bin/sh

while :
do
	echo "Wait 55sec to reboot" > /dev/kmsg
	#sleep 55
	sleep 55 
	reboot reboot
done
