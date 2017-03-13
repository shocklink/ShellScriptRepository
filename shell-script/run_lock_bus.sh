#!/bin/sh -x

#adb shell stop
#adb shell setprop dalvik.vm.checkjni false 
#adb shell start
#adb shell "echo 0 > /sys/module/subsystem_restart/parameters/restart_level"
#adb shell ps|grep linpack|awk '{print $2}'|xargs -i adb shell kill -9 {}

#sleep 10

#adb shell setprop ctl.stop mpdecision
#adb shell "echo 1 > /sys/devices/system/cpu/cpu1/online"
#adb shell "cat /sys/devices/system/cpu/cpu1/online"
##adb shell "echo 1 > /sys/power/perflock"
##adb shell "cat /sys/power/perflock"
#adb shell "echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor"
#adb shell "echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor"

### sfab (164Mhz)
#adb shell "echo 38 > /sys/kernel/debug/msm-bus-dbg/shell-client/mas"
#adb shell "echo 512 > /sys/kernel/debug/msm-bus-dbg/shell-client/slv"
#adb shell "echo 1312000000 > /sys/kernel/debug/msm-bus-dbg/shell-client/ib"
#adb shell "echo 1 > /sys/kernel/debug/msm-bus-dbg/shell-client/update_request"

#### EBI clock (492Mhz)
#adb shell "echo 1 > /sys/kernel/debug/msm-bus-dbg/shell-client/mas"
#adb shell "echo 512 > /sys/kernel/debug/msm-bus-dbg/shell-client/slv"
#adb shell "echo 3936000000  > /sys/kernel/debug/msm-bus-dbg/shell-client/ib"
#adb shell "echo 1 > /sys/kernel/debug/msm-bus-dbg/shell-client/update_request"

# mmfab (222Mhz) + ebi + appfab
adb shell "echo 22 > /sys/kernel/debug/msm-bus-dbg/shell-client/mas"
adb shell "echo 512 > /sys/kernel/debug/msm-bus-dbg/shell-client/slv"
adb shell "echo 3080000000 > /sys/kernel/debug/msm-bus-dbg/shell-client/ib"
# adb shell "echo 2048000000 > /sys/kernel/debug/msm-bus-dbg/shell-client/ib"
adb shell "echo 1 > /sys/kernel/debug/msm-bus-dbg/shell-client/update_request"

### D-fab SPS fab (64Mhz) 
#adb shell "echo 6 > /sys/kernel/debug/msm-bus-dbg/shell-client/mas"
#adb shell "echo 512 > /sys/kernel/debug/msm-bus-dbg/shell-client/slv"
#adb shell "echo 5120000000 > /sys/kernel/debug/msm-bus-dbg/shell-client/ib"
## adb shell "echo 2048000000 > /sys/kernel/debug/msm-bus-dbg/shell-client/ib"
#adb shell "echo 1 > /sys/kernel/debug/msm-bus-dbg/shell-client/update_request"
