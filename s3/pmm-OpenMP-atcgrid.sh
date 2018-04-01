#!/bin/bash

#Se asigna al trabajo el nombre
#PBS -N pmm-OpenMP
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

$PBS_O_WORKDIR/bin/pmm-OpenMP 1000 0

