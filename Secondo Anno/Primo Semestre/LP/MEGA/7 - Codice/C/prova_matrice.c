#include <stdio.h>
#include <stdlib.h>

struct matrice {  int n_colonne;
                  int n_righe;
                  double *valori;
                };
typedef struct matrice* matrix;

matrix new_matrix(int rows, int columns){
  matrix matrice = (matrix) malloc(sizeof(matrice));
  matrice->n_colonne = columns;
  matrice->n_righe = rows;
  matrice->valori = (double *) malloc(columns * rows * sizeof(double));
  return matrice;
}

void fill_matrix(matrix m, double values[]){
  int contatore = 0;
  for(int i = 0; i < m->n_righe; i++){
    for(int j = 0; j < m->n_colonne; j++){
      m->valori[contatore] = values[contatore];
      printf("%f\t", values[contatore]);
      contatore++;
    }
    printf("\n");
  }
}

int main(){
  matrix matrice_prova = new_matrix(9, 4);
  double lista_valori[50]; /*Se passo più valori, questi vengono ignorati*/
  for(int i = 0; i < 50; i++) lista_valori[i] = i;
  fill_matrix(matrice_prova, lista_valori);
}
