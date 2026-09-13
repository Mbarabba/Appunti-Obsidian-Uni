#include <stdio.h>

void swap_due_interi(int * a, int * b)
{
  int temp = *a; /* temp diventa 4 */
  *a = *b;       /* il valore di a diventa 5*/
  *b = temp;     /* b vale a */

}

int main()
{
  int a = 4;
  int b = 5;
  swap_due_interi(&a, &b);
  printf("%d %d\n", a, b);
}
