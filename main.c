#include <assert.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

REAL naive(size_t n, REAL *values);
REAL twopass(size_t n, REAL *values);

// initialize arrays with positive floating-points between 0 and 1
REAL *random_array(long n)
{
    REAL *A = malloc(n * sizeof(REAL));
    for (int i = 0; i < n; i++)
    {
        A[i] = (float)rand() / (float)RAND_MAX;
    }
    return A;
}

int main(int argc, char *argv[])
{
    // seed RND with fixed seed 0
    srand(0);
    assert(argc == 3);
    long n = strtol(argv[1], NULL, 10);
    long repetitions = strtol(argv[2], NULL, 10);

    REAL *I = random_array(n);

    for (int r = 0; r < repetitions; r++)
    {
        REAL res_naive = naive(n, I);
        printf("naive %.17lf\n", (double)res_naive);
        REAL res_twopass = twopass(n, I);
        printf("twopass %.17lf\n", (double)res_twopass);
    }

    free(I);
}
