%{
#include <stdio.h>
%}

%%
^[a-zA-Z0-9._]+"@"[a-zA-Z0-9]+("."[a-zA-Z]{2,})+$   { printf("%s : Valid\n", yytext); }
.+                                                  { printf("%s : Invalid\n", yytext); }
\n                                                  ;
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    return 0;
}
