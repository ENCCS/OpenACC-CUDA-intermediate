#!/bin/bash

# Use this script to write a submission script and then submit the job

# Make sure there are the right amount of arguments given
if [ $# -ne 2 ]
then
  echo "Usage: $0 MYPE EXECUTABLE"
  exit
fi

MYPE=$1
EXECUTABLE=$2
app=$(basename $EXECUTABLE)

# Sanity-check MYPE by running the script
. ../../XK_setup.bash ${MYPE}

# A directory on the lustre in which to run the code
LUS=/lus/scratch/$USER/OpenACC_training/Practical3/C/${MYPE}_$(date +%y%m%d)_$(date +%H%M%S)
# Tell me where it is, for future reference
echo "Running in directory:"
echo $LUS
# Make the directory (and parents) if it isn't already there
mkdir -p $LUS
# Copy the application to the working directory
cp $EXECUTABLE $LUS
# Move the setup script there as well
cp ../../XK_setup.bash $LUS
# Move to the working directory
cd $LUS

# Write a PBS submission script
#   We will use one node (mppwidth), with one thread per node (mppdepth) and
#   one MPI process per node (mppnppn).
#   Submitting to the "gpu_nodes" queue ensures we target the XK6 nodes 
#   on raven (other Cray systems will do this differently)
#   For all other options, see "man qsub"
cat <<EOF >> submit.pbs
#!/bin/sh
#PBS -N `echo $app | cut -c1-15`
#PBS -l mppwidth=1
#PBS -l mppdepth=1
#PBS -l mppnppn=1
#PBS -l walltime=00:03:00
#PBS -j oe
#PBS -o $app.log
#PBS -q gpu_nodes

# Make sure PBS is loaded
. \${MODULESHOME}/init/sh
module load pbs

# Change to the submission directory
cd \$PBS_O_WORKDIR

# Load appropriate programming environment
#   So appropriate runtime libraries are found
. XK_setup.bash ${MYPE}

# Uncomment this line for debugging with CCE
#export CRAY_ACC_DEBUG=2
# Uncomment this line for debugging with PGI
#export ACC_NOTIFY=1
# Uncomment this line for basic profiling (either CCE or PGI)
#export COMPUTE_PROFILE=1

# Execute the code, inheriting the job parameters from PBS
aprun -B $app

EOF

# Submit the job
qsub submit.pbs
