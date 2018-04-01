#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char **argv) {
    unsigned i, j, k, d = 1;

    if (argc < 2) {
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

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++) {
            a[i][j] = 2;
            b[i][j] = 3;
            c[i][j] = 4;
        }
    }

    struct timespec cgt1, cgt2;
    double ncgt;

    clock_gettime(CLOCK_REALTIME, &cgt1);

    for (i=0; i<N; i++)
        for (j=0; j<N; j++)
            for (k=0; k<N; k++)
                a[i][j] += b[i][k] * c[k][j];

    clock_gettime(CLOCK_REALTIME,&cgt2);

    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec) + (double) ((cgt2.tv_nsec-cgt1.tv_nsec) / (1.e+9));

    if (d) {
        printf("%4.4f\n", ncgt);
    } else {
        printf("Tiempo de ejecución = %4.4f\t (0, 0) = %d\t (N-1, N-1) =%d\n", ncgt, a[0][0], a[N-1][N-1]);
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
