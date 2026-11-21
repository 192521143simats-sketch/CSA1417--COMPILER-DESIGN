%{
#include <stdio.h>
FILE *out;
int comments = 0;
%}

%%
"//".*                              { comments++; }
"/*"([^*]|"*"+[^*/])*"*"+"/"        { comments++; }
.|\n                                { fputc(yytext[0], out); }
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    out = fopen("cleaned.c", "w");
    yylex();
    fclose(out);
    printf("Comment lines : %d\n", comments);
    return 0;
}
