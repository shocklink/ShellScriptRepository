#!/bin/bash

if [ -z $1 ];then
	echo "no input file"
	exit
fi
./parse_dmesg.sh $1
echo "please assign array last row, and press any key to continue"
read x
vim $1.free
vim $1.cache

python binary_plus_space.py $1.free > $1.free.bin
python binary_plus_space.py $1.cache > $1.cache.bin
python plot2.py $1.free.bin $1.cache.bin
