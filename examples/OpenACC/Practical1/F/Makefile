# Some default options
# These can be overridden via the command line when calling make
# e.g. "make VERSION=01 ACC=yes"
# Do not set both OMP and ACC to yes, as compilation will fail
VERSION=00
OMP=no
ACC=no
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

himeno_v$(VERSION).x: himeno_f77_v$(VERSION).o
	$(FC) $(FFLAGS) -o $@ $<

clean:
	$(RM) himeno_v*.x *.o *~

