%{
#include<stdio.h>
%}
chiffre [0-9]
lettre[A-Za-z]
signe \+|\-
int {signe}?{chiffre}+
double {signe}?{chiffre}+(\.{chiffre}+)?
type char|double|int|float
operation_art \*|\+|\-|\/
operation_binaire \||&|\^
operation_compar ==|!=|<|<=|>|>=
affectation =
fin;
identificateur {lettre}({lettre}|{chiffre}|_)*
declaration {type}"  "+{identification}
%%
{signe} {printf("%s : est un signe\n",yytext);}
{int} {printf("%s : est un integer\n",yytext);}
{double} {printf("%s : est un double\n",yytext);}
{type} {printf("%s : est un type\n",yytext);}
{operation_art} {printf("%s : est un operation_art\n",yytext);}
{operation_binaire} {printf("%s : est un operation_binaire\n",yytext);}
{operation_compar} {+printf("%s : est un operation_compar\n",yytext);}
{affectation} {printf("%s : est un affectation\n",yytext);}
{fin} {printf("%s : est un fin\n",yytext);}
{identificateur} {printf("%s : est un identificateur de longueur %d ",yytext,yyleng);}
%%
int main(){
yylex();return 0;
}
int yywrap(){return 1;}
