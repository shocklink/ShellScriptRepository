#!/bin/sh
adb shell sync
adb shell echo 3 \> /proc/sys/vm/drop_caches
adb shell dd if=/data/1.zip of=/dev/null &
adb shell echo $! \> /data/cgroup/test1/tasks
adb shell cat /data/cgroup/test1/tasks

adb shell dd if=/data/2.zip of=/dev/null &
adb shell echo $! \> /data/cgroup/test2/tasks
adb shell cat /data/cgroup/test2/tasks
