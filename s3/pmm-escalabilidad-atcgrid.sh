#!/bin/bash

#Se asigna al trabajo el nombre
#PBS -N pmm-escalabilidad-atcgrid
#Se asigna al trabajo la cola ac
#PBS -q ac

#Se imprime información del trabajo usando variables de entorno de PBS
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:"
cat $PBS_NODEFILE
echo "Directorio de trabajo: $PBS_O_WORKDIR"

echo -e "100\n200\n300\n400\n500\n600\n700\n800" > $PBS_O_WORKDIR/dat/tmp0.dat

$PBS_O_WORKDIR/bin/pmm-secuencial 100 > $PBS_O_WORKDIR/dat/tmp1.dat
$PBS_O_WORKDIR/bin/pmm-secuencial 200 >> $PBS_O_WORKDIR/dat/tmp1.dat
$PBS_O_WORKDIR/bin/pmm-secuencial 300 >> $PBS_O_WORKDIR/dat/tmp1.dat
$PBS_O_WORKDIR/bin/pmm-secuencial 400 >> $PBS_O_WORKDIR/dat/tmp1.dat
$PBS_O_WORKDIR/bin/pmm-secuencial 500 >> $PBS_O_WORKDIR/dat/tmp1.dat
$PBS_O_WORKDIR/bin/pmm-secuencial 600 >> $PBS_O_WORKDIR/dat/tmp1.dat
$PBS_O_WORKDIR/bin/pmm-secuencial 700 >> $PBS_O_WORKDIR/dat/tmp1.dat
$PBS_O_WORKDIR/bin/pmm-secuencial 800 >> $PBS_O_WORKDIR/dat/tmp1.dat

export OMP_NUM_THREADS="2"
echo "num_threads=2"
$PBS_O_WORKDIR/bin/pmm-OpenMP 100 > $PBS_O_WORKDIR/dat/tmp2.dat
$PBS_O_WORKDIR/bin/pmm-OpenMP 200 >> $PBS_O_WORKDIR/dat/tmp2.dat
$PBS_O_WORKDIR/bin/pmm-OpenMP 300 >> $PBS_O_WORKDIR/dat/tmp2.dat
$PBS_O_WORKDIR/bin/pmm-OpenMP 400 >> $PBS_O_WORKDIR/dat/tmp2.dat
$PBS_O_WORKDIR/bin/pmm-OpenMP 500 >> $PBS_O_WORKDIR/dat/tmp2.dat
$PBS_O_WORKDIR/bin/pmm-OpenMP 600 >> $PBS_O_WORKDIR/dat/tmp2.dat
$PBS_O_WORKDIR/bin/pmm-OpenMP 700 >> $PBS_O_WORKDIR/dat/tmp2.dat
$PBS_O_WORKDIR/bin/pmm-OpenMP 800 >> $PBS_O_WORKDIR/dat/tmp2.dat

export OMP_NUM_THREADS="4"
echo "num_threads=4"
$PBS_O_WORKDIR/bin/pmm-OpenMP 100 > $PBS_O_WORKDIR/dat/tmp3.dat
$PBS_O_WORKDIR/bin/pmm-OpenMP 200 >> $PBS_O_WORKDIR/dat/tmp3.dat
$PBS_O_WORKDIR/bin/pmm-OpenMP 300 >> $PBS_O_WORKDIR/dat/tmp3.dat
$PBS_O_WORKDIR/bin/pmm-OpenMP 400 >> $PBS_O_WORKDIR/dat/tmp3.dat
$PBS_O_WORKDIR/bin/pmm-OpenMP 500 >> $PBS_O_WORKDIR/dat/tmp3.dat
$PBS_O_WORKDIR/bin/pmm-OpenMP 600 >> $PBS_O_WORKDIR/dat/tmp3.dat
$PBS_O_WORKDIR/bin/pmm-OpenMP 700 >> $PBS_O_WORKDIR/dat/tmp3.dat
$PBS_O_WORKDIR/bin/pmm-OpenMP 800 >> $PBS_O_WORKDIR/dat/tmp3.dat


paste $PBS_O_WORKDIR/dat/tmp0.dat $PBS_O_WORKDIR/dat/tmp1.dat $PBS_O_WORKDIR/dat/tmp2.dat $PBS_O_WORKDIR/dat/tmp3.dat > $PBS_O_WORKDIR/dat/pmm-escalabilidad-atcgrid.dat

echo -e "Elementos\tSecuencial\t2 threads\t4 threads\n$(cat $PBS_O_WORKDIR/dat/pmm-escalabilidad-atcgrid.dat)" > $PBS_O_WORKDIR/dat/pmm-escalabilidad-atcgrid.dat

rm $PBS_O_WORKDIR/dat/tmp0.dat $PBS_O_WORKDIR/dat/tmp1.dat $PBS_O_WORKDIR/dat/tmp2.dat $PBS_O_WORKDIR/dat/tmp3.dat

