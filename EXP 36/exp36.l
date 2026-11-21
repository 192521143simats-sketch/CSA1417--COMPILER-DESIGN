%{
#include <stdio.h>
%}

%%
[0-9]+[-+*/%][0-9]+   {
        int a, b;
        char op;
        sscanf(yytext, "%d%c%d", &a, &op, &b);
        if (op == '+')
            printf("%s = %d\n", yytext, a + b);
        else if (op == '-')
            printf("%s = %d\n", yytext, a - b);
        else if (op == '*')
            printf("%s = %d\n", yytext, a * b);
        else if (b == 0)
            printf("%s : Division by zero\n", yytext);
        else if (op == '/')
            printf("%s = %d\n", yytext, a / b);
        else
            printf("%s = %d\n", yytext, a % b);
    }
.|\n    ;
%%

int yywrap() { return 1; }

int main() {
    yyin = fopen("input.txt", "r");
    yylex();
    return 0;
}
