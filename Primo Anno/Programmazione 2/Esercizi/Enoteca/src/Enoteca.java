import java.util.*;
public class Enoteca {
	ArrayList<BottigliaDiVino> vini = new ArrayList<BottigliaDiVino>();
	private String nome;
	public Enoteca(String nome) {
		if(nome != null) 
		this.nome = nome;
	}
	public void aggiungiBottiglia(BottigliaDiVino bottiglia) throws BottigliaDiVinoException {
		if(bottiglia != null) vini.add(bottiglia);
		else throw new BottigliaDiVinoException();
	}
	public BottigliaDiVino trovaPiuCara() {
		int max = 0;
		int t = 0;
		for (int i = 0; i < vini.size(); i++) {
			if(vini.get(i).calcolaPrezzo()>max) {
				max = vini.get(i).calcolaPrezzo();
				t = i-1;
			}
		}
		return(vini.get(t));
	}
}
