#!/bin/sh -x
#for i in `seq $1`
for i in `seq 21 1 34`
do
./prebuilt/linux-x86/oprofile/bin/opreport --session-dir=/home/shocklink/FriendStreamProfile/script/$i -p `pwd`/out/target/product/shooteru/symbols -l > ~/FriendStreamProfile/script/$i.vmlinux.l
done
