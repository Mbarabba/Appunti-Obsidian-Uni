public class Buffer {
  private final int MaxBuffSize;
  private char[] store;
  private int BufferStart, BufferEnd, BufferSize;
  
  public Buffer(int size) {
    MaxBuffSize = size;
    BufferEnd = -1;
    BufferStart = 0;
    BufferSize = 0;
    store = new char[MaxBuffSize];
  }

  public synchronized void insert(char ch) {
    try {
      while (BufferSize == MaxBuffSize) {
        Thread t = Thread.currentThread();
        System.out.println("Thread: " + t.getName() + "(" + t.getId() + ") going to wait in bounded buffer...");
        wait();
      }
      BufferEnd = (BufferEnd + 1) % MaxBuffSize;
      store[BufferEnd] = ch;
      BufferSize++;
      Thread t2 = Thread.currentThread();
      System.out.println("Produced character: " + ch+ " by "+t2.getName());
      notifyAll();
    } catch (InterruptedException e) {
      System.out.println("Thread interrupted.");
    }
  }
  
public synchronized char delete() {
  try {
    while (BufferSize == 0) {
      Thread t = Thread.currentThread();
        System.out.println("Thread: " + t.getName() + " (" + t.getId() + ") going to wait in bounded buffer...");
      wait();
    }
    char ch = store[BufferStart];
    BufferStart = (BufferStart + 1) % MaxBuffSize;
    BufferSize--;
    Thread t2 = Thread.currentThread();
    System.out.println("Consumed character: " + ch + " by "+t2.getName());
    notifyAll();
    return ch;
  } catch (InterruptedException e) {
      System.out.println("Thread interrupted.");
      return '%';
    }
  }
}