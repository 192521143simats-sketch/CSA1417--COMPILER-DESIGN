%{
#include <stdio.h>
int valid(int d, int m, int y) {
    int days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    if (m == 2 && ((y % 4 == 0 && y % 100 != 0) || y % 400 == 0))
        return d <= 29;
    return d <= days[m - 1];
}
%}

%%
^(0[1-9]|[12][0-9]|3[01])"/"(0[1-9]|1[0-2])"/"(19|20)[0-9][0-9]$   {
        int d, m, y;
        sscanf(yytext, "%d/%d/%d", &d, &m, &y);
        if (valid(d, m, y))
            printf("%s : Valid DOB\n", yytext);
        else
            printf("%s : Invalid DOB\n", yytext);
    }
.+      { printf("%s : Invalid DOB\n", yytext); }
\n      ;
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    return 0;
}
