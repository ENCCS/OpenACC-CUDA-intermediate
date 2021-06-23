SHELL=/bin/sh
CLASS=B
SFILE=config/suite.def
VERSION=00
OMP=no
ACC=yes
NTHREADS=128
PROFILE_GENERATE=no
PROGRAM_LIBRARY=no
BOUNDS_CHECK=no
CUDA=yes

#default: header
#	@ $(SHELL) sys/print_instructions

default: mg

MG: mg		       
mg: header	       
	cd MG; $(MAKE) CLASS=$(CLASS) VERSION=$(VERSION) ACC=$(ACC) OMP=$(OMP) NTHREADS=$(NTHREADS) PROFILE_GENERATE=$(PROFILE_GENERATE) PROGRAM_LIBRARY=$(PROGRAM_LIBRARY) BOUNDS_CHECK=$(BOUNDS_CHECK) CUDA=$(CUDA)

# Awk script courtesy cmg@cray.com
suite:
	@ awk '{ if ($$1 !~ /^#/ &&  NF > 0)                              \
	printf "make %s CLASS=%s\n", $$1, $$2 }' $(SFILE)  \
	| $(SHELL)


# It would be nice to make clean in each subdirectory (the targets
# are defined) but on a really clean system this will won't work
# because those makefiles need config/make.def
clean:
	- rm -f core 
	- rm -f *~ */core */*~ */*.o */npbparams.h */*.obj */*.exe
	- rm -f bin/*
	- rm -f sys/setparams sys/makesuite sys/setparams.h

veryclean: clean
#	- rm config/make.def config/suite.def Part*
	- rm -f bin/mg.*
	- rm -fR MG/prog_lib.pl

header:
	@ $(SHELL) sys/print_header

kit: 
	- makekit -s100k -k30 * */* */*/*


