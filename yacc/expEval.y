%{
#include<stdio.h>
int yylex(void);
void yyerror(char *s);
int eval =0,e1val =0,tval = 0,fval = 0;
%}

%token id '\n'
%left '+' '-'
%left '*' '/'

%%
E1 : E '\n' {e1val = eval;printf("%d",e1val);}
;
E : E '+' T {eval = eval + tval;}
| E '-' T {eval = eval - tval;}
| T {eval = tval;} 
T : T '*' F {tval = tval *fval;}
| T '/' F {tval = tval /fval;}
| F {tval = fval;} 
F : id {fval = $1;}
;
%%

int main(void){
yyparse();
return 0;

}
 void yyerror(char *s)
 {}
 
