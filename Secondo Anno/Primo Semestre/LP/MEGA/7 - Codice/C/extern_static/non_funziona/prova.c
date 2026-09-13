#include <stdio.h>

extern int calcola_numero();

int main(){
    int i;
    for(i = 0; i < 10; i++){
      printf("%d\n", calcola_numero());
    }
}
