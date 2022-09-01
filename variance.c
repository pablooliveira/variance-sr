#include <stdlib.h>

// Compute unbiased population variance

// Naïve method
REAL naive(size_t n, REAL *values)
{

    REAL N = (REAL)n;

    // sum squares
    REAL sum_sq = 0.0;

    // square of sum
    REAL sq_sum = 0.0;

    for (size_t i = 0; i < n; i++)
    {
        sum_sq += values[i] * values[i];
        sq_sum += values[i];
    }

    sq_sum *= sq_sum;

    // Use Bessel's correction
    REAL sigma2 = (sum_sq - sq_sum / N) / (N - 1);

    return sigma2;
}

// Two-pass method
REAL twopass(size_t n, REAL *values)
{

    REAL N = (REAL)n;

    // mean
    REAL mean = 0.0;
    for (size_t i = 0; i < n; i++)
    {
        mean += values[i];
    }
    mean = mean / N;

    // square of sum
    REAL sigma2 = 0.0;
    for (size_t i = 0; i < n; i++)
    {
        REAL d = values[i] - mean;
        sigma2 += d * d;
    }
    sigma2 = sigma2 / (N - 1);

    return sigma2;
}
