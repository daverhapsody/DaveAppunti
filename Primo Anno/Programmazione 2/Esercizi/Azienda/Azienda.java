public class Azienda extends Dave{
  public String nome;
  public Dipendente [] dipendenti;
  public String toString(){
    return nome;
  }
  public double calcolaCosto(){
    if(dipendenti==null) return 0;
    double totale = 0;
    for (int i=0;i<dipendenti.length;i++) {
      if(dipendenti[i]!= null){
        totale = totale + dipendenti[i].costo;
      }
    }
    return totale;
  }

  public boolean assumi(Dipendente nuovoDip){
    if(dipendenti == null) return false;
    if(nuovoDip == null) return false;
    for (int i=0;i<dipendenti.length;i++) {
      if(dipendenti[i] != null){
        dipendenti[i].costo = nuovoDip.costo;
        return true;
      }
    }
    return false;
  }
  public boolean assumi(String nome, double costo, int matricola){
    Dipendente nd  = new Dipendente();
    nd.nome = nome;
    nd.costo = costo;
    nd.matricola = matricola;
    return assumi(nd);
  }

  public Dipendente licenzia (int matricola){
    if(dipendenti == null) return null;
    for (int i = 0;i<dipendenti.length;i++) {
      if (dipendenti[i] != null && dipendenti[i].matricola == matricola){
        Dipendente d = dipendenti[i];
        dipendenti[i] = null;
        return d;
      }
    }
    return null;
  }
}
