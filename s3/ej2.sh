#!/usr/bin/env bash

export OMP_NUM_THREADS=2
seq 1 1 16 >> ./dat/tmp0.dat
./bin/schedule-clause 1 1 >> ./dat/tmp1.dat
./bin/schedule-clause 4 1 >> ./dat/tmp2.dat
./bin/schedule-clause 2 1 >> ./dat/tmp3.dat
paste ./dat/tmp0.dat ./dat/tmp1.dat ./dat/tmp2.dat ./dat/tmp3.dat > ./dat/schedule-clause1.dat
echo -e "Iteración\t1\t2\t4\n$(cat ./dat/schedule-clause1.dat)" > ./dat/schedule-clause1.dat
rm ./dat/tmp0.dat ./dat/tmp1.dat ./dat/tmp2.dat ./dat/tmp3.dat

seq 1 1 16 >> ./dat/tmp0.dat
./bin/scheduled-clause 16 1 1 >> ./dat/tmp1.dat
./bin/scheduled-clause 16 4 1 >> ./dat/tmp2.dat
./bin/scheduled-clause 16 2 1 >> ./dat/tmp3.dat
paste ./dat/tmp0.dat ./dat/tmp1.dat ./dat/tmp2.dat ./dat/tmp3.dat > ./dat/scheduled-clause1.dat
echo -e "Iteración\t1\t2\t4\n$(cat ./dat/scheduled-clause1.dat)" > ./dat/scheduled-clause1.dat
rm ./dat/tmp0.dat ./dat/tmp1.dat ./dat/tmp2.dat ./dat/tmp3.dat

seq 1 1 16 >> ./dat/tmp0.dat
./bin/scheduleg-clause 16 1 1 >> ./dat/tmp1.dat
./bin/scheduleg-clause 16 4 1 >> ./dat/tmp2.dat
./bin/scheduleg-clause 16 2 1 >> ./dat/tmp3.dat
paste ./dat/tmp0.dat ./dat/tmp1.dat ./dat/tmp2.dat ./dat/tmp3.dat > ./dat/scheduleg-clause1.dat
echo -e "Iteración\t1\t2\t4\n$(cat ./dat/scheduleg-clause1.dat)" > ./dat/scheduleg-clause1.dat
rm ./dat/tmp0.dat ./dat/tmp1.dat ./dat/tmp2.dat ./dat/tmp3.dat


export OMP_NUM_THREADS=4
seq 1 1 16 >> ./dat/tmp0.dat
./bin/schedule-clause 1 1 >> ./dat/tmp1.dat
./bin/schedule-clause 4 1 >> ./dat/tmp2.dat
./bin/schedule-clause 2 1 >> ./dat/tmp3.dat
paste ./dat/tmp0.dat ./dat/tmp1.dat ./dat/tmp2.dat ./dat/tmp3.dat > ./dat/schedule-clause2.dat
echo -e "Iteración\t1\t2\t4\n$(cat ./dat/schedule-clause2.dat)" > ./dat/schedule-clause2.dat
rm ./dat/tmp0.dat ./dat/tmp1.dat ./dat/tmp2.dat ./dat/tmp3.dat

seq 1 1 16 >> ./dat/tmp0.dat
./bin/scheduled-clause 16 1 1 >> ./dat/tmp1.dat
./bin/scheduled-clause 16 4 1 >> ./dat/tmp2.dat
./bin/scheduled-clause 16 2 1 >> ./dat/tmp3.dat
paste ./dat/tmp0.dat ./dat/tmp1.dat ./dat/tmp2.dat ./dat/tmp3.dat > ./dat/scheduled-clause2.dat
echo -e "Iteración\t1\t2\t4\n$(cat ./dat/scheduled-clause2.dat)" > ./dat/scheduled-clause2.dat
rm ./dat/tmp0.dat ./dat/tmp1.dat ./dat/tmp2.dat ./dat/tmp3.dat

seq 1 1 16 >> ./dat/tmp0.dat
./bin/scheduleg-clause 16 1 1 >> ./dat/tmp1.dat
./bin/scheduleg-clause 16 4 1 >> ./dat/tmp2.dat
./bin/scheduleg-clause 16 2 1 >> ./dat/tmp3.dat
paste ./dat/tmp0.dat ./dat/tmp1.dat ./dat/tmp2.dat ./dat/tmp3.dat > ./dat/scheduleg-clause2.dat
echo -e "Iteración\t1\t2\t4\n$(cat ./dat/scheduleg-clause2.dat)" > ./dat/scheduleg-clause2.dat
rm ./dat/tmp0.dat ./dat/tmp1.dat ./dat/tmp2.dat ./dat/tmp3.dat

unset OMP_NUM_THREADS
