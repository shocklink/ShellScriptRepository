#!/bin/sh

while :
do
	echo "**************"
	date 
	perf_pid=$(busybox pidof perfd)
	perfd_count=$(ps -t $perf_pid | busybox wc -l)
	echo "=============="
	echo perfd_count = $perfd_count
	echo "=============="
	cat /proc/buddyinfo
	echo "=============="
	cat /proc/pagetypeinfo
	echo "=============="
	cat /proc/meminfo
	echo ""
	sleep 900
done
