%{
#include <stdio.h>
int keywords = 0, identifiers = 0;
%}

%%
auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while   { printf("%s : Keyword\n", yytext); keywords++; }
[a-zA-Z_][a-zA-Z0-9_]*   { printf("%s : Identifier\n", yytext); identifiers++; }
.|\n                     ;
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    printf("Total keywords    : %d\n", keywords);
    printf("Total identifiers : %d\n", identifiers);
    return 0;
}
