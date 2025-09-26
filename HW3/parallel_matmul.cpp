#include <iostream>
#include <vector>
#include <omp.h>

int main() {
    const int TOTAL = 1024;
    std::vector<std::vector<int>> A(TOTAL, std::vector<int>(TOTAL, 1));
    std::vector<std::vector<int>> B(TOTAL, std::vector<int>(TOTAL, 2));
    std::vector<std::vector<int>> C(TOTAL, std::vector<int>(TOTAL, 0));

    #pragma omp parallel for
    for (int i = 0; i < TOTAL; ++i) {
        for (int j = 0; j < TOTAL; ++j) {
            int sum = 0;
            for (int k = 0; k < TOTAL; ++k) {
                sum += A[i][k] * B[k][j];
            }
            C[i][j] = sum;
        }
    }

    std::cout << "C[0][0] = " << C[0][0] << std::endl;
    return 0;
}
