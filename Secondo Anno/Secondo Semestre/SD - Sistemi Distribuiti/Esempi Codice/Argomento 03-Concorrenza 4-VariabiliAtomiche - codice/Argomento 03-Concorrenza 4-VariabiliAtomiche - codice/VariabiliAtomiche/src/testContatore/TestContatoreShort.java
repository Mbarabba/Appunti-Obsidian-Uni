package testContatore;

import contatore.ContatoreAtomico;
import contatore.ContatoreNonSincronizzato;
import contatore.ContatoreSincronizzato;

public class TestContatoreShort {
	
	static int nThreads = 4;
	static int nIncrementi = 1000000;
	
	public static void main(String[] args) throws InterruptedException {
		System.out.println("Esperimento 1: single thread");
		SingleThreadTestIncremento test1 = new SingleThreadTestIncremento( nIncrementi*nThreads);
		System.out.println("Prova 1: incremento del contatore non sincronizzato");
		test1.eseguiTest(new ContatoreNonSincronizzato());
		System.out.println("Prova 2: incremento del contatore sincronizzato");
		test1.eseguiTest(new ContatoreSincronizzato());
		System.out.println("Prova 3: incremento del contatore atomico");
		test1.eseguiTest(new ContatoreAtomico());
		
		System.out.println("Esperimento 1: multi-thread");
		MultiThreadTestIncremento test = new MultiThreadTestIncremento(nThreads, nIncrementi);
		System.out.println("Prova 1: incremento del contatore non sincronizzato");
		test.eseguiTest(new ContatoreNonSincronizzato());
		System.out.println("Prova 2: incremento del contatore sincronizzato");
		test.eseguiTest(new ContatoreSincronizzato());
		System.out.println("Prova 3: incremento del contatore atomico");
		test.eseguiTest(new ContatoreAtomico());
		

		
		
	}

}
