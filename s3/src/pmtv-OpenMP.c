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
    int i, j, t=1;

    if (argc < 2) {
        printf("Falta el tamaño\n");
        exit(-1);
    }

    unsigned int N = atoi(argv[1]);

    if (argc == 3) {
        t = atoi(argv[2]);
    }

    int *vector, *res, **matriz;
    vector = (int*) malloc(N * sizeof(int));
    res = (int*) malloc(N * sizeof(int));
    matriz = (int**) malloc(N * sizeof(int*));

    for (int i = 0; i < N; i++)
        matriz[i] = (int*) malloc (N * sizeof(int));

    for (int i = 0; i < N; i++)
    {
        for (j = i; j < N; j++)
            matriz[i][j] = 3;
        vector[i] = 2;
        res[i] = 0;
    }

    if (t == 0) {
        printf("La matriz es: \n");
        for (i = 0; i < N; i++)
        {
            for (j = 0; j < N; j++)
            {
                if (j >= i)
                    printf("%d ", matriz[i][j]);
                else
                    printf("0 ");
            }
            printf("\n");
        }

        printf("El vector es: \n");
        for (i = 0; i < N; ++i) {
            printf("%d ", vector[i]);
        }
        printf("\n");

    }

    double inicio, fin, total;
    inicio = omp_get_wtime();

#pragma omp parallel for private(j) schedule(runtime)
    for (i = 0; i < N; ++i) {
        for (j = i; j < N; ++j) {
            res[i] += matriz[i][j] * vector[j];
        }
    }

    fin = omp_get_wtime();
    total = fin - inicio;

    if (t == 0) {
        printf("El resultado es: \n");
        for (i = 0; i < N; ++i) {
            printf("%d ", res[i]);
        }
        printf("\n");
    } else if (t == 1) {
        printf("%4.4f\n", total);
    }

    for (i = 0; i < N; ++i) {
        free(matriz[i]);
    }
    free(matriz);
    free(vector);
    free(res);

}
