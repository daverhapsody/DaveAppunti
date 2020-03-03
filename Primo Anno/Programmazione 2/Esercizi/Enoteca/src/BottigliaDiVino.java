
public class BottigliaDiVino {
	public final int costoBottigliaAlLitro = 10;
	private int capienza;
	
	public BottigliaDiVino(int capienza) throws BottigliaDiVinoException{
		if(capienza<=0 || capienza>=5) throw new BottigliaDiVinoException();
		this.capienza = capienza;
	}
	
	public int calcolaPrezzo() {
		return capienza*costoBottigliaAlLitro;
	}
	
	public int getCapienza() {
		return this.capienza;
	}

	@Override
	public String toString() {
		return "BottigliaDiVino [costoBottigliaAlLitro=" + costoBottigliaAlLitro + ", capienza=" + capienza + "]";
	}
	
	
}
