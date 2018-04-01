#!/bin/bash

TIMEFORMAT='%R'
i=1

echo "pmv-OpenMP-b 10000"
while [ $i -le 4 ]
do
    
    echo "Num threads $i"
    export OMP_NUM_THREADS=$i
    echo -n "$i " >> pmv-OpenMP-b.dat
    (time ./pmv-OpenMP-b 10000 > /dev/null) >> pmv-OpenMP-b.dat  2>&1
    i=$[$i+1]
done

i=1
echo "pmv-OpenMP-b 30000"
while [ $i -le 4 ]
do
    
    echo "Num threads $i"
    export OMP_NUM_THREADS=$i
    echo -n "$i " >> pmv-OpenMP-b.dat
    (time ./pmv-OpenMP-b 30000 > /dev/null) >> pmv-OpenMP-b.dat  2>&1
    i=$[$i+1]
done
