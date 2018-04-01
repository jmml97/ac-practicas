#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num() 0
#endif

int main(int argc, char **argv)
{
    int i, j;

    if (argc < 2)
    {
        printf("Falta indicar el tamaño\n");
    }

    unsigned int N = atoi(argv[1]);

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

    for (i = 0; i < N; ++i) {
        for (j = i; j < N; ++j) {
            res[i] += matriz[i][j] * vector[j];
        }
    }

    printf("El resultado es: \n");
    for (i = 0; i < N; ++i) {
        printf("%d ", res[i]);
    }
    printf("\n");

    for (i = 0; i < N; ++i) {
        free(matriz[i]);
    }
    free(matriz);
    free(vector);
    free(res);
}
