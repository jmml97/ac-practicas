#!/bin/bash

#Se asigna al trabajo el nombre
#PBS -N pmtv-OpenMP
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


echo -e "Por-defecto\n1\n64" > $PBS_O_WORKDIR/dat/tmp0.dat

export OMP_SCHEDULE="static"
echo "static con chunk por defecto"
$PBS_O_WORKDIR/bin/pmtv-OpenMP 15360 > /dev/null > $PBS_O_WORKDIR/dat/tmp1.dat

export OMP_SCHEDULE="static,1"
echo "static con chunk 1"
$PBS_O_WORKDIR/bin/pmtv-OpenMP 15360 > /dev/null >> $PBS_O_WORKDIR/dat/tmp1.dat  2>&1

export OMP_SCHEDULE="static,64"
echo "static con chunk 64"
$PBS_O_WORKDIR/bin/pmtv-OpenMP 15360 > /dev/null >> $PBS_O_WORKDIR/dat/tmp1.dat  2>&1

export OMP_SCHEDULE="dynamic"
echo "dynamic con chunk por defecto"
$PBS_O_WORKDIR/bin/pmtv-OpenMP 15360 > /dev/null > $PBS_O_WORKDIR/dat/tmp2.dat  2>&1

export OMP_SCHEDULE="dynamic,1"
echo "dynamic con chunk 1"
$PBS_O_WORKDIR/bin/pmtv-OpenMP 15360 > /dev/null >> $PBS_O_WORKDIR/dat/tmp2.dat  2>&1

export OMP_SCHEDULE="dynamic,64"
echo "dynamic con chunk 64"
$PBS_O_WORKDIR/bin/pmtv-OpenMP 15360 > /dev/null >> $PBS_O_WORKDIR/dat/tmp2.dat  2>&1

export OMP_SCHEDULE="guided"
echo "guided con chunk por defecto"
$PBS_O_WORKDIR/bin/pmtv-OpenMP 15360 > /dev/null > $PBS_O_WORKDIR/dat/tmp3.dat  2>&1

export OMP_SCHEDULE="guided,1"
echo "guided con chunk 1"
$PBS_O_WORKDIR/bin/pmtv-OpenMP 15360 > /dev/null >> $PBS_O_WORKDIR/dat/tmp3.dat  2>&1

export OMP_SCHEDULE="guided,64"
echo "guided con chunk 64"
$PBS_O_WORKDIR/bin/pmtv-OpenMP 15360 > /dev/null >> $PBS_O_WORKDIR/dat/tmp3.dat  2>&1

paste $PBS_O_WORKDIR/dat/tmp0.dat $PBS_O_WORKDIR/dat/tmp1.dat $PBS_O_WORKDIR/dat/tmp2.dat $PBS_O_WORKDIR/dat/tmp3.dat > $PBS_O_WORKDIR/dat/pmtv-OpenMP1.dat

echo -e "Chunk\tStatic\tDynamic\tGuided\n$(cat $PBS_O_WORKDIR/dat/pmtv-OpenMP1.dat)" > $PBS_O_WORKDIR/dat/pmtv-OpenMP1.dat

rm $PBS_O_WORKDIR/dat/tmp0.dat $PBS_O_WORKDIR/dat/tmp1.dat $PBS_O_WORKDIR/dat/tmp2.dat $PBS_O_WORKDIR/dat/tmp3.dat
