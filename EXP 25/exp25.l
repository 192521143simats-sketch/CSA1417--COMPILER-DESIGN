%{
#include <stdio.h>
int count = 0;
%}

%%
[a-zA-Z]*[a-z][a-zA-Z]*   ;
[A-Z]+                    { printf("Capital word: %s\n", yytext); count++; }
.|\n                      ;
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    printf("Total capital words : %d\n", count);
    return 0;
}
