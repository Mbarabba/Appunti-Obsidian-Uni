package contatore;

public class ContatoreNonSincronizzato implements IContatore {
    private int c = 0;

    public void incremento() {
        c++;
    }

    public void decremento() {
        c--;
    }

    public int value() {
        return c;
    }

}

