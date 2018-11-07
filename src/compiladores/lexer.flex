package compiladores;
import static compiladores.Token.*;
%%
%class Lexer
%type Token

ESCAPE = [ \r \t \n \\]
FINAL_LINHA = (\r | \n | \r\n)

LETRA = [a-zA-Z_]
DIGITO = [0-9]
LITERALCHAR = '({LETRA} | {DIGITO})?'
LITERALSTR = "\""({LETRA} | {DIGITO})*"\""
LITERALNUM = [-]?{DIGITO}+
ID = ({LETRA})({LETRA}|{DIGITO})*

OP_ARITMETICOS = ( "+" | "-" | "*" | "/" )
OP_RELACIONAIS = ( "==" | "!=" | "<" | ">" | "<=" | ">=" )
OP_LOGICOS = ( "&&" | "||" | "!" )
OP_ATRIBUICAO = "="
SIMBOLOS_PONTUACAO = ( ":" | ";" | "," | "(" | ")" | "{" | "}" | "." | "#" | "&" | "|" )

%{
public String lexeme;
%}

%%
{ESCAPE} {/*Ignore*/}

"char" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"else" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"true" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"false" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"if" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"int" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"float" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"double" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"main" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"printf" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"printint" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"printstr" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"return" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"static" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"void" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"while" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"for" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"do" { lexeme=yytext(); return PALAVRA_RESERVADA; }
"include" { lexeme=yytext(); return PALAVRA_RESERVADA; }

{ID} {lexeme=yytext(); return ID;}


{LITERALCHAR} {lexeme=yytext(); return LITERALCHAR;}
{LITERALSTR} {lexeme=yytext(); return LITERALSTR;}
{LITERALNUM} {lexeme=yytext(); return LITERALNUM;}


{OP_ARITMETICOS} {lexeme=yytext(); return OPERADOR_ARITMETICO;}
{OP_RELACIONAIS} {lexeme=yytext(); return OPERADOR_RELACIONAL;}
{OP_LOGICOS} {lexeme=yytext(); return OPERADOR_LOGICO;}
{OP_ATRIBUICAO} {lexeme=yytext(); return OPERADOR_ATRIBUICAO;}
{SIMBOLOS_PONTUACAO} {lexeme=yytext(); return SIMBOLOS_PONTUACAO;}


/* errors */
. {return ERROR;}