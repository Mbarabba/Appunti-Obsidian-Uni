package testContatore;

import contatore.ContatoreNonSincronizzato;


public class TestContatoreNonSincronizzatoShort {
	static int nThreads = 10;
	static int nIncrementi = 1000000;
	
	public static void main(String[] args) throws InterruptedException {

		
		System.out.println("Esperimento 0: Contatore non sincronizzato 10 thread 10000000 incrementi ");
		MultiThreadTestIncremento test = new MultiThreadTestIncremento(nThreads, nIncrementi);
		test.eseguiTest(new ContatoreNonSincronizzato());
		

		
		
	}

}
