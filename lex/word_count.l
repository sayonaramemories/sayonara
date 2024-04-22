%{
#include<stdio.h>
int wc=0,lc=0,cc=0,sc=0,tc=0;
%}

%%
[\n] {lc++;}
[.] {cc++;}
[a-zA-Z0-9]+ {wc++;cc=cc+yyleng;}
[( )]+ {sc++;}
[\t] {tc++;}

%%

int yywrap(){}

int main(){
yylex();
printf("Word count :%d\nLine count :%d\nCharacter Count :%d\ntab count:%d\nspcae count:%d",wc,lc,cc,tc,sc);
}

/*i am from cse dept 
this is cd lab
Word count :9
Line count :2
Character Count :25
tab count:0
spcae count:8*///word count
