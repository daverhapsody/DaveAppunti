public class Dipendente{
  public String nome;
  public double costo;
  public int matricola;

  public Dipendente(){
    this("Nome",0,0);
  }
  public Dipendente(String n, double c, int m){
    nome = n;
    costo = c;
    matricola = m;
  }
  public String toString(){
    String str = ("Nome: "+nome+" "+"\n"+"Costo: "+costo+" "+"\n"+"Matricola: "+matricola);
    return str;
  }
  public boolean Contains(int matricola){
    return true;
  }
  public boolean Contains(Dipendente dip){
    return true;
  }
	public String getNome() {
		return nome;
	}
	private void setNome(String nome) {
		this.nome = nome;
	}
	public double getCosto() {
		return costo;
	}
	private void setCosto(double costo) {
		this.costo = costo;
	}
	public int getMatricola() {
		return matricola;
	}
	private void setMatricola(int matricola) {
		this.matricola = matricola;
  }
}
