#include <stdio.h>
#include <stdbool.h>

/* Ritorna il valore originale e setta sempre a true */

bool test_and_set(bool * obj){
  bool val = *obj;
  *obj = true;
  return val;
}

int main() {
  bool ob = true;
  printf("%s", test_and_set(&ob) ? "T" : "F");
  ob = false;
  printf("%s", test_and_set(&ob) ? "T" : "F");
}
