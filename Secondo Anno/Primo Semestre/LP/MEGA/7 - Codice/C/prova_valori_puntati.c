#include <stdio.h>


int main() {
  int valore = 1;
  printf("%d\n", valore);
  int * copiaValore = &valore;
  printf("%d\n", *copiaValore);
  valore = 2;
  printf("%d\n", valore);
  /*copiaValore vale 2 perche' punta
   all'area di memoria contenente 
   valore*/
  printf("%d\n", *copiaValore);
}
