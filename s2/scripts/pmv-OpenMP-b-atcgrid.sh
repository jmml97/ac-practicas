#!/bin/bash
#Se asigna al trabajo el nombre pmv-OpenMPr
#PBS -N pmv-OpenMPr
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"

TIMEFORMAT='%R'
i=1

echo "pmv-OpenMP-b 10000"
while [ $i -le 12 ]
do
    
    echo "Num threads $i"
    export OMP_NUM_THREADS=$i
    echo -n "$i " >> pmv-OpenMP-b.dat
    (time $PBS_O_WORKDIR/pmv-OpenMP-b 10000 > /dev/null) >> pmv-OpenMP-b.dat  2>&1
    i=$[$i+1]
done

i=1
echo "pmv-OpenMP-b 30000"
while [ $i -le 12 ]
do
    
    echo "Num threads $i"
    export OMP_NUM_THREADS=$i
    echo -n "$i " >> pmv-OpenMP-b.dat
    (time $PBS_O_WORKDIR/pmv-OpenMP-b 30000 > /dev/null) >> pmv-OpenMP-b.dat  2>&1
    i=$[$i+1]
done
