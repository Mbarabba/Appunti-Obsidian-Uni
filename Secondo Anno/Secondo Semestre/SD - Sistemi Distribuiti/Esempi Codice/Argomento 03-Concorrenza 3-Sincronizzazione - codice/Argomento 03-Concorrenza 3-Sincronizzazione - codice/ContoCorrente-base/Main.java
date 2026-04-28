class ContoCorrente {
  private float saldo;
  
  public ContoCorrente(float saldoIniziale){
    saldo = saldoIniziale;
  }
  
  public void deposito(float cifra){
    float nuovoSaldo = saldo + cifra;
    try{
      // sleep inserito per rendere piu' probabile la race condition
      Thread.sleep(50); 
    }
    catch(InterruptedException e){
      System.out.println("Thread interrupted.");
    }
    saldo = nuovoSaldo;
  }
  
  public void prelievo(float cifra){
    if(saldo > cifra){
      float nuovoSaldo = saldo - cifra;
      try{
        // sleep inserito per rendere piu' probabile la race condition
        Thread.sleep(50);
      }
      catch(InterruptedException e){
        System.out.println("Thread interrupted.");
      }
      saldo = nuovoSaldo;
      return;
    }
    saldo = 0.0f;
    
  }
  
  public float saldo(){
    return saldo;
  }
  
}

class ThreadPreleva extends Thread {
  private ContoCorrente conto; // risorsa condivisa
  private float cifra;
  
  public ThreadPreleva(ContoCorrente conto, float cifra) {
    this.conto = conto;
    this.cifra = cifra;
  }
  
  public void run() {
    conto.prelievo(cifra);
    System.out.println("Effettuato un prelievo di " + cifra);
    System.out.println("Il saldo del conto e' " + conto.saldo());
  }
  
}

class ThreadDeposita extends Thread {
  private ContoCorrente conto; // risorsa condivisa
  private float cifra;
  
  public ThreadDeposita(ContoCorrente conto, float cifra) {
    this.conto = conto;
    this.cifra = cifra;
  }
  
  public void run() {
    conto.deposito(cifra);
    System.out.println("Effettuato un deposito di " + cifra);
    System.out.println("Il saldo del conto e' " + conto.saldo());
  }
}

public class Main {

   public static void main(String args[]) {
     // shared resource: conto
     ContoCorrente conto = new ContoCorrente(10000.0f);
     
     ThreadDeposita t1, t2, t3;
     t1 = new ThreadDeposita(conto, 100.0f);
     t2 = new ThreadDeposita(conto, 150.0f);
     t3 = new ThreadDeposita(conto, 50.0f);
     
     ThreadPreleva t4, t5, t6;
     t4 = new ThreadPreleva(conto, 200.0f);
     t5 = new ThreadPreleva(conto, 50.0f);
     t6 = new ThreadPreleva(conto, 100.0f);
     
     System.out.println("Il saldo iniziale del conto e' " + conto.saldo());
     
     t1.start();
     t2.start();
     t3.start();
     t4.start();
     t5.start();
     t6.start();
     
     // Aspettiamo che tutti i thread abbiano finito
     try {
         t1.join(); 
         t2.join(); 
         t3.join();
         t4.join();
         t5.join();
         t6.join();
       
       // with join the main thread waits untill all other threads terminate
       } catch (InterruptedException e) {}
     System.out.println("\nIl saldo finale del conto è: "+ conto.saldo());
     System.out.println("\nIl saldo finale del conto avrebbe dovuto essere: 9950.0");
   }
}