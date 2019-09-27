
public class BottigliaDiVinoDoc extends BottigliaDiVino{
	private final int incremento = 2;
	public BottigliaDiVinoDoc(int capienza) throws BottigliaDiVinoException {
		super(capienza);
	}
	@Override
	public String toString() {
		return super.toString()+"BottigliaDiVinoDoc [incremento=" + incremento + "]";
	}
	@Override
	public int calcolaPrezzo() {
		return super.calcolaPrezzo()+incremento;
	}
}
