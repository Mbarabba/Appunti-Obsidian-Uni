import java.util.concurrent.*;

class Main {

  public static void main(String[] args) {
    // creatin a threadpoolexecutor with a single thread
    ExecutorService pool = Executors.newSingleThreadExecutor();
    // creating a thread submitting a Callable 
    Future<Integer> result = pool.submit(new Summation(10));
    // something can be done while the other thread is running
    
    for (int i = 0; i < 100_000; i++){
      // print a something each 10000 iterations
      if (i % 10_000 == 0) {
         System.out.println("main: doing something else...");
      }
    }
   
    
    // waiting for the result
    try {
      System.out.println("result: " + result.get()); // it waits here or it gets interrupted
    } catch (InterruptedException | ExecutionException ie) {
      System.out.println("Exception!");
    }

    pool.shutdown(); // this will shutdown the threadpool
    System.out.println("Exiting");
  }

}