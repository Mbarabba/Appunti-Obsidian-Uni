#include <stdio.h>
#include <stdlib.h>

int main () {
  int* p = (int*) malloc(10 * sizeof(int));
  int i;
  *p = 1;
  *(p + 1) = 42;
  *(p + 2) = 0;
  for (i = 0; i < 10; i++)
    printf("%d\n", *(p + i));
  free(p);
}
