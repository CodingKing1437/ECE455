#include <stdio.h>

__global__ void hello_kernel () {
    int ID = blockIdx.x * blockDim.x + threadIdx.x;
    printf("Hello from thread %d", ID);
}

int main() {
    hello_kernel<<<2, 4>>>();
    cudaDeviceSynchronize ();
    return 0;
}