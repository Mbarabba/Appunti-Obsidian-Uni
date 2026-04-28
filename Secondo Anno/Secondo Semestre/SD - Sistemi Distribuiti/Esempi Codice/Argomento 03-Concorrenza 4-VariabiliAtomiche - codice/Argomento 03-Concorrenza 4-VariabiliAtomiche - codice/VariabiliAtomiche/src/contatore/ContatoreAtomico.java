package contatore;

import java.util.concurrent.atomic.AtomicInteger;

public class ContatoreAtomico implements IContatore {
    private AtomicInteger c = new AtomicInteger(0);

   public void incremento() {
        c.incrementAndGet();
    }

    public void decremento() {
        c.decrementAndGet();
    }

    public int value() {
        return c.get();
    }

}
