%{
#include <stdio.h>
%}

%%
^[0-9]$   { printf("%s : Digit\n", yytext); }
.+        { printf("%s : Not a digit\n", yytext); }
\n        ;
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    return 0;
}
