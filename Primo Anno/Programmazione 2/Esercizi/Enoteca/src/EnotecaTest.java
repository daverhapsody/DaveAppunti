import junit.framework.TestCase;
public class EnotecaTest extends TestCase {

	public void testTrovaPiuCara(){
		Enoteca enoteca = new Enoteca("Vino vino");
		try {
			enoteca.aggiungiBottiglia(new BottigliaDiVino(3));
			enoteca.aggiungiBottiglia(new BottigliaDiVino(2));
			enoteca.aggiungiBottiglia(new BottigliaDiVino(3));
			enoteca.aggiungiBottiglia(new BottigliaDiVinoDoc(3));
			enoteca.aggiungiBottiglia(new BottigliaDiVinoDoc(2));
			
			assertEquals(3, enoteca.trovaPiuCara().getCapienza());
			
		} catch(BottigliaDiVinoException e) {
			fail();
		}
	}
}
