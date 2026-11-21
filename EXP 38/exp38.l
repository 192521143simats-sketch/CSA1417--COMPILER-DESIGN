%{
#include <stdio.h>
#include <string.h>
char longest[100];
int max = 0;
%}

%%
[a-zA-Z]+   { if (yyleng > max) { max = yyleng; strcpy(longest, yytext); } }
.|\n        ;
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    printf("Longest word : %s\n", longest);
    printf("Length       : %d\n", max);
    return 0;
}
