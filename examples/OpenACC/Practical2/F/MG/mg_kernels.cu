#include "cuda.h"
#include "stdio.h"

//----------------------------------------------------------------
// Check the last CUDA error
void checkCUDAError(const char *msg){
  cudaError_t err = cudaGetLastError();
  if(cudaSuccess!=err){
    fprintf(stderr,"CUDA Error: %s: %s.\n",msg,cudaGetErrorString(err));
    exit(EXIT_FAILURE);
  }
}
//----------------------------------------------------------------

__global__ void resid_kernel(double *u, double *v, double *r, 
			     int n1, int n2, int n3, 
			     double *a)
{
  // Number of this thread
  int tidx = blockIdx.x*blockDim.x+threadIdx.x;
  // Total number of threads
  int tnum = gridDim.x*blockDim.x;

  int n12 = n1*n2;
    
  // Loop over all the iterations needed
  for(int i123=tidx;i123 < n12*n3;i123+=tnum){

    int i3 = i123/n12;
    int i12 = i123 - i3*n12;
    int i2 = i12/n1;
    int i1 = i12 - i2*n1;
    
    // Only do calculations if we are in the bulk (not the halo)
    if (i1 > 0 && i1 < n1-1 &&
	i2 > 0 && i2 < n2-1 &&
	i3 > 0 && i3 < n3-1)
      {
	r[i123] = v[i123]
	  - a[0] * u[i123]
	  - a[2] * ( 
                 u[i123-n1-n12] + u[i123+n1-n12]
                 + u[i123-n1+n12] + u[i123+n1+n12] +
                 u[i123-1-n1] + u[i123-1+n1]
                 + u[i123-1-n12] + u[i123-1+n12] +
                 u[i123+1-n1] + u[i123+1+n1]
                 + u[i123+1-n12] + u[i123+1+n12] )
	  - a[3] * ( 
                 u[i123-1-n1-n12] + u[i123-1+n1-n12]
                 + u[i123-1-n1+n12] + u[i123-1+n1+n12] +
                 u[i123+1-n1-n12] + u[i123+1+n1-n12]
                 + u[i123+1-n1+n12] + u[i123+1+n1+n12] );
      }
  }
}

extern "C" void resid_cuda_(double *u, double *v, double *r, 
			     int *n1, int *n2, int *n3, 
			     double *a)
{
    // Synchronise threads to make sure OpenACC kernels have finished
    cudaThreadSynchronize();

    // Kernel launch parameters
    int threads_n = NTHREADS;
    int n123 = (*n1)*(*n2)*(*n3);
    int blocks_n = (n123+threads_n-1)/threads_n;
    // Make sure there aren't too many blocks.
    if (blocks_n > 65535) blocks_n = 65535;

    // Launch the GPU kernel
    resid_kernel<<<blocks_n,threads_n>>>(u, v, r, 
					 *n1, *n2, *n3, 
					 a);

    // Synchronise threads before more OpenACC kernels started
    cudaThreadSynchronize();
    // Check the error (commented out)
    //checkCUDAError("kernel");
}
