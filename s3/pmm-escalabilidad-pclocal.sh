#!/bin/bash

echo -e "100\n300\n500\n700\n900\n1100\n1300\n1500" > ./dat/tmp0.dat

./bin/pmm-secuencial 100 > ./dat/tmp1.dat
./bin/pmm-secuencial 300 >> ./dat/tmp1.dat
./bin/pmm-secuencial 500 >> ./dat/tmp1.dat
./bin/pmm-secuencial 700 >> ./dat/tmp1.dat
./bin/pmm-secuencial 900 >> ./dat/tmp1.dat
./bin/pmm-secuencial 1100 >> ./dat/tmp1.dat
./bin/pmm-secuencial 1300 >> ./dat/tmp1.dat
./bin/pmm-secuencial 1500 >> ./dat/tmp1.dat

export OMP_NUM_THREADS="2"
echo "num_threads=2"
./bin/pmm-OpenMP 100 > ./dat/tmp2.dat
./bin/pmm-OpenMP 300 >> ./dat/tmp2.dat
./bin/pmm-OpenMP 500 >> ./dat/tmp2.dat
./bin/pmm-OpenMP 700 >> ./dat/tmp2.dat
./bin/pmm-OpenMP 900 >> ./dat/tmp2.dat
./bin/pmm-OpenMP 1100 >> ./dat/tmp2.dat
./bin/pmm-OpenMP 1300 >> ./dat/tmp2.dat
./bin/pmm-OpenMP 1500 >> ./dat/tmp2.dat

export OMP_NUM_THREADS="4"
echo "num_threads=4"
./bin/pmm-OpenMP 100 > ./dat/tmp3.dat
./bin/pmm-OpenMP 300 >> ./dat/tmp3.dat
./bin/pmm-OpenMP 500 >> ./dat/tmp3.dat
./bin/pmm-OpenMP 700 >> ./dat/tmp3.dat
./bin/pmm-OpenMP 900 >> ./dat/tmp3.dat
./bin/pmm-OpenMP 1100 >> ./dat/tmp3.dat
./bin/pmm-OpenMP 1300 >> ./dat/tmp3.dat
./bin/pmm-OpenMP 1500 >> ./dat/tmp3.dat


paste ./dat/tmp0.dat ./dat/tmp1.dat ./dat/tmp2.dat ./dat/tmp3.dat > ./dat/pmm-escalabilidad-pclocal.dat

echo -e "Elementos\tSecuencial\t2 threads\t4 threads\n$(cat ./dat/pmm-escalabilidad-pclocal.dat)" > ./dat/pmm-escalabilidad-pclocal.dat

rm ./dat/tmp0.dat ./dat/tmp1.dat ./dat/tmp2.dat ./dat/tmp3.dat

