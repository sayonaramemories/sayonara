%{
#include<stdio.h>
#include "y.tab.h"
void yyerror(char *s);
%}

%%
[0-9]+ {yylval = atoi(yytext);return id;}
[+/*-] {return yytext[0];}
[\n] {return yytext[0];}
%%
int yywrap(void){
return 1;
}


