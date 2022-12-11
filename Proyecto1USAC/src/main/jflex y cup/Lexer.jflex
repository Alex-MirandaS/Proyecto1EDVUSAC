package Proyecto;
import Compilador.Token;
import Compilador.TokenConstants;
%%

%{

    // Max size of string constants
    static int MAX_STR_CONST = 1025;

    // For assembling string constants
    StringBuffer string = new StringBuffer();
    

    private int curr_lineno = 1;
    int get_curr_lineno() {
	return curr_lineno;
    }
/*
    private AbstractSymbol filename;

    void set_filename(String fname) {
	filename = AbstractTable.stringtable.addString(fname);
    }

    AbstractSymbol curr_filename() {
	return filename;
    }*/
%}

%init{

%init}

%eofval{

/*
    switch(zzLexicalState) {
        case YYINITIAL:
-        //nada
        break;
    }
    return new Symbol(TokenConstants.EOF);
*/

return new Token(TokenConstants.EOF, 0,0,null);
%eofval}

%class Lexer
%line
%column
%state STRING
%standalone
%type Token

//VALORES PRIMITIVOS 

DIG = [0-9]
LETRA = [a-zA-Z]
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace = {LineTerminator} | [ \t\f]

//CARACTERES

MAS = "+"
DIV = "/"
MEN = "-"
MULT = "*"
ASIG = "="
IGUAL = "=="
DESIG = "!="
MENORQ = "<"
MENORI = "<="
MAYORQ = ">"
MAYORI = ">="
PUNTO = "."
COMA = ","
PYCOMA = ";"
DOSPUNTOS = ":"
PARAB = "("
PARCER = ")"
LLAB ="{"
LLCER = "}"
AND = "&&"
OR = "||"
NOT = "!"
GBAJO = "_"
COMS = "'"

/*KEYWORDS*/
//TIPOS DE DATOS
INT = (("i")("n")("t"))
DOUBLE = (("d")("o")("u")("b")("l")("e"))
CHAR = (("c")("h")("a")("r"))
BOOL = (("b")("o")("o")("l"))
STRING = (("s")("t")("r")("i")("n")("g"))
//PALABRAS RESERVADAS
VOID = (("v")("o")("i")("d"))
MAIN = (("m")("a")("i")("n"))
DEF = (("d")("e")("f")("a")("u")("l")("t"))
BRK = (("b")("r")("e")("a")("k"))
RTRN = (("r")("e")("t")("u")("r")("n"))
CONT = (("c")("o")("n")("t")("i")("n")("u")("e"))
CNSL = (("C")("o")("n")("s")("o")("l")("e"))
WRTE = (("W")("r")("i")("t")("e"))

//ESTRUCTURAS DE CONTROL
ELSE = (("e")("l")("s")("e"))
IF = (("i")("f"))
SWT = (("s")("w")("i")("t")("c")("h"))
CASE = (("c")("a")("s")("e"))
FOR = (("f")("o")("r"))
WHILE = (("w")("h")("i")("l")("e"))
DO = (("d")("o"))

//POSIBLES
NEW = (("n"|"N")("e"|"E")("w"|"W"))
TRUE = (("t")("r")("u")("e"))
FALSE = (("f")("a")("l")("s")("e"))

//ESTRUCTURAS LEXICAS

COMENTM   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
COMENTS = "//" {InputCharacter}* {LineTerminator}?
DECD = {DIG}+{PUNTO}{DIG}+
ENTD = {DIG}+
CHARACD = {COMS}{LETRA}{COMS}
BOOLEAD = ({TRUE}|{FALSE})
ID = {LETRA}({LETRA}|{DIG}|{GBAJO})*
%%
{COMENTS}                           {/*ignore*/}
{COMENTM}                           {/*ignore*/}
{MAS} {return new Token(TokenConstants.MAS, yyline+1, yycolumn+1, yytext());}
{DIV} {return new Token(TokenConstants.DIV, yyline+1, yycolumn+1, yytext());}
{MEN} {return new Token(TokenConstants.MEN, yyline+1, yycolumn+1, yytext());}
{MULT} {return new Token(TokenConstants.MULT, yyline+1, yycolumn+1, yytext());}
{ASIG} {return new Token(TokenConstants.ASIG, yyline+1, yycolumn+1, yytext());}
{IGUAL} {return new Token(TokenConstants.IGUAL, yyline+1, yycolumn+1, yytext());}
{DESIG} {return new Token(TokenConstants.DESIG, yyline+1, yycolumn+1, yytext());}
{MENORQ} {return new Token(TokenConstants.MENORQ, yyline+1, yycolumn+1, yytext());}
{MENORI} {return new Token(TokenConstants.MENORI, yyline+1, yycolumn+1, yytext());}
{MAYORQ} {return new Token(TokenConstants.MAYORQ, yyline+1, yycolumn+1, yytext());}
{MAYORI} {return new Token(TokenConstants.MAYORI, yyline+1, yycolumn+1, yytext());}
{PUNTO} {return new Token(TokenConstants.PUNTO, yyline+1, yycolumn+1, yytext());}
{COMA} {return new Token(TokenConstants.COMA, yyline+1, yycolumn+1, yytext());}
{PYCOMA} {return new Token(TokenConstants.PYCOMA, yyline+1, yycolumn+1, yytext());}
{DOSPUNTOS} {return new Token(TokenConstants.DOSPUNTOS, yyline+1, yycolumn+1, yytext());}
{PARAB} {return new Token(TokenConstants.PARAB, yyline+1, yycolumn+1, yytext());}
{PARCER} {return new Token(TokenConstants.PARCER, yyline+1, yycolumn+1, yytext());}
{LLAB} {return new Token(TokenConstants.LLAB, yyline+1, yycolumn+1, yytext());}
{LLCER} {return new Token(TokenConstants.LLCER, yyline+1, yycolumn+1, yytext());}
{AND} {return new Token(TokenConstants.AND, yyline+1, yycolumn+1, yytext());}
{OR} {return new Token(TokenConstants.OR, yyline+1, yycolumn+1, yytext());}
{NOT} {return new Token(TokenConstants.NOT, yyline+1, yycolumn+1, yytext());}
{INT} {return new Token(TokenConstants.INT, yyline+1, yycolumn+1, yytext());}
{DOUBLE} {return new Token(TokenConstants.DOUBLE, yyline+1, yycolumn+1, yytext());}
{CHAR} {return new Token(TokenConstants.CHAR, yyline+1, yycolumn+1, yytext());}
{BOOL} {return new Token(TokenConstants.BOOL, yyline+1, yycolumn+1, yytext());}
{STRING} {return new Token(TokenConstants.STRING, yyline+1, yycolumn+1, yytext());}
{VOID} {return new Token(TokenConstants.VOID, yyline+1, yycolumn+1, yytext());}
{MAIN} {return new Token(TokenConstants.MAIN, yyline+1, yycolumn+1, yytext());}
{DEF} {return new Token(TokenConstants.DEF, yyline+1, yycolumn+1, yytext());}
{BRK} {return new Token(TokenConstants.BRK, yyline+1, yycolumn+1, yytext());}
{RTRN} {return new Token(TokenConstants.RTRN, yyline+1, yycolumn+1, yytext());}
{CONT} {return new Token(TokenConstants.CONT, yyline+1, yycolumn+1, yytext());}
{CNSL} {return new Token(TokenConstants.CNSL, yyline+1, yycolumn+1, yytext());}
{WRTE} {return new Token(TokenConstants.WRTE, yyline+1, yycolumn+1, yytext());}
{ELSE} {return new Token(TokenConstants.ELSE, yyline+1, yycolumn+1, yytext());}
{IF} {return new Token(TokenConstants.IF, yyline+1, yycolumn+1, yytext());}
{SWT} {return new Token(TokenConstants.SWT, yyline+1, yycolumn+1, yytext());}
{CASE} {return new Token(TokenConstants.CASE, yyline+1, yycolumn+1, yytext());}
{FOR} {return new Token(TokenConstants.FOR, yyline+1, yycolumn+1, yytext());}
{WHILE} {return new Token(TokenConstants.WHILE, yyline+1, yycolumn+1, yytext());}
{DO} {return new Token(TokenConstants.DO, yyline+1, yycolumn+1, yytext());}
{NEW} {return new Token(TokenConstants.NEW, yyline+1, yycolumn+1, yytext());}
{DECD} {return new Token(TokenConstants.DECD, yyline+1, yycolumn+1, yytext());}
{ENTD} {return new Token(TokenConstants.ENTD, yyline+1, yycolumn+1, yytext());}
{CHARACD} {return new Token(TokenConstants.CHARACD, yyline+1, yycolumn+1, yytext());}
{BOOLEAD} {return new Token(TokenConstants.BOOLEAD, yyline+1, yycolumn+1, yytext());}
{ID} {return new Token(TokenConstants.ID, yyline+1, yycolumn+1, yytext());}
<STRING> {
      \"                             { yybegin(YYINITIAL);
      System.out.println(string);
      return new Token(TokenConstants.STRINGD, yyline+1, yycolumn+1, yytext());
                                 }
      [^\n\r\"\\]+                   { string.append( yytext() ); }
      \\t                            { string.append('\t'); }
      \\n                            { string.append('\n'); }

      \\r                            { string.append('\r'); }
      \\\"                           { string.append('\"'); }
      \\                             { string.append('\\'); }
}
<YYINITIAL>{
\" {string.setLength(0);yybegin(STRING);}
}
/*
<YYINITIAL>                   { System.err.println("LEXER BUG - UNMATCHED: " + yytext); 
                                return new Token(TokenConstants.ERROR, yyline, yycolumn,  yytext()); 
} */  
[^] {trow new java.io.IOException("ESTO ES UN ERROR: "+yytext())}