%{
#include<stdio.h>
int len=0;
%}

%%
[a-zA-Z]+ {len=yyleng;func(len);}
%%

void func(int len){
  if(yytext[0]=='a'||yytext[0]=='A'){
    if(len==3){
       printf("\n%s is starting with A and has length 3",yytext);
    }
  }
}

int yywrap(){}

int main(){
yylex();
}//starts with A
