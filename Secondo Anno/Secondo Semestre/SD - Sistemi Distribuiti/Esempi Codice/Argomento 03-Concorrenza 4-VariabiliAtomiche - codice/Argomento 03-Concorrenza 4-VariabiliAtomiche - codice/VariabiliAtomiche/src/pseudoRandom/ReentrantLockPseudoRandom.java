package pseudoRandom;

import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class ReentrantLockPseudoRandom implements IPseudoRandom{
	  private final Lock lock = new ReentrantLock(false);  
	  private int seed;  
	  
	  public ReentrantLockPseudoRandom(int seed) {this.seed = seed;}  
	 
	  @Override
	  public int nextInt(int n) {    
	    lock.lock();   
	    try {    
	      int s = seed;  seed = calculateNext(s);  int resto = s % n;    
	      return resto > 0 ? resto : resto + n; 
	   } finally { lock.unlock();}  
	  }
	  
	  // return something simple for demonstration purposes
	  private int  calculateNext (int s) {
		  return s+1;
	  }
}