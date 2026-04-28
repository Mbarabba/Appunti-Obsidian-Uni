import java.util.concurrent.locks.*;
public class SharedRes 
{
  private Lock l = new ReentrantLock(); 
  private int counter = 0;

  public void increment(){
    l.lock();
    try {
      System.out.println(Thread.currentThread().getName() + " acquired the lock.");
      // doing some action
      try {
        counter++;
        Thread.sleep(1000);
      } catch (InterruptedException e) {
      }
    } finally {
      // Release the permit.
      System.out.println(Thread.currentThread().getName() + " releases the lock.");
      l.unlock();
    }
  }
  public int getCounter(){
    return counter;
  }
}