%{
#include <stdio.h>
#include <string.h>
char word[50];
int count = 0;
%}

%%
[a-zA-Z]+   { if (strcmp(yytext, word) == 0) count++; }
.|\n        ;
%%

int yywrap() { return 1; }

int main() {
    FILE *f = fopen("input.txt", "r");
    fscanf(f, "%s", word);
    yyin = f;
    yylex();
    printf("Frequency of '%s' : %d\n", word, count);
    return 0;
}
