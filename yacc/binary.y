%{
  #include <stdio.h>
  int count = 0;
%}
%token digit
%%
N : L {printf("No.of bits : %d\n",count);return 0;}
L : L B {}
  | B
B : digit {count = count+1;}
;
%%

void main()
{
   yyparse();
}
void yyerror(char *s)
{

}
