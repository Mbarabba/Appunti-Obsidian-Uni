import java.util.concurrent.*;

public class MaxAccessRes {
  private Semaphore sem;

  MaxAccessRes(int size) {
    sem = new Semaphore(size);
  }

  public void access() {
    try {
      sem.acquire();
      System.out.println(Thread.currentThread().getName() + " acquired the permit. ");  
      // doing some action
      Thread.sleep(1000);
    } catch (InterruptedException exc) {
    }
    // Release the permit.
    System.out.println(Thread.currentThread().getName() + " releases the permit. ");
    sem.release();
  }
}