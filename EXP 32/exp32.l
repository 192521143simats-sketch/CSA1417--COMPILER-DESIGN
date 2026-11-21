%{
#include <stdio.h>
int pos = 0, neg = 0;
%}

%%
"-"[0-9]+      { printf("%s : Negative\n", yytext); neg++; }
"+"?[0-9]+      { printf("%s : Positive\n", yytext); pos++; }
.|\n           ;
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    printf("Positive numbers : %d\n", pos);
    printf("Negative numbers : %d\n", neg);
    return 0;
}
