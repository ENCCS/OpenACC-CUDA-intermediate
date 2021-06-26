gcc reduction_cpu_1.cpp -o reduction_cpu_1
gcc reduction_cpu_2.cpp -o reduction_cpu_2

/usr/local/cuda/bin/nvcc reduction_gpu_1.cu -o reduction_gpu_1
/usr/local/cuda/bin/nvcc reduction_gpu_2.cu -o reduction_gpu_2
/usr/local/cuda/bin/nvcc reduction_gpu_3.cu -o reduction_gpu_3
/usr/local/cuda/bin/nvcc reduction_gpu_4.cu -o reduction_gpu_4
/usr/local/cuda/bin/nvcc reduction_gpu_5.cu -o reduction_gpu_5
/usr/local/cuda/bin/nvcc reduction_gpu_6.cu -o reduction_gpu_6
/usr/local/cuda/bin/nvcc reduction_gpu_7.cu -o reduction_gpu_7