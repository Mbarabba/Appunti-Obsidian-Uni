class RunnableDemo implements Runnable {
  // imlements Runnable interface
  private Thread t;
  private String threadName;

  RunnableDemo(String name) {
    threadName = name;
    System.out.println("Creating " + threadName);
  }

  // implementing the run method (this is the body of the thread)
  public void run() {
    System.out.println("Running " + threadName);
   // try {
      for (int i = 30; i > 0; i--) {
        System.out.println("Thread: " + threadName + ", " + i);
        // Let the thread sleep for a while.
 //       Thread.sleep(50); // 50 milliseconds. The scheduler will pick this thread up after 50
                         // milliseconds.
      }
   // } catch (InterruptedException e) { // Thread.sleep might throw an exception
   //   System.out.println("Thread " + threadName + " interrupted.");
   // }
    System.out.println("Thread " + threadName + " exiting.");
  }

  // quale thread esegue createThreadAndStart?
  public void createThreadAndStart() {
    if (t == null) {
      t = new Thread(this, threadName); // passing the object itself because it is a Runnable
      System.out.println("Starting " + threadName);
      t.start();
    }
  }
}

public class Main {
  // main method
  public static void main(String args[]) {
    RunnableDemo R1 = new RunnableDemo("Thread-1"); // creating thread 1
    // Thread t1 = new Thread(R1);
    // t1.start();
    R1.createThreadAndStart();
    RunnableDemo R2 = new RunnableDemo("Thread-2");
    R2.createThreadAndStart();

     RunnableDemo R3 = new RunnableDemo("Thread-3");
     R3.createThreadAndStart();
     RunnableDemo R4 = new RunnableDemo("Thread-4");
     R4.createThreadAndStart();
    System.out.println("Ending Main ");
  }
}