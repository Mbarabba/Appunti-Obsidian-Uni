package testRND;

import pseudoRandom.AtomicPseudoRandom;
import pseudoRandom.ReentrantLockPseudoRandom;

public class TestRNDShort {
	static ReentrantLockPseudoRandom myRLPR = new ReentrantLockPseudoRandom(10);
	static AtomicPseudoRandom myAPR = new AtomicPseudoRandom(10);

	static final int HOW_LONG_TO_RUN = 1000;
	static final int NUMBER_OF_THREADS = 5;
	
	
	private static class RLPR implements Runnable {
		public int counter=0;
		public boolean intensive= false;
		public void run() {
			while (true) {
				myRLPR.nextInt(100); 
				if (intensive) cpuIntensiveOperation();
				counter++;
			}
		}
	}
	
	private static class APR implements Runnable {
		public int counter=0;
		public boolean intensive = false;
		public void run() {
			while (true) {
				myAPR.nextInt(100); 
				if (intensive) cpuIntensiveOperation();
				counter++;
			}
		}
	}

	public static void main(String[] args) throws InterruptedException {
		System.out.println("Esperimento 2: contesa elevata");
		esperimento2(false);
		System.out.println("Esperimento 2: contesa medio-bassa");
		esperimento2(true);
	}
	private static void esperimento2(boolean intensive) throws InterruptedException {
		long startTime, endTime;
		Thread[] threads;
		int numberGenerated;
		
		RLPR[] rlprs = new RLPR[NUMBER_OF_THREADS];
		threads = new Thread[NUMBER_OF_THREADS];
		numberGenerated = 0;
		startTime = System.currentTimeMillis();
		for (int i=0; i<NUMBER_OF_THREADS; i++) {
			rlprs[i] = new RLPR();
			rlprs[i].intensive = intensive;
			threads[i] = new Thread(rlprs[i]);
		}
		
		for (int i=0; i<NUMBER_OF_THREADS; i++) {
			threads[i].start();
		}
		Thread.sleep(HOW_LONG_TO_RUN);
		for (int i=0; i<NUMBER_OF_THREADS; i++) {
			threads[i].stop(); 
			numberGenerated += rlprs[i].counter;
		}
		endTime = System.currentTimeMillis();
		System.out.println("La versione del generatore che usa il lock ha generato\t\t" + numberGenerated + " numeri random in " + (endTime-startTime) + " ms");


		APR[] aprs = new APR[NUMBER_OF_THREADS];
		threads = new Thread[NUMBER_OF_THREADS];
		numberGenerated = 0;
		startTime = System.currentTimeMillis();
		for (int i=0; i<NUMBER_OF_THREADS; i++) {
			aprs[i] = new APR();
			aprs[i].intensive = intensive;
			threads[i] = new Thread(aprs[i]);
		}
		
		for (int i=0; i<NUMBER_OF_THREADS; i++) {
			threads[i].start();
		}
		Thread.sleep(HOW_LONG_TO_RUN);
		for (int i=0; i<NUMBER_OF_THREADS; i++) {
			threads[i].stop(); //NOTE: Deprecated but used just for a clean way to do some timing tests.
			numberGenerated += aprs[i].counter;
		}
		endTime = System.currentTimeMillis();
		System.out.println("La versione del generatore che non usa il lock ha generato\t" + numberGenerated + " numeri random in " + (endTime-startTime) + " ms");
	}
	private static void cpuIntensiveOperation(){
		double a = 0L;
		for (int i = 0; i < 3; i++) {
			a = a+Math.tan(i+1);
		}
	}

}