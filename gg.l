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
declaration_char char" "+{identificateur}(=" "*\'[A-Za-z]\')?""*;
declaration_int int" "+{identificateur}(=" "*{chiffre}+)?""*;
declaration_double double|float" "+{identificateur}(=" "*{double})?""*;
declaration_chain char" "+{identificateur}\[\]=" "*\'[A-Za-z]+\'""*;
declaration_tab_ent (int|double|float)[ ]+{identificateur}"["{chiffre}*"]"(="{"[ ]*({chiffre}","?)+"}")?[ ]*?;
declaration_faut ([A-Za-z]|" "|;)+
boucle_for (for)\({lettre}{affectation}{chiffre}+{fin}{lettre}{operation_compar}{chiffre}+{fin}{lettre}{operation_art}{operation_art}\)

%%
{declaration_char} {printf("%s : est un char",yytext);}
{declaration_int} {printf("%s : est un integer",yytext);}
{declaration_double} {printf("%s : est un real",yytext);}
{declaration_chain} {printf("%s : est une chaine des characteres",yytext);}
{declaration_tab_ent} {printf("%s : est une chaine des entirs",yytext);}
{declaration_faut} {printf("%s : type inconnue",yytext);}
{boucle_for} {printf("%s : est une boucle for",yytext);}
%%
int main(){
yylex();return 0;
}
int yywrap(){return 1;}
