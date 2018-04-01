#include <stdio.h>
#include <stdlib.h>

#ifdef _OPENMP
    #include <omp.h>
#else
    #define omp_get_thread_num() 0
    #define omp_get_num_threads() 1
    #define omp_set_num_threads(int)
    #define omp_in_parallel() 0
    #define omp_set_dynamic(int)
#endif

int main(int argc, char **argv)
{
    unsigned i, j, k, d = 1;

    if(argc < 2) {
        fprintf(stderr, "falta size\n");
        exit(-1);
    } else if (argc == 3) {
        d = atoi(argv[2]);
    }

    unsigned int N = atoi(argv[1]);

    int **a, **b, **c;
    a = (int **) malloc(N*sizeof(int*));
    b = (int **) malloc(N*sizeof(int*));
    c = (int **) malloc(N*sizeof(int*));

    for (i=0; i<N; i++) {
        a[i] = (int *) malloc(N*sizeof(int));
        b[i] = (int *) malloc(N*sizeof(int));
        c[i] = (int *) malloc(N*sizeof(int));
    }

    #pragma omp parallel for private(j)
    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            a[i][j] = 2;
            b[i][j] = 3;
            c[i][j] = 4;
        }
    }

    double start, end, total;
    start = omp_get_wtime();

    #pragma omp parallel for private(k,j)
    for (i=0; i<N; i++)
        for (j=0; j<N; j++)
            for (k=0; k<N; k++)
                a[i][j] += b[i][k] * c[k][j];

    end = omp_get_wtime();

    total = end - start;

    if (d) {
        printf("%4.4f\n", total);
    } else {
        printf("Tiempo de ejecución = %4.4f\t (0, 0) = %d\t (N-1, N-1)=%d\n", total, a[0][0], a[N-1][N-1]);
    }

    for (i=0; i<N; i++) {
        free(a[i]);
        free(b[i]);
        free(c[i]);
    }

    free(a);
    free(b);
    free(c);

}
