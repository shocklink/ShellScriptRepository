#!/bin/bash -x
# run script with $1 = vmlinux $2 = EBICS0.bin $3 = last_k.bin 
VMLINUX=`pwd`/$1
EBIDUMP=`pwd`/$2
ramdump-parse -v $VMLINUX -es $EBIDUMP -chip 8960 > parse.txt
ramconsole_to_lastk $3 > last_k.txt
pushd /home/gengyou/new_parser
python ramparse.py --ram-file $EBIDUMP 80000000 BFFFFFFF --vmlinux $VMLINUX --gdb-path ./arm-eabi-gdb --nm-path ./arm-eabi-nm -f parse2.txt --everything
popd
mv /home/gengyou/new_parser/parse2.txt .
