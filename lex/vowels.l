%{
#include<stdio.h>
int vc=0,cc=0;
%}

%%
[aeiouAEIOU] {vc++;}
[a-zA-Z] {cc++;}
%%

int yywrap(){}

int main(){
yylex();
printf("Vowel Count:%d\n",vc);
printf("Consonant Count:%d",cc);
}
