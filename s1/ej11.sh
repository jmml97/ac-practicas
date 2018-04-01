#!/bin/bash

i=16384
MAX=67108864

for archivo in $(find ./binej11 -type f -follow -print);
do
    filename=$(basename "$archivo")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo $filename ------------
    while [ $i -le $MAX ]
    do
        TIMEFORMAT='%R %U %S'
        (time ./$archivo $i > /dev/null) >> $filename.dat  2>&1
        echo $i
        i=$[$i*2]
    done
    i=16384
    echo " "
done
