#!/bin/bash -x
DEVA=BaytrailT29a9050347
DEVB=BaytrailTb8d2080404
while :
do
	adb -s $DEVA wait-for-devices 
	adb wait-for-devices shell logcat -b events -d |grep boot_progress_enable_screen

	if [ $? == 0 ]; then
		adb shell am start -n com.android.settings/.Settings 
	fi
	adb wait-for-devices shell logcat -d |grep "cmp=com.android.settings/.Settings"
	
	if [ $? == 0 ]; then
		TMP=$DEVA
		DEVA=$DEVB
		DEVB=$TMP
	fi
	sleep 1
done
