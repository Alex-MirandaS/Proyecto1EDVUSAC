package Proyecto;
import java_cup.runtime.Symbol;
%%

%public
%class Lexer
%cup
%line
%column
%state STRING
%standalone

//DECLARACIONES EN JAVA
%{
//CUP
    StringBuffer string = new StringBuffer();

    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }

    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    
%}

%init{

%init}

%eofval{

    return symbol(ParserSym.EOF);

%eofval}

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
{COMENTS} {return new symbol(ParserSym.COMENTS, yyline+1, yycolumn+1, yytext());}
{COMENTM} {return new symbol(ParserSym.COMENTM, yyline+1, yycolumn+1, yytext());}
{MAS} {return new symbol(ParserSym.MAS, yyline+1, yycolumn+1, yytext());}
{DIV} {return new symbol(ParserSym.DIV, yyline+1, yycolumn+1, yytext());}
{MEN} {return new symbol(ParserSym.MEN, yyline+1, yycolumn+1, yytext());}
{MULT} {return new symbol(ParserSym.MULT, yyline+1, yycolumn+1, yytext());}
{ASIG} {return new symbol(ParserSym.ASIG, yyline+1, yycolumn+1, yytext());}
{IGUAL} {return new symbol(ParserSym.IGUAL, yyline+1, yycolumn+1, yytext());}
{DESIG} {return new symbol(ParserSym.DESIG, yyline+1, yycolumn+1, yytext());}
{MENORQ} {return new symbol(ParserSym.MENORQ, yyline+1, yycolumn+1, yytext());}
{MENORI} {return new symbol(ParserSym.MENORI, yyline+1, yycolumn+1, yytext());}
{MAYORQ} {return new symbol(ParserSym.MAYORQ, yyline+1, yycolumn+1, yytext());}
{MAYORI} {return new symbol(ParserSym.MAYORI, yyline+1, yycolumn+1, yytext());}
{PUNTO} {return new symbol(ParserSym.PUNTO, yyline+1, yycolumn+1, yytext());}
{COMA} {return new symbol(ParserSym.COMA, yyline+1, yycolumn+1, yytext());}
{PYCOMA} {return new symbol(ParserSym.PYCOMA, yyline+1, yycolumn+1, yytext());}
{DOSPUNTOS} {return new symbol(ParserSym.DOSPUNTOS, yyline+1, yycolumn+1, yytext());}
{PARAB} {return new symbol(ParserSym.PARAB, yyline+1, yycolumn+1, yytext());}
{PARCER} {return new symbol(ParserSym.PARCER, yyline+1, yycolumn+1, yytext());}
{LLAB} {return new symbol(ParserSym.LLAB, yyline+1, yycolumn+1, yytext());}
{LLCER} {return new symbol(ParserSym.LLCER, yyline+1, yycolumn+1, yytext());}
{AND} {return new symbol(ParserSym.AND, yyline+1, yycolumn+1, yytext());}
{OR} {return new symbol(ParserSym.OR, yyline+1, yycolumn+1, yytext());}
{NOT} {return new symbol(ParserSym.NOT, yyline+1, yycolumn+1, yytext());}
{INT} {return new symbol(ParserSym.INT, yyline+1, yycolumn+1, yytext());}
{DOUBLE} {return new symbol(ParserSym.DOUBLE, yyline+1, yycolumn+1, yytext());}
{CHAR} {return new symbol(ParserSym.CHAR, yyline+1, yycolumn+1, yytext());}
{BOOL} {return new symbol(ParserSym.BOOL, yyline+1, yycolumn+1, yytext());}
{STRING} {return new symbol(ParserSym.STRING, yyline+1, yycolumn+1, yytext());}
{VOID} {return new symbol(ParserSym.VOID, yyline+1, yycolumn+1, yytext());}
{MAIN} {return new symbol(ParserSym.MAIN, yyline+1, yycolumn+1, yytext());}
{DEF} {return new symbol(ParserSym.DEF, yyline+1, yycolumn+1, yytext());}
{BRK} {return new symbol(ParserSym.BRK, yyline+1, yycolumn+1, yytext());}
{RTRN} {return new symbol(ParserSym.RTRN, yyline+1, yycolumn+1, yytext());}
{CONT} {return new symbol(ParserSym.CONT, yyline+1, yycolumn+1, yytext());}
{CNSL} {return new symbol(ParserSym.CNSL, yyline+1, yycolumn+1, yytext());}
{WRTE} {return new symbol(ParserSym.WRTE, yyline+1, yycolumn+1, yytext());}
{ELSE} {return new symbol(ParserSym.ELSE, yyline+1, yycolumn+1, yytext());}
{IF} {return new symbol(ParserSym.IF, yyline+1, yycolumn+1, yytext());}
{SWT} {return new symbol(ParserSym.SWT, yyline+1, yycolumn+1, yytext());}
{CASE} {return new symbol(ParserSym.CASE, yyline+1, yycolumn+1, yytext());}
{FOR} {return new symbol(ParserSym.FOR, yyline+1, yycolumn+1, yytext());}
{WHILE} {return new symbol(ParserSym.WHILE, yyline+1, yycolumn+1, yytext());}
{DO} {return new symbol(ParserSym.DO, yyline+1, yycolumn+1, yytext());}
{NEW} {return new symbol(ParserSym.NEW, yyline+1, yycolumn+1, yytext());}
{DECD} {return new symbol(ParserSym.DECD, yyline+1, yycolumn+1, yytext());}
{ENTD} {return new symbol(ParserSym.ENTD, yyline+1, yycolumn+1, yytext());}
{CHARACD} {return new symbol(ParserSym.CHARACD, yyline+1, yycolumn+1, yytext());}
{BOOLEAD} {return new symbol(ParserSym.BOOLEAD, yyline+1, yycolumn+1, yytext());}
{ID} {return new symbol(ParserSym.ID, yyline+1, yycolumn+1, yytext());}
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
[^] {throw new Error("Cadena Ilegal: "+yytext());}