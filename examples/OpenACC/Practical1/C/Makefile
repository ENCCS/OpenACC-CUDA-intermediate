# Some default options
# These can be overridden via the command line when calling make
# e.g. "make VERSION=01 ACC=yes"
# Do not set both OMP and ACC to yes, as compilation will fail
VERSION=00
OMP=no
ACC=no
NTPB=256

# PGI compiler
CC = nvc

CFLAGS=-DNTPB=$(NTPB)

# PGI compiler flags
CFLAGS += -Minfo=all -Mpreprocess -fpic 


ifeq ($(OMP),yes) 
  CFLAGS += -mp
endif

ifeq ($(ACC),yes)
  CFLAGS += -acc -Mcuda -ta=nvidia
endif

%.o: %.f himeno_C.h
	$(CC) $(CFLAGS) -c $<

himeno_v$(VERSION).x: himeno_C_v$(VERSION).o
	$(CC) $(CFLAGS) -o $@ $<

clean:
	$(RM) himeno_v*.x *.o *~

