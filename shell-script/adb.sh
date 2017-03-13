#!/bin/sh -x

if [ "`adb devices|wc -l`" = "3" -a "$NO" != "" ]; then
	adb $@
elif [ "$NO" != "" ];then
	adb -s $NO $@
else
    adb devices | awk 'NR>=2{print NR-1,$1}'
    echo "which device ?"
    read device
    SERIAL_NUM=`adb devices | eval awk \'NR-1==$device{print \\$1}\' |awk '{print $1}'`

	adb -s $SERIAL_NUM $@
fi
