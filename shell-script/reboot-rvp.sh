#!/system/bin/sh

while :
do
	echo 10 > /proc/sys/kernel/printk
	echo 5 > /sys/module/earlysuspend/parameters/debug_mask
	echo "Wait to reboot" > /dev/kmsg
	sleep 55
	reboot reboot
done
