#!/bin/bash -x
# run script with $1 = vmlinux $2 = EBICS0.bin $3 = last_k.bin 
VMLINUX=`pwd`/$1
EBIDUMP=`pwd`/$2
CURRENT_PATH=`pwd`
ramdump-parse -v $VMLINUX -es $EBIDUMP -chip 8064 > parse.txt
ramconsole_to_lastk $3 > last_k.txt
pushd /home/gengyou/new_parser_8064/
python ramparse.py --ram-file $EBIDUMP 80000000 BFFFFFFF --vmlinux $VMLINUX --phys-offset 0x80600000 --gdb-path ./arm-eabi-gdb --nm-path ./arm-eabi-nm -f parse2.txt --everything --phys-offset 0x80600000 -e ${CURRENT_PATH}/SYSIME.RAM 0x2a000000 0x42000000
popd
mv /home/gengyou/new_parser_8064/parse2.txt .
