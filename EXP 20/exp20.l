%{
#include <stdio.h>
int macros = 0, headers = 0;
%}

%%
"#define"                          { macros++; }
"#include"                         { headers++; }
[0-9]+"."[0-9]+                    { printf("Constant: %s\n", yytext); }
[0-9]+                             { printf("Constant: %s\n", yytext); }
\"[^\"]*\"                         { printf("Constant: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_.]*            ;
.|\n                               ;
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    printf("Macros defined       : %d\n", macros);
    printf("Header files included: %d\n", headers);
    return 0;
}
