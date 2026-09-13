#include <stdio.h>

int uso_somma(int (*f) (int, int), int a, int b){
   int somma = f(a, b);
   return somma;
}


int somma(int a, int b){
   return a + b;
}

int main(){
   int (*punto_a_somma) (int, int) = &somma;
   printf("%d\n", uso_somma(punto_a_somma, 3, 4));
}
