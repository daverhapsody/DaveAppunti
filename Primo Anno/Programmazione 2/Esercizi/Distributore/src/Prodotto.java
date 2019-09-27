public abstract class Prodotto {
	private int quantita;
	
	public Prodotto(int quantita) {
		if (quantita < 0) {
			this.quantita = 0;
		}
		else 
			this.quantita = quantita;
	}
	
	public abstract int getPrezzoUnitario();

	public int getQuantita() {
		return quantita;
	}
	public void incrementaQuantita(int quantita) {
		this.quantita += quantita;
	}
	public void decrementaQuantita(int quantita) {
		this.quantita = this.quantita - quantita;
	}

	
}
