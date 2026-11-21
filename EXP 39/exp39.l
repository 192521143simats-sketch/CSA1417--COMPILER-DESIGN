%{
#include <stdio.h>
#include <string.h>
char oldw[50], neww[50];
%}

%%
[a-zA-Z]+   {
        if (strcmp(yytext, oldw) == 0)
            printf("%s", neww);
        else
            printf("%s", yytext);
    }
.|\n        { printf("%s", yytext); }
%%

int yywrap() { return 1; }

int main() {
    FILE *f = fopen("input.txt", "r");
    fscanf(f, "%s %s", oldw, neww);
    fgetc(f);
    yyin = f;
    yylex();
    return 0;
}
