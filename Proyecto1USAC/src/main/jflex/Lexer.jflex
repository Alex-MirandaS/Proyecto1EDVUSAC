package gt.edu.usac.compiler;
import java_cup.runtime.Symbol;

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

    private AbstractSymbol filename;

    void set_filename(String fname) {
	filename = AbstractTable.stringtable.addString(fname);
    }

    AbstractSymbol curr_filename() {
	return filename;
    }
%}

%init{

%init}

%eofval{


    switch(zzLexicalState) {
        case YYINITIAL:
        /* nada */
        break;
    }
    return new Symbol(TokenConstants.EOF);
%eofval}

%class Lexer
%line
%column
%state STRING
%standalone

//VALORES PRIMITIVOS 

DIG = [0-9]
MAYUS = [A-Z] 
MIN = [a-z]
LETRA = [a-zA-Z]
WHS = [ \t\r\n\v\b]

//CARACTERES

MAS = "+"
DIV = "/"
MEN = "-"
MULT = "*"
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
GBAJO = "_"
AND = "&&"
OR = "||"
NOT = "!"

//KEYWORDS
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
NEW = (("n"|"N")("e"|"E")("w"|"W"))|(("n"|"N")("u"|"U")("e"|"E")("v"|"V")("o"|"O"))
TRUE = (("t")("r")("u")("e"))
FALSE = (("f")("a")("l")("s")("e"))

//ESTRUCTURAS LEXICAS

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace = {LineTerminator} | [ \t\f]
COMENTM   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
COMENTS = "//" {InputCharacter}* {LineTerminator}?
ENT = DIG+
DEC = {ENT}{PUNTO}{ENT}
CHAR = {LETRA}
BOOL = ({TRUE}|{FALSE})

IDTIPO = {MAYUS}({LETRA}|{DIG}|{GBAJO})*
IDOBJETO = {MIN}({LETRA}|{DIG}|{GBAJO})*

%%
{COMENS}                           {/*ignore*/}
{COMENM}                           {/*ignore*/}
<STRING> {
      \"                             { yybegin(YYINITIAL);
                                        AbstractSymbol texto = AbstractTable.stringtable.addString(string.toString());
                                return new Symbol(TokenConstants.STR_CONST, yyline, yycolumn, texto);
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
<YYINITIAL>{MAS}                {return new Symbol(TokenConstants.PLUS, yyline, yycolumn, yytext());}
<YYINITIAL>{DIV}                {return new Symbol(TokenConstants.DIV, yyline, yycolumn, yytext());}
<YYINITIAL>{MEN}                {return new Symbol(TokenConstants.MINUS, yyline, yycolumn, yytext());}
<YYINITIAL>{MULT}               {return new Symbol(TokenConstants.MULT, yyline, yycolumn, yytext());}
<YYINITIAL>{IGUAL}              {return new Symbol(TokenConstants.EQ, yyline, yycolumn, yytext());}
<YYINITIAL>{MENORQ}             {return new Symbol(TokenConstants.LT, yyline, yycolumn, yytext());}
<YYINITIAL>{PUNTO}              {return new Symbol(TokenConstants.DOT, yyline, yycolumn, yytext());}
<YYINITIAL>{NEGAR}              {return new Symbol(TokenConstants.NEG, yyline, yycolumn, yytext());}
<YYINITIAL>{COMA}               {return new Symbol(TokenConstants.COMMA, yyline, yycolumn, yytext());}
<YYINITIAL>{PYCOMA}             {return new Symbol(TokenConstants.SEMI, yyline, yycolumn, yytext());}
<YYINITIAL>{DOSPUNTOS}          {return new Symbol(TokenConstants.COLON, yyline, yycolumn, yytext());}
<YYINITIAL>{PARAB}              {return new Symbol(TokenConstants.LPAREN, yyline, yycolumn, yytext());}
<YYINITIAL>{PARCER}             {return new Symbol(TokenConstants.RPAREN, yyline, yycolumn, yytext());}
<YYINITIAL>{ARROBA}             {return new Symbol(TokenConstants.AT, yyline, yycolumn, yytext());}
<YYINITIAL>{LLAB}               {return new Symbol(TokenConstants.LBRACE, yyline, yycolumn, yytext());}
<YYINITIAL>{LLCER}              {return new Symbol(TokenConstants.RBRACE, yyline, yycolumn, yytext());}
<YYINITIAL>{DAROOW}             {return new Symbol(TokenConstants.DARROW, yyline, yycolumn, yytext());}
<YYINITIAL>{LE}                 {return new Symbol(TokenConstants.LE, yyline, yycolumn, yytext());}
<YYINITIAL>{LT}                 {return new Symbol(TokenConstants.LT, yyline, yycolumn, yytext());}
<YYINITIAL>{ASIGNACION}         {return new Symbol(TokenConstants.ASSIGN, yyline, yycolumn, yytext());}
<YYINITIAL>{CLASS}              {return new Symbol(TokenConstants.CLASS, yyline, yycolumn, yytext());}
<YYINITIAL>{ELSE}               {return new Symbol(TokenConstants.ELSE, yyline, yycolumn, yytext());}
<YYINITIAL>{FI}                 {return new Symbol(TokenConstants.FI, yyline, yycolumn, yytext());}
<YYINITIAL>{IF}                 {return new Symbol(TokenConstants.IF, yyline, yycolumn, yytext());}
<YYINITIAL>{CASE}               {return new Symbol(TokenConstants.CASE, yyline, yycolumn, yytext());}
<YYINITIAL>{OF}                 {return new Symbol(TokenConstants.OF, yyline, yycolumn, yytext());}
<YYINITIAL>{IN}                 {return new Symbol(TokenConstants.IN, yyline, yycolumn, yytext());}
<YYINITIAL>{INHERITS}           {return new Symbol(TokenConstants.INHERITS, yyline, yycolumn, yytext());}
<YYINITIAL>{ISVOID}             {return new Symbol(TokenConstants.ISVOID, yyline, yycolumn, yytext());}
<YYINITIAL>{LET}                {return new Symbol(TokenConstants.LET, yyline, yycolumn, yytext());}
<YYINITIAL>{ESAC}               {return new Symbol(TokenConstants.ESAC, yyline, yycolumn, yytext());}
<YYINITIAL>{NOT}                {return new Symbol(TokenConstants.NOT, yyline, yycolumn, yytext());}
<YYINITIAL>{LOOP}               {return new Symbol(TokenConstants.LOOP, yyline, yycolumn, yytext());}
<YYINITIAL>{POOL}               {return new Symbol(TokenConstants.POOL, yyline, yycolumn, yytext());}
<YYINITIAL>{THEN}               {return new Symbol(TokenConstants.THEN, yyline, yycolumn, yytext());}
<YYINITIAL>{WHILE}              {return new Symbol(TokenConstants.WHILE, yyline, yycolumn, yytext());}
<YYINITIAL>{NEW}                {return new Symbol(TokenConstants.NEW, yyline, yycolumn, yytext());}
<YYINITIAL>{DIG}+                {AbstractSymbol num = AbstractTable.inttable.addString(yytext());
                                return new Symbol(TokenConstants.INT_CONST, yyline, yycolumn, num);}
<YYINITIAL>{BOOLEANO}           {return new Symbol(TokenConstants.BOOL_CONST, yyline, yycolumn, yytext());}
<YYINITIAL>{IDOBJETO}           {AbstractSymbol idobjeto = AbstractTable.stringtable.addString(yytext());
                                return new Symbol(TokenConstants.OBJECTID, yyline, yycolumn, idobjeto);}
<YYINITIAL>{IDTIPO}             {AbstractSymbol idtipo = AbstractTable.stringtable.addString(yytext());
                                return new Symbol(TokenConstants.TYPEID, yyline, yycolumn, idtipo);}

<YYINITIAL>{WHS}                {/*ignore*/}
<YYINITIAL> .                   {
                                System.err.println("LEXER BUG - UNMATCHED: " + yytext()); 
                                return new Symbol(TokenConstants.ERROR, yyline, yycolumn,  yytext());
                                }