import java.util.concurrent.*;
// implementing the Callable interface for a thread that returns an integer

class Summation implements Callable<Integer> { // Generics
  
  private int upper;
  
  public Summation(int u)
  {
    this.upper = u;
  }
 // the thread will execute this code 
  public Integer call()
  {
    System.out.println("Thread started");
    int sum = 0;
    for (int i = 0; i <= upper; i++) {
      sum+=i;      
    }
    return Integer.valueOf(sum);
  }
}