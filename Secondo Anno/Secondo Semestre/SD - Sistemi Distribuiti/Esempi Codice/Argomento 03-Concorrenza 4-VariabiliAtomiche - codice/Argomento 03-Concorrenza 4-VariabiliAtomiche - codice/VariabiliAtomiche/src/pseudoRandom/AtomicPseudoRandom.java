package pseudoRandom;

import java.util.concurrent.atomic.AtomicInteger;

public class AtomicPseudoRandom implements IPseudoRandom{
	private AtomicInteger seed;
	
	public AtomicPseudoRandom(int seed) {
		this.seed = new AtomicInteger(seed);
	}
	@Override
	public int nextInt(int n) {
		while (true) {
			int s = seed.get();
			int nextSeed = calculateNext(s);
			if (seed.compareAndSet(s, nextSeed)) {
				int resto = s % n;
				return resto > 0 ? resto : resto + n;
			}
		}
	}

	// return something simple for demonstration purposes
	private int calculateNext(int s) {
		return s + 1;
	}
}