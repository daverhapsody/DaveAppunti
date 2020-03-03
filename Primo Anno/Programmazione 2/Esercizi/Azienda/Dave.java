import java.util.Scanner;
import java.util.Arrays;
public class Dave extends Thread{
  //Operazioni matematiche
  public static void stampa(Object obj){
    System.out.print(obj.toString());
  }
  //-----------------------------------------------\\
  public static void separatore(){
    stampaACapo("*-------------------------------*");
  }
  //-----------------------------------------------\\
  public static void stampaACapo(Object obj){
    System.out.println(obj.toString());
  }
  //-----------------------------------------------\\
  public static double somma(double a, double b){
    return a+b;
  }
  //-----------------------------------------------\\
  public static double prodotto(double a, double b){
    return (a*b);
  }
  //-----------------------------------------------\\
  public static double quoziente(double a, double b){
    if(b==0) {stampa("Errore, divisione per 0"); return 0;}
    else return a/b;
  }
  public static int somma(int a, int b){
    return a+b;
  }
  //-----------------------------------------------\\
  public static int prodotto(int a, int b){
    return (a*b);
  }
  //-----------------------------------------------\\
  public static double quoziente(int a, int b){
    if(b==0) {stampa("Errore, divisione per 0"); return 0;}
    else return a/b;
  }
  //-----------------------------------------------\\
  public static double media(double somma, double numeroElementi){
    return quoziente(somma, numeroElementi);
  }
  //-----------------------------------------------\\
  public static double potenza(double base, int esponente){
    double ris = 1;
    for (int i = 0;i<valoreAssoluto(esponente);i++ ) {
      ris = prodotto(base,ris);
    }
    if(esponente>0) return ris;
    else return 1/ris;
  }
  //-----------------------------------------------\\
  public static int potenza(int base, int esponente){
    int ris = 1;
    for (int i = 0;i<valoreAssoluto(esponente);i++ ) {
      ris = prodotto(base,ris);
    }
    if(esponente>0) return ris;
    else return 1/ris;
  }
  //-----------------------------------------------\\
  public static Double random (int quanto){
    return arrotonda(((int)((Math.random()*100*quanto))+1)*0.01,2);
  }
  //-----------------------------------------------\\
  public static int randomInt(int quanto){
    return (int)(Math.random()*quanto);
  }
  //-----------------------------------------------\\
  public static boolean randomBoolean(){
    int a = randomInt(2);
    while(a==2) a = randomInt(2);
    if(a == 0) return false;
    if(a == 1) return true;
    return true;
  }
  //-----------------------------------------------\\
  public static double valoreAssoluto(double x){
    if(x>=0) return x;
    else return prodotto(x,-1);
  }
  //-----------------------------------------------\\
  public static double arrotonda(double x, int nCifre){
    int base100 = (int)potenza(10,(nCifre+1));
    int intero = (int)(x*base100);
    if(intero%10>=5) intero = intero+10;
    intero = intero/10;
    intero = intero*10;
    return (double)intero/(double)base100;
  }
  //-----------------------------------------------\\
  public static int fattoriale(int n){
    int ris = 1;
    for(int i=n;i>0;i--){
      ris = ris*i;
    }
    return ris;
  }
  //-----------------------------------------------\\
  //Acquisizioni di dati
  public static double acquisisciDouble(){
    return new Scanner(System.in).nextDouble();
  }
  //-----------------------------------------------\\
  public static int acquisisciInt(){
    return new Scanner(System.in).nextInt();
  }
  //-----------------------------------------------\\
  public static char acquisisciCarattere(){
    return new Scanner(System.in).next().charAt(0);
  }
  //-----------------------------------------------\\
  public static String acquisisciString(){
    return new Scanner(System.in).nextLine();
  }
  //-----------------------------------------------\\
  public static long acquisisciLong(){
    return new Scanner(System.in).nextLong();
  }
  //-----------------------------------------------\\
  //Operatori di confronto
  public static boolean MaggioreDi(int a, int b){
    if(a>b) return true;
    else return false;
  }
  //-----------------------------------------------\\
  public static boolean MaggioreDi(double a, double b){
    if(a>b) return true;
    else return false;
  }
  //-----------------------------------------------\\
  //Operazioni sulle stringhe
  public static String concatenaString(String a, String b){
    return a+b;
  }
  //-----------------------------------------------\\
  public static int contaVocali(String str){
    int sum = 0;
    for(int i=0; i<str.length();i++){
      if (vocale(str.charAt(i))) sum++;
    }
    return sum;
  }
  //-----------------------------------------------\\
  public static boolean vocale(char l){
    switch(l){
      case 'a': {return true;}
      case 'e': {return true;}
      case 'i': {return true;}
      case 'o': {return true;}
      case 'u': {return true;}
      case 'A': {return true;}
      case 'E': {return true;}
      case 'I': {return true;}
      case 'O': {return true;}
      case 'U': {return true;}
      default: return false;
    }
  }
  //-----------------------------------------------\\
  public static boolean numero(char c){
    if(c>='0' && c<='9') return true;
    else return false;
  }
  //-----------------------------------------------\\
  //Array ed Operazioni
  public static double mediaArray(double [] vet){
    double sum = sommaArray(vet);
    return media(sum,vet.length);
  }
  //-----------------------------------------------\\
  public static double mediaArray(int [] vet){
    double sum = sommaArray(vet);
    return media(sum,vet.length);
  }
  //-----------------------------------------------\\
  public static double sommaArray(double [] vet){
    int length = vet.length;
    double sum = 0;
    for (int i=0;i<length;i++) {
      sum = sum + vet[i];
    }
    return sum;
  }
  //-----------------------------------------------\\
  public static int sommaArray(int [] vet){
    int length = vet.length;
    int sum = 0;
    for (int i=0;i<length;i++) {
      sum = sum + vet[i];
    }
    return sum;
  }
  //-----------------------------------------------\\
  public static void riempiArrayRandom(double [] vet, int maxValore){
    int length = vet.length;
    for (int i=0;i<length;i++) {
      vet[i] = random(maxValore);
    }
  }
  //-----------------------------------------------\\
  public static void riempiArrayRandom(int [] vet, int maxValore){
    int length = vet.length;
    for (int i=0;i<length;i++) {
      vet[i] = randomInt(maxValore);
    }
  }
  //-----------------------------------------------\\
  public static void riempiArrayRandom(int [] vet, int [] vet1, int maxValore){
    int length = vet.length, a;
    for (int i=0;i<length;i++) {
      a = randomInt(maxValore);
      vet[i] = a;
      vet1[i] = a;
    }
  }
  //-----------------------------------------------\\
  public static void stampaArray(double [] vet){
    int length = vet.length;
    separatore();
    for (int i=0;i<length;i++) {
      stampa("Posizione ["+i+"] = "+vet[i]+"\n");
    }
    separatore();
  }
  //-----------------------------------------------\\
  public static void stampaArray(int [] vet){
    int length = vet.length;
    separatore();
    for (int i=0;i<length;i++) {
      stampa("Posizione ["+i+"] = "+vet[i]+"\n");
    }
    separatore();
  }
  //-----------------------------------------------\\
  public static void stampaArray(char [] vet){
    stampa("\n");
    for (int i=0;i<vet.length;i++) {
      stampa(vet[i]);
    }
  }
  /** Dato un vettore A di interi, verifica quanti valori son seguiti dal proprio
  * successore
  * Base:
  */
  public static int verificaSuccessori(int []vet, int p){
    if(p>=vet.length-1) return 0;
    else if(vet[p+1]==vet[p]+1) return 1+verificaSuccessori(vet,p+1);
    else return verificaSuccessori(vet,p+1);
  }
  //-----------------------------------------------\\
  public static void infoArray(double [] vet){
    stampaArray(vet);
    stampa("Somma dell'array: "+ arrotonda(sommaArray(vet),2)+"\n");
    stampa("Media dell'array: "+ arrotonda(mediaArray(vet),2)+"\n");
    stampa("Valore minimo: "+ calcolaMinimo(vet)+"\n");
    stampa("Valore massimo: "+ calcolaMassimo(vet)+"\n");
    separatore();
  }
  //-----------------------------------------------\\
  public static void infoArray(int [] vet){
    stampaArray(vet);
    stampa("Somma dell'array: "+ sommaArray(vet)+"\n");
    stampa("Media dell'array: "+ arrotonda(mediaArray(vet),2)+"\n");
    stampa("Valore minimo: "+ calcolaMinimo(vet)+"\n");
    stampa("Valore massimo: "+ calcolaMassimo(vet)+"\n");
    separatore();
  }
  //-----------------------------------------------\\
  public static double calcolaMassimo(double [] vet){
    double max = 0;
    for (int i=0;i<vet.length;i++) {
      if (MaggioreDi(vet[i],max)) max = vet[i];
    }
    return max;
  }
  //-----------------------------------------------\\
  public static double calcolaMinimo(double [] vet){
    double min = calcolaMassimo(vet);
    for (int i=0;i<vet.length;i++) {
      if (!MaggioreDi(vet[i],min)) min = vet[i];
    }
    return min;
  }
  //-----------------------------------------------\\
  public static int calcolaMassimo(int [] vet){
    int max = 0;
    for (int i=0;i<vet.length;i++) {
      if (MaggioreDi(vet[i],max)) max = vet[i];
    }
    return max;
  }
  //-----------------------------------------------\\
  public static int calcolaMinimo(int [] vet){
    int min = calcolaMassimo(vet);
    for (int i=0;i<vet.length;i++) {
      if (!MaggioreDi(vet[i],min)) min = vet[i];
    }
    return min;
  }
  //-----------------------------------------------\\
  public static double [] creaArrayDouble(int dimensione){
    return new double[dimensione];
  }
  //-----------------------------------------------\\
  public static int [] creaArrayInt(int dimensione){
    return new int[dimensione];
  }
  //-----------------------------------------------\\
  public static char [] creaArrayChar(int dimensione){
    return new char[dimensione];
  }
  //-----------------------------------------------\\
  public static String [] creaArrayString(int dimensione){
    return new String[dimensione];
  }
  //-----------------------------------------------\\
  public static char [] interoInArrayChar(int valore){
    String inStringa = Integer.toString(valore);
    char vet [] = creaArrayChar(inStringa.length());
    for (int i=0;i<inStringa.length();i++) {
      vet[i] = inStringa.charAt(i);
    }
    return vet;
  }
  //-----------------------------------------------\\
  public static int arrayCharInInt(char [] vet){
    int n = 0;
    for (int i=vet.length-1;i>0;i--) {
      n = (int)somma(potenza(10,i),n);
    }
    return n;
  }
  //-----------------------------------------------\\
  public static void ordinaArrayDouble(double []vet){
    Arrays.sort(vet);
  }
  //-----------------------------------------------\\
  public static boolean [] creaArrayBoolean(int dimensione){
    return new boolean[dimensione];
  }
  //-----------------------------------------------\\
  public static void infoArrayBoolean(boolean [] vet){
    int lunghezza = vet.length;
    int vere = contaVere(vet);
    int nonVere = lunghezza - vere;
    for (int i=0;i<lunghezza;i++) {
      stampaACapo("V["+ i+"]:\t"+vet[i]);
    }
    stampaACapo("Numero di verita: "+vere);
    stampaACapo("Numero di falsita': "+nonVere);
    if(vere == lunghezza) stampaACapo("Tautologia");
    else if(nonVere == lunghezza) stampaACapo("Contraddizione");
    else stampaACapo("Forma soddisfacibile non tautologica");
  }
  //-----------------------------------------------\\
  public static void riempiArrayBoolean(boolean [] vet){
    for (int i=0;i<vet.length;i++) {
      vet[i] = randomBoolean();
    }
  }
  //-----------------------------------------------\\
  public static int ricercaOccorrenze(double []v1, double []v2){
    boolean trovato = false;
    int n = 0;
    int occorrenze = 0;
    for(int i = 0; i<v2.length; i++){
      trovato = false;
      while(!trovato&&n<v1.length){
        if (v1[n] == v2[i]) {trovato = true; occorrenze++; n++;}
        else n++;
      }
    }
    return occorrenze;
  }
  //-----------------------------------------------\\
  public static int contaVere(boolean [] vet){
    int n = 0;
    int i = 0;
    while(i<vet.length){
      if(vet[i]) n++;
      i++;
    }
    return n;
  }
  //-----------------------------------------------\\
  public static int contaFalse(boolean [] vet){
    int n = 0;
    int i = 0;
    while(i<vet.length){
      if(!vet[i]) n++;
      i++;
    }
    return n;
  }
  //-----------------------------------------------\\
  //Conversioni
  //-----------------------------------------------\\
  public static char intInChar(int valore){
    int ris = valore + '0';
    char c = (char) ris;
    return c;
  }
  //-----------------------------------------------\\
  public static int charInInt(char numero){
    return numero - '0';
  }
  //-----------------------------------------------\\
  public static int valoreUnicode(char a){
    return ((int)a);
  }
  //-----------------------------------------------\\
  public static char daIntAUnicode(int a){
    return (char)a;
  }
  //-----------------------------------------------\\
  public static char inMaiuscola(char c){
    int a = (int)c;
    int differenza = 'a' - 'A';
    int ris = a - differenza;
    return (char) ris;
  }
  //-----------------------------------------------\\
  public static char inMinuscola(char c){
    int a = (int)c;
    int differenza = 'a' - 'A';
    int ris = a + differenza;
    return (char) ris;
  }
  //-----------------------------------------------\\
  public static boolean minuscola(char l){
    if(l>='a'&&l<='z') return true;
    else return false;
  }
  //-----------------------------------------------\\
  public static char [] convertiInArrayChar(String str){
    int a = str.length();
    char [] vet = creaArrayChar(a);
    for (int i=0;i<a;i++) {
      vet[i] = str.charAt(i);
    }
    return vet;
  }
  //-----------------------------------------------\\
  public static String arrayCharInString(char[]vet){
    String temp = "";
    for (int i=0;i<vet.length;i++) {
      temp = temp + vet[i];
    }
    return temp;
  }
  //-----------------------------------------------\\
  public static boolean lettera(char l){
    if(l>='a'&&l<='z'||l>='A'&&l<='Z') return true;
    else return false;
  }
  //-----------------------------------------------\\
  public static int stringaNumeriInInt(String s){
    int l = s.length();
    int sum = 0;
    for (int i=0;i<l;i++) {
      if(numero(s.charAt(i)))
      sum = somma(sum, prodotto(potenza(10,l-1-i),charInInt(s.charAt(i))));
    }
    return sum;
  }
  //-----------------------------------------------\\
  //Ricorsive
  public static int fattorialeRicorsivo(int n){
    if(n==1) return 1;
    else return n*fattorialeRicorsivo(n-1);
  }
  //-----------------------------------------------\\
  public static int sommaRicorsiva(int a, int b){
    if(b==0) return a;
    else return sommaRicorsiva(a+1,b-1);
  }
  //-----------------------------------------------\\
  public static int differenzaRicorsiva(int a, int b){
    if(b==0) return a;
    else return differenzaRicorsiva(a-1,b-1);
  }
  //-----------------------------------------------\\
  public static int prodottoRicorsivo(int a, int b){
    if(b==1) return a;
    if(b==0) return 0;
    else return a+prodottoRicorsivo(a,b-1);
  }
  //-----------------------------------------------\\
  public static int potenzaRicorsiva(int base, int esponente){
    if(esponente==0) return 1;
    else return base*potenzaRicorsiva(base, esponente-1);
  }
  //-----------------------------------------------\\
  public static int successore(int n){
    stampa("Successore(");
    if(n == 1) {stampa(0+")"); return 1;}
    return successore(n-1);
  }
  //-----------------------------------------------\\
  public static int fibonacci(int n){
    if(n==1||n==2) return 1;
    else return fibonacci(n-1)+fibonacci(n-2);
  }
  //-----------------------------------------------\\
  public static int massimoComunDivisore(int n,int m){
    if(n>m){
      int c = m;
      m = n;
      n = c;
    }
    if(n==0) return m;
    else return massimoComunDivisore(n,m-n);
  }
  //-----------------------------------------------\\
  public static void valoreCasualeMedio(int ripetizioni){
    int tentativi = 0;
    int ultimo = 0;
    int sum = 0;
    boolean finalmente = false;
    boolean [] vet = creaArrayBoolean(2);
    int r = ripetizioni;
    for(int i = 0; i<r;i++){
      finalmente = false;
      while(!finalmente){
        riempiArrayBoolean(vet);
        if(contaVere(vet) == contaFalse(vet)) finalmente = true;
        else tentativi++;
      }
      sum = sum + tentativi;
      ultimo = tentativi;
      tentativi = 0;
    }
    stampaACapo("Finalmente! L'ultimo dopo "+ultimo+" tentativi.");
    stampaACapo("Tentativi medi dopo 100 ripetizioni: "+media(sum,ripetizioni));
    infoArrayBoolean(vet);
  }
  //-----------------------------------------------\\
  public static double distanza(Punto A, Punto B){
    double t1 = B.getX()-A.getX();
    double t2 = A.getY()-B.getY();
    double distanza;
    t1 = potenza(t1,2);
    t2 = potenza(t2,2);
    distanza = Math.sqrt(somma(t1,t2));
    return distanza;
  }
  //-----------------------------------------------\\
  public static boolean stringaPalindroma(String str, int sx, int dx){
    char []vet = creaArrayChar(str.length());
    if(vet.length==1) return true;
    if(vet[sx] != vet[dx]) {
      return false;
    }
    else if(dx<=sx) return stringaPalindroma(arrayCharInString(vet),sx+1, dx-1);
    else return false;
  }
  //-----------------------------------------------\\
  public static long memoriaUsata(){
    return Runtime.getRuntime().totalMemory()-Runtime.getRuntime().freeMemory();
  }
  //-----------------------------------------------\\
  public static void garbageCollector(){
    System.gc();
  }
  //-----------------------------------------------\\
  public void mergeSort(int [] array, int min, int max) {

    if((max-min)<20) {
      insertionSort(array,min,max);
    } else {
      int medio = (min+max)/2;    // Trovo l' indice per suddividere il vettore
      mergeSort(array,min,medio); // Primo sotto-vettore
      mergeSort(array,medio+1,max); // Secondo sotto-vettore
      merge(array,min,medio,max); // Fondo i due sotto-vettori
    }
  }

  // Questo metodo fonde i due sotto-vettori ordinati, in un unico vettore ordinato
  //-----------------------------------------------\\
  public void merge(int [] array, int min, int med, int max) {
    int [] a = new int[max-min+1];
    int i1 = min;
    int i2 = med+1;
    int i3 = 1;
    for(; ( i1 <= med) && (i2 < max); i3++) {
      if(array[i2]>array[i1]) {
        a[i3] = array[i1]; i1++;
      }
      else {
        a[i3] = array[i2]; i2++;
      }
    }
    for(;i1 <= med; i1++, i3++) a[i3] = array[i1];
    for(;i2 < max; i2++, i3++) a[i3] = array[i2];
    for(i3=1, i1=min; i1 < max; i1++, i3++)
    array[i1] = a[i3];
  }
  //-----------------------------------------------\\
  /** Questo é l' Insertion Sort, che abbiamo giá visto, con uan sola differenza
  ci permette di ordinare una porzione di vettore che va da min a max **/
  public void insertionSort(int [] array, int min, int max) {
    for(int i = min+1; i < max; i++) {
      int x = i;
      int j = i-1;
      for(; j >= min; j--) {
        if(array[j]>array[x]) {
          int k = array[x];
          array[x] = array[j];
          array[j] = k;
          x = j;
        } else break;
      }
    }
  }
  //-----------------------------------------------\\
}
class Punto{
  private int x;
  private int y;
  public String infoPunto;
  public Punto(){
    this(0,0);
  }
  public Punto(int x, int y){
    this.x = x;
    this.y = y;
    this.infoPunto = this.infoPunto();
  }
  public int getX() {
    return x;
  }
  public void setX(int x) {
    this.x = x;
  }
  public int getY() {
    return y;
  }
  public void setY(int y) {
    this.y = y;
  }
  public String infoPunto(){
    return ("("+this.getX()+","+this.getY()+")");
  }
}
