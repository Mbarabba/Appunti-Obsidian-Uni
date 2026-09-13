#include <stdio.h>
extern int doppio (int);

int main(){
  printf("%d\n", doppio(21));
}

/* Qua posso scriverla sia con "extern" che senza */
extern int doppio (int x){
  return 2 * x;
}
