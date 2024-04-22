%{
#include<stdio.h>
int dc=0,fc=0;
%}

%%
[0-9]+"."[0-9]+ {fc++;}
[0-9]+ {dc++;}
%%

int yywrap(){}

int main(){
yylex();
printf("Decimal number count:%d\n",dc);
printf("Float number count:%d",fc);
}
