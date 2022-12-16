package Proyecto;
import java_cup.runtime.Symbol;
import Compilador.ParserSym;
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
        return new Symbol(type, yyline+1, yycolumn+1);
    }

    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline+1, yycolumn+1, value);
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
LineTerminator = [\r|\n|\r\n]
InputCharacter = [^\r\n]
WhiteSpace = [ \t\r\n\v\b]

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
{WhiteSpace}    {/*ignore*/}
{COMENTS} {return  symbol(ParserSym.COMENTS, yytext());}
{COMENTM} {return  symbol(ParserSym.COMENTM, yytext());}
{MAS} {return  symbol(ParserSym.MAS, yytext());}
{DIV} {return  symbol(ParserSym.DIV, yytext());}
{MEN} {return  symbol(ParserSym.MEN, yytext());}
{MULT} {return  symbol(ParserSym.MULT, yytext());}
{ASIG} {return  symbol(ParserSym.ASIG, yytext());}
{IGUAL} {return  symbol(ParserSym.IGUAL, yytext());}
{DESIG} {return  symbol(ParserSym.DESIG, yytext());}
{MENORQ} {return  symbol(ParserSym.MENORQ, yytext());}
{MENORI} {return  symbol(ParserSym.MENORI, yytext());}
{MAYORQ} {return  symbol(ParserSym.MAYORQ, yytext());}
{MAYORI} {return  symbol(ParserSym.MAYORI, yytext());}
{PUNTO} {return  symbol(ParserSym.PUNTO, yytext());}
{COMA} {return  symbol(ParserSym.COMA, yytext());}
{PYCOMA} {return  symbol(ParserSym.PYCOMA, yytext());}
{DOSPUNTOS} {return  symbol(ParserSym.DOSPUNTOS, yytext());}
{PARAB} {return  symbol(ParserSym.PARAB, yytext());}
{PARCER} {return  symbol(ParserSym.PARCER, yytext());}
{LLAB} {return  symbol(ParserSym.LLAB, yytext());}
{LLCER} {return  symbol(ParserSym.LLCER, yytext());}
{AND} {return  symbol(ParserSym.AND, yytext());}
{OR} {return  symbol(ParserSym.OR, yytext());}
{NOT} {return  symbol(ParserSym.NOT, yytext());}
{INT} {return  symbol(ParserSym.INT, yytext());}
{DOUBLE} {return  symbol(ParserSym.DOUBLE, yytext());}
{CHAR} {return  symbol(ParserSym.CHAR, yytext());}
{BOOL} {return  symbol(ParserSym.BOOL, yytext());}
{STRING} {return  symbol(ParserSym.STRING, yytext());}
{VOID} {return  symbol(ParserSym.VOID, yytext());}
{MAIN} {return  symbol(ParserSym.MAIN, yytext());}
{DEF} {return  symbol(ParserSym.DEF, yytext());}
{BRK} {return  symbol(ParserSym.BRK, yytext());}
{RTRN} {return  symbol(ParserSym.RTRN, yytext());}
{CONT} {return  symbol(ParserSym.CONT, yytext());}
{CNSL} {return  symbol(ParserSym.CNSL, yytext());}
{WRTE} {return  symbol(ParserSym.WRTE, yytext());}
{ELSE} {return  symbol(ParserSym.ELSE, yytext());}
{IF} {return  symbol(ParserSym.IF, yytext());}
{SWT} {return  symbol(ParserSym.SWT, yytext());}
{CASE} {return  symbol(ParserSym.CASE, yytext());}
{FOR} {return  symbol(ParserSym.FOR, yytext());}
{WHILE} {return  symbol(ParserSym.WHILE, yytext());}
{DO} {return  symbol(ParserSym.DO, yytext());}
{NEW} {return  symbol(ParserSym.NEW, yytext());}
{DECD} {return  symbol(ParserSym.DECD, yytext());}
{ENTD} {return  symbol(ParserSym.ENTD, yytext());}
{CHARACD} {return  symbol(ParserSym.CHARACD, yytext());}
{BOOLEAD} {return  symbol(ParserSym.BOOLEAD, yytext());}
{ID} {return  symbol(ParserSym.ID, yytext());}
<STRING> {
      \"                             { yybegin(YYINITIAL); 
                                      return symbol(ParserSym.STRINGD, "\""+string.toString()+"\"");
                                     }
      [^\n\r\"\\]+                   { string.append( yytext() ); }
      \\t                            { string.append('\t'); }
      \\n                            { string.append('\n'); }

      \\r                            { string.append('\r'); }
      \\\"                           { string.append('\"'); }
      \\                             { string.append('\\'); }
    }
<YYINITIAL>{
\"      {string.setLength(0); yybegin(STRING);}
}
/*
ERROR
<YYINITIAL>                   { System.err.println("LEXER BUG - UNMATCHED: " + yytext); 
                                return new Token(TokenConstants.ERROR, yyline, yycolumn,  yytext()); 
} */  
[^] {throw new Error("Cadena Ilegal: "+yytext()+"ERROR EN LA COLUMNA: "+yycolumn+" Y EN LA FILA: "+yyline);}