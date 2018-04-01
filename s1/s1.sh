#!/bin/bash

#Se asigna al trabajo el nombre s1
#PBS -N s1
#Se asigna al trabajo la cola ac
#PBS -q ac

#Se fija a 12 el número de threads máximo (tantos como cores en un nodo)
export OMP_THREAD_LIMIT=12

./datos.sh
./ej11.sh

