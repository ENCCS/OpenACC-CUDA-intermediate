The aim of this practical is to develop an OpenACC port of a simple
application

* You will follow the steps taken in the Worked Example lecture
 *  You can either do these steps yourself
 *  Or you can use the prepared answer versions

The code considered is the scalar Himeno code. There are both C and Fortran
versions (both with static memory allocation). You should work in the
appropriate directory.

In each case, there are 4 versions of the code
* Version 00 is (nearly) as downloaded
 *  a few language tweaks and a new timer is used
* Version 01 has the first OpenACC kernel
* Version 02 has a data region in the jacobi() subprogram
* Version 03 is the full port


SETTING THE ENVIRONMENT
=======================

Type:

. ../../XK_setup.bash [cray|pgi]

if no argument is given, the default is cray.


BUILDING THE CODE
=================

Type:

make clean
make VERSION=[00|01|02|03] [ACC=yes]

Choose the VERSION to build. Set ACC=yes for the compiler to recognise OpenACC
directives. An executable is created called himeno_vNN.x where NN is the
version.


WRITE JOB SCRIPT AND SUBMIT
===========================

Type:

bash submit.bash [cray|pgi] himeno_vNN.x

Specifying the Programming Environemtn used and the executable to run.

This script:

* creates directory on lustre (and reports where it is)
* submits it with command: qsub submit.pbs
* check job status with command: qstat -u $USER
* when job finishes, output written in log file in specified directory
