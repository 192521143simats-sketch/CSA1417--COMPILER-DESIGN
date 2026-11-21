%{
#include <stdio.h>
%}

%%
"<"[^>]+">"   { printf("Tag: %s\n", yytext); }
.|\n          ;
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    return 0;
}
