# Some default options
# These can be overridden via the command line when calling make
VERSION=00
OMP=no
ACC=yes
NTPB=256

# PGI compiler
FC = nvfortran

FFLAGS=-DNTPB=$(NTPB)

FFLAGS += -Mpreprocess -fpic 

ifeq ($(OMP),yes) 
  FFLAGS += -mp
endif

ifeq ($(ACC),yes)
  FFLAGS += -acc -Mcuda -Minfo=accel -ta=nvidia
endif

%.o: %.f himeno_f77.f
	$(FC) $(FFLAGS) -c $<

himeno.x: himeno_f77.o
	$(FC) $(FFLAGS) -o $@ $<

clean:
	$(RM) himeno_v*.x *.o *~

