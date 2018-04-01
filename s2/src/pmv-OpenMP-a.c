#include <stdlib.h>
#include <stdio.h>

#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#define omp_get_num_threads() 1
#endif

int main(int argc, char** argv)
{
    int i, j;
    double t1, t2, total;

    if (argc<2){
        printf("Uso: ./programa num_filas_columnas\n");
        exit(-1);
    }

    unsigned int filcols = atoi(argv[1]);

    double *v1, *v2, **m;
    v1 = (double*) malloc(filcols*sizeof(double));// malloc necesita el tamaño en bytes
    v2 = (double*) malloc(filcols*sizeof(double)); //si no hay espacio suficiente malloc devuelve NULL
    m = (double**) malloc(filcols*sizeof(double *));
    if ( (v1==NULL) || (v2==NULL) || (m==NULL) ){
        printf("Error en la reserva de espacio para los vectores\n");
        exit(-2);
    }

    // Reservamos memoria para lo que es la matriz en sí
    for (i = 0; i < filcols; i++){
        m[i] = (double*) malloc(filcols*sizeof(double));
        if ( m[i]==NULL ){
            printf("Error en la reserva de espacio para los vectores\n");
            exit(-2);
        }
    }

    // Rellenamos tanto la matriz como los vectores
    #pragma omp parallel
    {
    #pragma omp for private(j)
    for (i = 0; i < filcols; i++)
    {
        v1[i] = i;
        v2[i] = 0;
        for(j = 0; j < filcols; j++)
            m[i][j] = i + j;
    }

    // Tomamos la primera medida del tiempo
    #pragma omp single
    t1 = omp_get_wtime();

    //Calcular producto de matriz por vector v2 = m · v1
    #pragma omp for private(j)
    for (i = 0; i < filcols; i++)
        for(j = 0;j < filcols; j++)
            v2[i] += m[i][j] * v1[j];

    // Calculamos el tiempo empleado en la ejecución
    #pragma omp single
    t2 = omp_get_wtime();
}

    total = t2 - t1;

    //Imprimimos tanto el resultado como el tiempo de ejecución
    printf("Tiempo(seg.):%11.9f\t / Tamaño:%u\t/ V2[0]=%8.6f V2[%d]=%8.6f\n", total,filcols,v2[0],filcols-1,v2[filcols-1]);

    // Imprimimos el resltado si el vector no es muy grande
    if (filcols<20)
        for (i=0; i<filcols;i++)
            printf(" V2[%d]=%5.2f\n", i, v2[i]);


    free(v1); // libera el espacio reservado para v1
    free(v2); // libera el espacio reservado para v2
    for (i=0; i<filcols; i++) // liberamos el espacio de la matriz 
        free(m[i]);
    free(m);

    return 0;
}
