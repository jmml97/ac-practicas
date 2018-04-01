#!/bin/bash

i=16384
MAX=67108864

for archivo in $(find ./binej10 -type f -follow -print);
do
    filename=$(basename "$archivo")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo $filename ------------
    while [ $i -le $MAX ]
    do
        ./$archivo $i >> $filename.dat
        echo $i
        i=$[$i*2]
    done
    i=16384
    echo " "
done
