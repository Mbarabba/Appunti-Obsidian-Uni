package contatore;

public class ContatoreSincronizzato implements IContatore {
    private int c = 0;

    public synchronized void incremento() {
        c++;
    }

    public synchronized void decremento() {
        c--;
    }

    public synchronized int value() {
        return c;
    }

}