package testContatore;

import contatore.IContatore;

public class SingleThreadTestIncremento{
	
	private IContatore contatore;
	private int numIncrementi;
	
	
	public SingleThreadTestIncremento(int nIncrementi){
		numIncrementi = nIncrementi;
	}

	public void eseguiTest(IContatore cont) throws InterruptedException{
		contatore = cont; 
		long sTime = System.currentTimeMillis();
		for (int j = 0; j < numIncrementi; j++)
			contatore.incremento();
		
		long fTime = System.currentTimeMillis();

		
		System.out.println("Valore finale del contatore: " + contatore.value()+ "\nValore atteso del contatore: "+numIncrementi);
		System.out.println("Tempo impiegato (in millisecondi):" + (fTime - sTime));
		System.out.println();
	}


}