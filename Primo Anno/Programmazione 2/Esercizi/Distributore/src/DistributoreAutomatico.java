import java.util.ArrayList;
import java.util.Collection;
public class DistributoreAutomatico {

	private ArrayList<Prodotto> prodotti; //= new ArrayList<Prodotto>();
	
	public DistributoreAutomatico(Collection<Prodotto> prodottiIniziali) {
		if(prodottiIniziali != null) 
			prodotti = new ArrayList<Prodotto>(prodottiIniziali);
		
	}
	
	public void incrementaQuantitaProdotto(int pos, int qt) throws PosizioneNonValidaException{
		getProdotto(pos).incrementaQuantita(qt);
	}
	
	public int acquista(int pos, int valore) throws ProdottoNonAcquistabileException, PosizioneNonValidaException{
		Prodotto t = getProdotto(pos);
		/*if(pos >= prodotti.size()) 
			throw new PosizioneNonValidaException();*/
		if(t.getQuantita() == 0) 
			throw new ProdottoNonAcquistabileException("quantita insufficiente");
		if(valore >= t.getPrezzoUnitario()) {
			t.decrementaQuantita(1);
			return valore - t.getPrezzoUnitario();
			}
		else
			throw new ProdottoNonAcquistabileException("valore insufficiente");
			
			
			
	}
	
	public Prodotto getProdotto(int pos) throws PosizioneNonValidaException{
		if(pos >= prodotti.size()||pos < 0)
			throw new PosizioneNonValidaException();
		else
			return prodotti.get(pos);
		
	}
	

}
