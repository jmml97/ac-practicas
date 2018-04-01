#!/bin/bash

TIMEFORMAT='%R'
i=1

echo "pmv-OpenMP-reduction 10000"
while [ $i -le 4 ]
do
    
    echo "Num threads $i"
    export OMP_NUM_THREADS=$i
    echo -n "$i " >> pmv-OpenMP-reduction.dat
    (time ./pmv-OpenMP-reduction 10000 > /dev/null) >> pmv-OpenMP-reduction.dat  2>&1
    i=$[$i+1]
done

i=1
echo "pmv-OpenMP-reduction 30000"
while [ $i -le 4 ]
do
    
    echo "Num threads $i"
    export OMP_NUM_THREADS=$i
    echo -n "$i " >> pmv-OpenMP-reduction.dat
    (time ./pmv-OpenMP-reduction 30000 > /dev/null) >> pmv-OpenMP-reduction.dat  2>&1
    i=$[$i+1]
done
