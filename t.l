%{
#include<stdio.h>
#include<stdlib.h>
%}
chiffre[0-9]
double {chiffre}+\.{chiffre}+
alphabet[fuckyoubitch]
mots {alphabet} {2}
word [.]*
phrase{mots}" "{word}

%%
{^mots} ";" printf("erreur %s ",yytext);
{phrase} ";" printf(" c est un test 2 %s \n",yytext);
{mots} ";" printf("fffffffffffffffffffffffffffffffff");
{chiffre} ";" printf(" c est un ensatien  %s \n",yytext);
{double} ";" printf(" c est un hhhh 2 %s \n",yytext);
%%  

int main(void)
{
yylex();
yyparse();
}