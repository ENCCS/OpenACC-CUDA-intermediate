#!/bin/bash

#SBATCH -t 00:10:00
#SBATCH -o output.o
#SBATCH -e error.e
#SBATCH -n 1

# export PGI_ACC_TIME=1
./himeno.x > log.himeno..txt 2>&1
