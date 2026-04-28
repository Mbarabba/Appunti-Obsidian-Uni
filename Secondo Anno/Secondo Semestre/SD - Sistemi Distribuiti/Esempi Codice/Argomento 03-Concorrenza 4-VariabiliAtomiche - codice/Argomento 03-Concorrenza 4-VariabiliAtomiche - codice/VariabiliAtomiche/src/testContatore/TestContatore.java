package testContatore;

import contatore.ContatoreAtomico;
import contatore.ContatoreSincronizzato;

public class TestContatore {
	static int nThreads = 4;
	static int nIncrementi = 2000000;
	static int numRepetitions = 10;
	
	public static void main(String[] args) throws InterruptedException {
		MultiThreadTestIncremento test = new MultiThreadTestIncremento(nThreads, nIncrementi);
		System.out.println("Esperimento 1- Contatore sincronizzato");
		long somma = 0;
		System.out.print("Ripetizioni ");
		for(int i=0; i<numRepetitions;i++){
			if(i%10 ==0) System.out.print(i+" ");
			somma += test.eseguiTestTime(new ContatoreSincronizzato());}
		long mediaSync = somma/numRepetitions;
		System.out.println("Tempo medio = "+ somma/numRepetitions);
		
		System.out.println("Esperimento 2- Contatore atomico");
		somma = 0;
		System.out.print("Ripetizioni ");
		for(int i=0; i<numRepetitions;i++){
			if(i%10 ==0) System.out.print(i+" ");
			somma += test.eseguiTestTime(new ContatoreAtomico());}
		long mediaAtomico = somma/numRepetitions;
		System.out.println("Tempo medio = "+ somma/numRepetitions);
		
		double accelerazione = (mediaSync-mediaAtomico)*100/mediaAtomico;
		System.out.println("Accelerazione ottenuta : "+accelerazione+"%");
		
		
		
	}


	
}
