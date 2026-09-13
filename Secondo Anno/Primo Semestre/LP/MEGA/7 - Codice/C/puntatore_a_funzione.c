#include <stdio.h>
int funzione_da_puntare(int x){
  return x == 42 ? 1 : 0;
}

int main(){
  int (*puntatore_a_funzione) (int);
  puntatore_a_funzione = funzione_da_puntare;
  printf("%d\n", puntatore_a_funzione(42));
}
