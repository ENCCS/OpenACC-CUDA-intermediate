# Some default options
# These can be overridden via the command line when calling make
# 
VERSION=00
OMP=no
ACC=yes
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

himeno.x: himeno_C.o
	$(CC) $(CFLAGS) -o $@ $<

clean:
	$(RM) himeno.x *.o *~

