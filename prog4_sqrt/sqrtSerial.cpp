#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <immintrin.h>


void sqrtSerial(int N,
                float initialGuess,
                float values[],
                float output[])
{

    static const float kThreshold = 0.00001f;

    for (int i=0; i<N; i++) {

        float x = values[i];
        float guess = initialGuess;

        float error = fabs(guess * guess * x - 1.f);

        while (error > kThreshold) {
            guess = (3.f * guess - x * guess * guess * guess) * 0.5f;
            error = fabs(guess * guess * x - 1.f);
        }

        output[i] = x * guess;
    }
}




void sqrt_avx2(int N, float initialGuess, float* values, float* output) {
    __m256 kThree = _mm256_set1_ps(3.f);
    __m256 kHalf = _mm256_set1_ps(0.5f);

    for (int i = 0; i < N; i += 8) {
        __m256 x = _mm256_loadu_ps(&values[i]); // Load 8 floats from values
        
        __m256 currGuess = _mm256_rsqrt_ps(x);  // Initial guess 

        // Perform 3 iterations of Newton's method to refine the guess
        for (int iter = 0; iter < 3; iter++) {
            __m256 xg2 = _mm256_mul_ps(x, _mm256_mul_ps(currGuess, currGuess));
            __m256 sub = _mm256_sub_ps(kThree, xg2);
            currGuess = _mm256_mul_ps(_mm256_mul_ps(currGuess, sub), kHalf);
        }

        // Compute final result as x * currGuess
        __m256 finalResult = _mm256_mul_ps(x, currGuess);
        _mm256_storeu_ps(&output[i], finalResult);
    }
}