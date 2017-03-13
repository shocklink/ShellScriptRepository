#!/bin/sh -x
DEVICE=$1
if [ "$DEVICE" = "" ];then
adb shell echo 2 \> /sys/module/msm_fb/parameters/msmfb_debug_mask
adb shell cat /proc/kmsg|grep fps
else
adb -s $DEVICE shell echo 2 \> /sys/module/msm_fb/parameters/msmfb_debug_mask
adb -s $DEVICE shell cat /proc/kmsg|grep fps
fi
