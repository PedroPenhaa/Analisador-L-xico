identif [a-zA-Z]([a-zA-Z0-9])*
numero [0-9]+
espaco [ \t]+
novalinha [\n]

%x comentario
%%

programa printf("%11s:palavra_reservada:T_PROGRAMA\n", yytext);
inicio printf("%11s:palavra_reservada:T_INICIO\n", yytext);
fimprograma printf("%11s:palavra_reservada:T_FIM\n", yytext);

se printf("%11s:palavra_reservada:T_SE\n", yytext);
entao printf("%11s:palavra_reservada:T_ENTAO\n", yytext);
senao printf("%11s:palavra_reservada:T_SENAO\n", yytext);
fimse printf("%11s:palavra_reservada:T_FIMSE\n", yytext);

enquanto printf("%11s:palavra_reservada:T_ENQTO\n", yytext);
fimenquanto printf("%11s:palavra_reservada:T_FIMENQTO\n", yytext);

leia printf("%11s:palavra_reservada:T_LEIA\n", yytext);
escreva printf("%11s:palavra_reservada:T_ESCREVA\n", yytext);

faca printf("%11s:palavra_reservada:T_FACA\n", yytext);

"+" printf("%11s:operador_aritimético:T_MAIS\n", yytext);
"-" printf("%11s:operador_aritimético:T_MENOS\n", yytext);
"*" printf("%11s:operador_aritimético:T_VEZES\n", yytext);
"/" printf("%11s:operador_aritimético:T_DIV\n", yytext);

">" printf("%11s:operador_aritimético:T_MAIOR\n", yytext);
"<" printf("%11s:operador_aritimético:T_MENOR\n", yytext);
"=" printf("%11s:operador_aritimético:T_IGUAL\n", yytext);

e printf("%11s:palavra_reservada:T_E\n", yytext);
ou printf("%11s:palavra_reservada:T_OU\n", yytext);
nao printf("%11s:palavra_reservada:T_NAO\n", yytext);

"<-" printf("%11s:palavra_reservada:T_ATRIB\n", yytext);
"(" printf("%11s:palavra_reservada:T_ABRE\n", yytext);
")" printf("%11s:palavra_reservada:T_FECHA\n", yytext);

inteiro printf("%11s:palavra_reservada:T_INTEIRO\n", yytext);
logico printf("%11s:palavra_reservada:T_LOGICO\n", yytext);
V printf("%11s:palavra_reservada:T_V\n", yytext);
F printf("%11s:palavra_reservada:T_F\n", yytext);

{identif} printf("%11s:T_IDENTIF\n", yytext);
{numero} printf("%11s:T_NUMERO\n", yytext);

{espaco} /*não faz nada*/
{novalinha} /*não faz nada*/
"//".* /* comentario de linha */
"/*" BEGIN(comentario);
<comentario>"*/" BEGIN(INITIAL);
<comentario>. /* nao faz nada */
.                      printf ("ERRO LEXICO");

%%

int yywrap(void){
    return 1;
}

int main(int argc, char *argv[]){
    yyin = fopen(argv[1], "r");
    yylex();
    return 0;
}