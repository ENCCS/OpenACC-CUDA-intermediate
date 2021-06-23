The aim of this practical is to develop an OpenACC port of a simple
application

* You will follow the steps taken in the Worked Example lecture
 *  You can either do these steps yourself
 *  Or you can use the prepared answer versions

The code considered is the scalar Himeno code. There are both C and Fortran
versions (both with static memory allocation). You should work in the
appropriate directory.

In each case, there are few versions in the solution folder
* original Version is (nearly) as downloaded
 *  a few language tweaks and a new timer is used
* Version 01 has the first OpenACC kernel
* Version 02 has a data region in the subprogram
* Version 03 is the full port


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

