#!/bin/bash

TIMEFORMAT='%R'
i=1

echo "pmv-OpenMP-a 10000"
while [ $i -le 4 ]
do
    
    echo "Num threads $i"
    export OMP_NUM_THREADS=$i
    echo -n "$i " >> pmv-OpenMP-a.dat
    (time ./pmv-OpenMP-a 10000 > /dev/null) >> pmv-OpenMP-a.dat  2>&1
    i=$[$i+1]
done

i=1
echo "pmv-OpenMP-a 30000"
while [ $i -le 4 ]
do
    
    echo "Num threads $i"
    export OMP_NUM_THREADS=$i
    echo -n "$i " >> pmv-OpenMP-a.dat
    (time ./pmv-OpenMP-a 30000 > /dev/null) >> pmv-OpenMP-a.dat  2>&1
    i=$[$i+1]
done
