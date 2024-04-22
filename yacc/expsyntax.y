%{
#include<stdio.h>
int yylex(void);
void yyerror(char *s);
int flag = 0;
%}

%token id '\n'
%left '+' '-'
%left '*' '/'

%%
E1 : E '\n' {printf("Valid");flag = 1;};
E : E '+' T 
| E '-' T 
| T ;
T : T '*' F 
| T '/' F 
| F ;
F : id 
;
%%

int main(void){
yyparse();
if(flag == 0) printf("Invalid");
return 0;

}
 void yyerror(char *s)
 {}
 
