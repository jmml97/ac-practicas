#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif

main(int argc, char **argv) {

    int i, n = 16,chunk, a[n],suma=0;
    int d = 0;

    if(argc < 2) {
        fprintf(stderr,"\nFalta chunk \n");
        exit(-1);
    } else if (argc == 3) {
        d = atoi(argv[2]);
    }

    chunk = atoi(argv[1]);

    for (i=0; i<n; i++) a[i] = i;

    #pragma omp parallel for firstprivate(suma) lastprivate(suma) schedule(static,chunk)
    for (i=0; i<n; i++)
    {
        suma = suma + a[i];
        if (d) {
            printf("%i\n", omp_get_thread_num());
        } else {
            printf(" thread %d suma a[%d] suma=%d \n", omp_get_thread_num(),i,suma);
        }
    }

    if (!d) {
        printf("Fuera de 'parallel for' suma=%d\n",suma);
    }
}
