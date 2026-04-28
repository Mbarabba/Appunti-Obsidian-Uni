package testContatore;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import contatore.IContatore;

public class MultiThreadTestIncremento{
	
	private IContatore contatore;
	private int numThreads;
	private int numIncrementi;
	
	private class myRunnable implements Runnable{
	    private IContatore contatore;
		private CountDownLatch start;
		private CountDownLatch end; 
		private int numIncrementi;
		public myRunnable(IContatore cont, CountDownLatch s, CountDownLatch e, int incr){
			this.contatore = cont;
			this.start = s;
			this.end = e;
			this.numIncrementi = incr;
		}
		
		@Override
		public void run() {
			try {
				start.await();
			} catch (InterruptedException e) {
			}
			for (int i = 0; i < numIncrementi; i++) {
				contatore.incremento();
			}
			end.countDown();
		}
	}
	
	public MultiThreadTestIncremento(int nThreads,int nIncrementi){
		numThreads = nThreads;
		numIncrementi = nIncrementi;
	}

	public void eseguiTest(IContatore cont) throws InterruptedException{
		contatore = cont; 
		CountDownLatch start = new CountDownLatch(1);
		CountDownLatch end = new CountDownLatch(numThreads);
		//ExecutorService executor = Executors.newFixedThreadPool(numThreads);
		for (int j = 0; j < numThreads; j++)
			(new Thread(new myRunnable(this.contatore, start, end, numIncrementi) )).start();
			//executor.execute(new myRunnable(this.contatore, start, end, numIncrementi));
		
		long sTime = System.currentTimeMillis();
		start.countDown();
		//executor.shutdown();
		end.await();
		long fTime = System.currentTimeMillis();
		System.out.println("Valore finale del contatore: " + contatore.value()+ "\nValore atteso del contatore: "+numIncrementi*numThreads);
		System.out.println("Tempo impiegato (in millisecondi):" + (fTime - sTime));
		System.out.println();
	}

	public long eseguiTestTime(IContatore cont) throws InterruptedException{
		contatore = cont; 
		CountDownLatch start = new CountDownLatch(1);
		CountDownLatch end = new CountDownLatch(numThreads);
		//ExecutorService executor = Executors.newFixedThreadPool(numThreads);
		for (int j = 0; j < numThreads; j++)
			(new Thread(new myRunnable(this.contatore, start, end, numIncrementi) )).start();
			//executor.execute(new myRunnable(this.contatore, start, end, numIncrementi));
		
		long sTime = System.currentTimeMillis();
		start.countDown();
		//executor.shutdown();
		end.await();
		long fTime = System.currentTimeMillis();
		return (fTime - sTime);
	}
	

}