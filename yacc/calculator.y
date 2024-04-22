%{
#include <stdio.h>
%}

%token NUMBER

%%

calclist: /* empty */
        | calclist expr '\n' { printf("= %d\n", $2); }
        ;

expr:   expr '+' term     { $$ = $1 + $3; }
    |   expr '-' term     { $$ = $1 - $3; }
    |   term              { $$ = $1; }
    ;

term:   term '*' factor   { $$ = $1 * $3; }
    |   term '/' factor   { if ($3 != 0) $$ = $1 / $3; else yyerror("division by zero"); }
    |   factor            { $$ = $1; }
    ;

factor: NUMBER            { $$ = $1; }
    |   '-' factor        { $$ = -$2; }
    |   '(' expr ')'     { $$ = $2; }
    ;

%%
int yywrap(){
return 1;}

int yyerror(const char *s) {
    fprintf(stderr, "error: %s\n", s);
    return 0;
}

int main() {
    yyparse();
    return 0;
}

