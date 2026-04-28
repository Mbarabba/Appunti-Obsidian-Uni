class Consumer extends Thread {
  private final Buffer buffer;
  private int readChars;
  
  public Consumer(Buffer b) {
    buffer = b;
    readChars = 0;
    setName("Consumer thread");
  }

  public void run() {
    while (readChars < 5) {
      char c = buffer.delete();
      readChars++;
      try{
        Thread.sleep(10);
      }
      catch(InterruptedException e){
        System.out.println("Thread interrupted.");
      }
    }
  }
}

class Producer extends Thread {
  private final Buffer buffer;
  private char[] buf = "aeiouaeiou".toCharArray();
  int writtenChars;
  
  public Producer(Buffer b) {
    buffer = b;
    writtenChars = 0;
    setName("Producer thread");
  }

  public void run() {
    while (writtenChars < buf.length){
      try{
        Thread.sleep(50);
      }
      catch(InterruptedException e){
        System.out.println("Thread interrupted.");
      }
      buffer.insert(buf[writtenChars]);
      //System.out.println("Produced character: " + buf[writtenChars]);
      writtenChars++;
    }
  }
}

public class Main {
  public static void main(String[] args) {
    System.out.println("program starting");
    Buffer buffer = new Buffer(3);  // buffer has size 3
    Producer prod1 = new Producer(buffer);
    prod1.setName("prod1");
    
    //Producer prod2 = new Producer(buffer);
    //prod2.setName("prod2");
    
    Consumer cons1 = new Consumer(buffer);
    cons1.setName("cons1");
    Consumer cons2 = new Consumer(buffer);
    cons2.setName("cons2");
    prod1.start();
   // prod2.start();
    cons1.start();
    cons2.start();
    try {
      prod1.join(); //<- thread main waits for prod1 to finish
    //  prod2.join();
      cons1.join();
      cons2.join();
    } catch (InterruptedException e) {}
    System.out.println("End of Program");
  }
}