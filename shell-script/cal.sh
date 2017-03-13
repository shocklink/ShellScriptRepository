#!/bin/bash

#read line
#start_temp=$(cut -c1-8 <<< $line)
#end_num=$(cut -c10-17 <<< $line)
#start_temp_upper=$(echo $start_temp | tr '[:lower:]' '[:upper:]')
#end_num_upper=$(echo $end_num | tr '[:lower:]' '[:upper:]')
#start_temp_dec=$(echo "ibase=16;${start_temp_upper}" | bc)
#end_num_dec=$(echo "ibase=16;${end_upper}" | bc)

end_num_dec=0
while read line
do
    start_num=$(cut -c1-8 <<< $line)
    start_num_upper=$(echo $start_num | tr '[:lower:]' '[:upper:]')
    start_num_dec=$(echo "ibase=16;${start_num_upper}" | bc)
    space_upper=$(echo "obase=16;${start_num_dec}-${end_num_dec}" | bc)
    space=$(echo $space_upper | tr '[:upper:]' '[:lower:]')
    end_num=$(cut -c10-17 <<< $line)
    end_num_upper=$(echo $end_num | tr '[:lower:]' '[:upper:]')
    end_num_dec=$(echo "ibase=16;${end_num_upper}" | bc)
    mapsize=$(echo "obase=16;${end_num_dec}-${start_num_dec}" | bc)
#    if [ $space -gt $(echo "ibase=16;200000" | bc) ]
#    	echo $start_num,$end_num,$mapsize,$space,1
#    then
#    	echo $start_num,$end_num,$mapsize,$space,0
#    fi
    echo $start_num,$end_num,$mapsize,$space
done
