public class SynchRunnable implements Runnable {
  private SharedRes s;

  public SynchRunnable(SharedRes s) {
    this.s = s;
  }

  public void run() {
    s.increment();
  }
}