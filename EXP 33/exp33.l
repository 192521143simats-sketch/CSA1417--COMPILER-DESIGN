%{
#include <stdio.h>
%}

%%
^("http"|"https"|"ftp")"://"("www.")?[a-zA-Z0-9-]+("."[a-zA-Z]{2,})+("/"[a-zA-Z0-9._?=&%-]*)*$   { printf("%s : Valid URL\n", yytext); }
.+                                                                                              { printf("%s : Invalid URL\n", yytext); }
\n                                                                                              ;
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    return 0;
}
