identif [a-zA-Z]([a-zA-Z0-9])*
numero [0-9]+
espaco [ \t]+
novalinha[\n]

%%

programa printf("%11s:palavra_reservada:T_PROGRAMA\n", yytext);
inicio printf("%11s:palavra_reservada:T_INICIO\n", yytext);
fim printf("%11s:palavra_reservada:T_FIM\n", yytext);

se printf("%11s:palavra_reservada:T_SE\n", yytext);
entao printf("%11s:palavra_reservada:T_ENTAO\n", yytext);
senao printf("%11s:palavra_reservada:T_SENAO\n", yytext);
fimse printf("%11s:palavra_reservada:T_FIMSE\n", yytext);

enqto printf("%11s:palavra_reservada:T_ENQTO\n", yytext);
fimenqto printf("%11s:palavra_reservada:T_FIMENQTO\n", yytext);

leia printf("%11s:palavra_reservada:T_LEIA\n", yytext);
escreva printf("%11s:palavra_reservada:T_ESCREVA\n", yytext);

se printf("%11s:palavra_reservada:T_SE\n", yytext);
entao printf("%11s:palavra_reservada:T_ENTAO\n", yytext);
senao printf("%11s:palavra_reservada:T_SENAO\n", yytext);
fimse printf("%11s:palavra_reservada:T_FIMSE\n", yytext);

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

atrib printf("%11s:palavra_reservada:T_ATRIB\n", yytext);
abre printf("%11s:palavra_reservada:T_ABRE\n", yytext);
fecha printf("%11s:palavra_reservada:T_FECHA\n", yytext);

inteiro printf("%11s:palavra_reservada:T_INTEIRO\n", yytext);
logico printf("%11s:palavra_reservada:T_LOGICO\n", yytext);
v printf("%11s:palavra_reservada:T_V\n", yytext);
f printf("%11s:palavra_reservada:T_F\n", yytext);

{identif} printf("%11s:T_IDENTIF\n", yytext);
{numero} printf("%11s:T_NUMERO\n", yytext);
{espaco}        /*  nao faz nada */
{novalinha}     /*  nao faz nada */
.    printf("%11s:ERRO_SIMBOLO_NAO_RECONHECIDO!\n", yytext);

%%

int yywrap(void){
    return 1;
}

int main(int argc, char *argv[]){
    yyin = fopen(argv[1], "r");
    yylex();
    return 0;
}