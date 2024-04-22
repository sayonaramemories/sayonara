%{
#include <stdio.h>
#include "y.tab.h"
//yylval = atoi(yytext);return digit;
%}
%%
[01] {yylval = atoi(yytext);return digit;}
%%
int yywrap()
{

}

