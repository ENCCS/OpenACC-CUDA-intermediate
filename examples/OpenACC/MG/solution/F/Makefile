SHELL=/bin/sh
CLASS=B
SFILE=config/suite.def
VERSION=03
OMP=no
ACC=yes
NTHREADS=128
PROFILE_GENERATE=no
PROGRAM_LIBRARY=no
BOUNDS_CHECK=no
CUDA=yes

#default: header
#	@ sys/print_instructions

default: mg

MG: mg		       
mg: header
	cd sys; $(MAKE) clean && $(MAKE) 
	cd MG; $(MAKE) CLASS=$(CLASS) VERSION=$(VERSION) ACC=$(ACC) OMP=$(OMP) NTHREADS=$(NTHREADS) PROFILE_GENERATE=$(PROFILE_GENERATE) PROGRAM_LIBRARY=$(PROGRAM_LIBRARY) BOUNDS_CHECK=$(BOUNDS_CHECK) CUDA=$(CUDA)

# Awk script courtesy cmg@cray.com, modified by Haoqiang Jin
suite:
	@ awk -f sys/suite.awk SMAKE=$(MAKE) $(SFILE) | $(SHELL)


# It would be nice to make clean in each subdirectory (the targets
# are defined) but on a really clean system this will won't work
# because those makefiles need config/make.def
clean:
	- rm -f core 
	- rm -f *~ */core */*~ */*.o */npbparams.h */*.obj */*.exe
	- rm -f sys/setparams sys/makesuite sys/setparams.h
	- rm -rf */rii_files

veryclean: clean
#	- rm -f config/make.def config/suite.def 
	- rm -f bin/mg.*.x bin/mg.*.x+pat
	- $(RM) -r MG/prog_lib.pl

header:
	@ sys/print_header



