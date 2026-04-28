class Main {
  public static void main(String[] args) {
    var res = new SharedRes();
    var t1 = new Thread(new SynchRunnable(res), "T1");
    var t2 = new Thread(new SynchRunnable(res), "T2");
    var t3 = new Thread(new SynchRunnable(res), "T3");
    var t4 = new Thread(new SynchRunnable(res), "T4");
    var t5 = new Thread(new SynchRunnable(res), "T5");
    t1.start();
    t2.start();
    t3.start();
    t4.start();
    t5.start();
  try {
    t1.join();
    t2.join();
    t3.join();
    t4.join();
    t5.join();
  }
  catch(InterruptedException e){}
   System.out.println("Counter: "+ res.getCounter()); 
 }
}