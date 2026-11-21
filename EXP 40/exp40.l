%{
#include <stdio.h>
%}

%%
"#include"[ ]*"<"[a-zA-Z.]+">"          { printf("%s : Preprocessor Directive\n", yytext); }
int|float|char|void|for|while|if|else|return   { printf("%s : Keyword\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*                  { printf("%s : Identifier\n", yytext); }
[0-9]+"."[0-9]+                         { printf("%s : Floating Constant\n", yytext); }
[0-9]+                                  { printf("%s : Integer Constant\n", yytext); }
\"[^\"]*\"                              { printf("%s : String Literal\n", yytext); }
"<="|">="|"=="|"!="|"<"|">"             { printf("%s : Relational Operator\n", yytext); }
"++"|"--"                               { printf("%s : Increment/Decrement Operator\n", yytext); }
"="                                     { printf("%s : Assignment Operator\n", yytext); }
[-+*/%]                                 { printf("%s : Arithmetic Operator\n", yytext); }
[(){};,]                                { printf("%s : Special Symbol\n", yytext); }
[ \t\n]                                 ;
.                                       { printf("%s : Unknown\n", yytext); }
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    return 0;
}
