The aim of this practical is to develop an OpenACC port of a simple
application

* You will follow the steps taken in the Worked Example lecture
 *  You can either do these steps yourself
 *  Or you can use the prepared answer versions

The code considered is the scalar Himeno code. There are both C and Fortran
versions (both with static memory allocation). You should work in the
appropriate directory.

In each case, there are few versions in the solution folder
* Version 00: original serial version is (nearly) as downloaded
* Version 01: original OpenMP version
* Version 03: First version with OpenACC kernel
* Version 04: More OpenACC kernels
* Version 05: Optimized OpenACC Loop performances
* Version 06: Optimized OpenACC data movements
* Version 07: OpenACC Loop collapses
* Version 08: Call cuda kernel from OpenACC


BUILDING THE CODE
=================

Type:

make clean
make 

An executable is created called in ./bin/mg.B.x 


SUBMIT JOB
===========================

Type:

sbatch run_MG.sh

* check job status with command: squeue -u $USER
* when job finishes, output written in log file in specified directory
* To run different versions in 'solution' subfolder, you can change
'VERSION=00' in Makefile or run 'make VERSION=0[3-8]"

