%{
#include <stdio.h>
int line = 1;
%}

%%
^.*\n   { printf("%d  %s", line++, yytext); }
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    return 0;
}
