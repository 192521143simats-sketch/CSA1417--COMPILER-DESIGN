%{
#include <stdio.h>
%}

%%
^[6-9][0-9]{9}$   { printf("%s : Valid mobile number\n", yytext); }
.+                { printf("%s : Invalid mobile number\n", yytext); }
\n                ;
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    return 0;
}
