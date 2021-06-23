SHELL=/bin/sh
BENCHMARK=mg
BENCHMARKU=MG
VERSION=00
OMP=no
ACC=no
NTHREADS=128
PROFILE_GENERATE=no
PROGRAM_LIBRARY=no
BOUNDS_CHECK=no
CUDA=no

include ../config/make.def

OBJS = mg_v${VERSION}.o ${COMMON}/c_print_results.o  \
       ${COMMON}/c_${RAND}.o ${COMMON}/c_timers.o ${COMMON}/c_wtime.o

ifeq ($(CUDA),yes)
# Add in the CUDA (N.B. no extra link flags needed)
 OBJS += mg_kernels.o 
 CFLAGS += -DUSE_CUDA
endif

include ../sys/make.common

${PROGRAM}: config ${OBJS}
	${CLINK} ${CLINKFLAGS} -o ${PROGRAM} ${OBJS} ${C_LIB}

mg_v$(VERSION).o: mg_v$(VERSION).c npbparams.h
	${CCOMPILE} -DNTHREADS=$(NTHREADS) -o $@ -c $<

mg_kernels.o: mg_kernels.cu
	nvcc -DNTHREADS=$(NTHREADS) -O3 -c -o mg_kernels.o mg_kernels.cu

clean:
	- rm -f *.o *~ 
	- rm -f npbparams.h core



