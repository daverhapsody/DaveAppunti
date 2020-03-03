%%
%byaccj
%{
  private Parser yyparser;
  public Yylex(java.io.Reader r, Parser yyparser) {
    this(r);
    this.yyparser = yyparser;
  }
%}
NUM = [0-9]+ ("." [0-9]+)?
NL  = \n | \r | \r\n
LOG10 = ("log10" | "LOG10")
LOGE = ("ln" | "LN")
%%
// Operatori
"+" | 
"-" | 
"*" | 
"/" | 
"^" | 
"(" | 
")" |
"%"   { return (int) yycharat(0); }
// Logaritmo in base 10
	{LOG10} { 
	return Parser.LOG10; 
	}
// Logaritmo in base e
	{LOGE} { 
	return Parser.LOGE; 
	}
// Ritorno a capo
	{NL}   { 
	return Parser.NL; 
	}
// Numero in virgola mobile
	{NUM}  { 
		yyparser.yylval = new ParserVal(Double.parseDouble(yytext()));
	//Qua io prendo letteralmente la stringa e ci applico 
	//il parsing in double usando l'apposita classe double
         return Parser.NUM; }
// Spazio vuoto
[ \t]+ { }
\b     { System.err.println("Il tasto cancella non funziona, sorry"); }
/* Fallback degli errori */
[^]    { System.err.println("Errore: Carattere NON valido  '"+yytext()+"'"); return -1; }