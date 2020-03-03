%{
import java.io.*;
%}    
%token NL          // Ritorno a capo
%token <sval> NUM  // Valore e un numero
%token LOG10 LOGE// Definisco il token per i logaritmi

%left LOG10 LOGE

%type <sval> exp  // Non terminale della grammatica

%left '-' '+'
%left '*' '/' '%'
%left NEG          // Negazione
%right '^'         // Esponenziale
      
%%

input:   // Stringa vuota
       | input line
       ;
      
line:    NL      { if (interactive) System.out.print("Espressione: "); }
       | exp NL  {
                  String result = $1.replace(" ","");
                  System.out.print(result);
                 }
       ;
      
exp:     NUM                { $$ = $1; }
       | exp '+' exp        { $$ = $1 + " " + $3 + " +" ; }
       | exp '-' exp        { $$ = $1 + " " + $3 + " -" ; }
       | exp '*' exp        { $$ = $1 + " " + $3 + " *" ; }
       | exp '/' exp        { $$ = $1 + " " + $3 + " /" ; }
       | exp '%' exp        { $$ = $1 + " " + $3 + " %" ; }
       | '-' exp  %prec NEG { $$ = "-"+$2; }
       | exp '^' exp        { $$ = $1+" "+$3+" "+"^"; }
       | '(' exp ')'        { $$ = "("+$2+")"; }
       | LOG10 exp         { $$ = "log10" + $2; } /* Richiamo la funzione del 
                                                      logaritmo ma ragionando in
                                                      base 10 */
       | LOGE exp           { $$ = "log" + $2;   } /* Richiamo la funzione del 
                                                      logaritmo ma ragionando in
                                                      base e */
       ;

%%

  private Yylex lexer;
  private int yylex () {
    int yyl_return = -1;
    try {
      yylval = new ParserVal(0);
      yyl_return = lexer.yylex();
    }
    catch (IOException e) {
      System.err.println("Errore sull'IO :"+e);
    }
    return yyl_return;
  }


  public void yyerror (String error) {
    System.err.println ("Errore: " + error);
  }


  public Parser(Reader r) {
    lexer = new Yylex(r, this);
  }


  static boolean interactive;

  public static void main(String args[]) throws IOException {
    System.out.println("BYACC/Java with JFlex Calculator Demo");

    Parser yyparser;
    if ( args.length > 0 ) {
      yyparser = new Parser(new FileReader(args[0]));
    }
    else {
      System.out.println("[Termina con CTRL-D]");
      System.out.print("Espressione: ");
      interactive = true;
	    yyparser = new Parser(new InputStreamReader(System.in));
    }

    yyparser.yyparse();
    
    if (interactive) {
      System.out.println();
      System.out.println("Have a nice day (cit. Jon Bon Jovi)");
    }
  }
