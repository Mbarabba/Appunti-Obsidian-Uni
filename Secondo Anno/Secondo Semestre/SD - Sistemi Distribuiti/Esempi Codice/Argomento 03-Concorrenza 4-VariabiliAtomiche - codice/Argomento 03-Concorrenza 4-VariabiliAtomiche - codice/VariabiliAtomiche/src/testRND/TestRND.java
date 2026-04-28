package testRND;

import java.text.DecimalFormat;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import pseudoRandom.AtomicPseudoRandom;
import pseudoRandom.IPseudoRandom;
import pseudoRandom.ReentrantLockPseudoRandom;

public class TestRND {
	
	private class myRunnable implements Runnable{
	    private IPseudoRandom pr;
		private CountDownLatch startSignal;
		private CountDownLatch stopSignal; 
		public int counter = 0;
		public myRunnable(IPseudoRandom pseudo, CountDownLatch s, CountDownLatch e){
			this.pr = pseudo;
			this.startSignal= s;
			this.stopSignal = e;
		}
		
		@Override
		public void run() {
			try {
				startSignal.await();
			} catch (InterruptedException e) {
			}
			while (!Thread.interrupted()) {
				pr.nextInt(100);
				cpuIntensiveOperation();
				++counter;
			}
			stopSignal.countDown();
		}
	};

	
	
	private static Long total = 0L;
	public static void main(String[] args) throws InterruptedException {
		TestRND test = new TestRND();
		System.out.println("Esperimento AtomicPseudoRandom");
		int NumRepetition = 10;
		test.longExperiment(2, NumRepetition, new AtomicPseudoRandom(0));
		test.longExperiment(4, NumRepetition, new AtomicPseudoRandom(0));
		test.longExperiment(8, NumRepetition, new AtomicPseudoRandom(0));
		test.longExperiment(16, NumRepetition, new AtomicPseudoRandom(0));
		//test.longExperiment(32, NumRepetition, new AtomicPseudoRandom(0));
		//test.longExperiment(64, NumRepetition, new AtomicPseudoRandom(0));
		System.out.println("Esperimento LockPseudoRandom");
		test.longExperiment(2, NumRepetition, new ReentrantLockPseudoRandom(0));
		test.longExperiment(4, NumRepetition, new ReentrantLockPseudoRandom(0));
		test.longExperiment(8, NumRepetition, new ReentrantLockPseudoRandom(0));
		test.longExperiment(16, NumRepetition, new ReentrantLockPseudoRandom(0));
		//test.longExperiment(32, NumRepetition, new ReentrantLockPseudoRandom(0));
		//test.longExperiment(64, NumRepetition, new ReentrantLockPseudoRandom(0));
	}
		

	
	private void longExperiment(int numThreads, int numRepetitions, IPseudoRandom pseudoRND){
		long somma =0L;
		
		for (int i = 0; i < numRepetitions; i++) {
			if((i+1)%10 ==0) System.out.print(i+1+" ");
			try {
				somma+=	experiment(numThreads,pseudoRND);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		DecimalFormat decimalFormat = new DecimalFormat("#,###");

		System.out.println("throughput "+numThreads+" thread: "+decimalFormat.format(Math.round(somma/numRepetitions)));
	}
	
	
	private long experiment(int pSize, IPseudoRandom pseudoRND) throws InterruptedException {
		//final IPseudoRandom pr = pseudoRND;
		final ExecutorService executor = Executors.newCachedThreadPool();
		final CountDownLatch startSignal = new CountDownLatch(1);
		final CountDownLatch stopSignal = new CountDownLatch(pSize);
		myRunnable[] ARNB = new myRunnable[pSize];
		
		
		for (int i = 0; i < pSize; i++) {
			ARNB[i] = new myRunnable(pseudoRND, startSignal, stopSignal);
			executor.execute(ARNB[i]);
		}
		startSignal.countDown();
		Thread.sleep(500);
		executor.shutdownNow();
		stopSignal.await();
		//System.out.println(total);
		total=0L;
		for (int i = 0; i < ARNB.length; i++) {
			total+=ARNB[i].counter;
		}
		return total;
	}
	
	private static void cpuIntensiveOperation(){
		double a = 0L;
		for (int i = 0; i < 1; i++) {
			a = a+Math.tan(i+1);
		}
	}
		
}





