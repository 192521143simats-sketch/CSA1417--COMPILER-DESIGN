#include <stdio.h>

char s[100];
int p;

int E();
int Ep();
int T();
int Tp();
int F();

int E() { return T() && Ep(); }

int Ep() {
    if (s[p] == '+') {
        p++;
        return T() && Ep();
    }
    return 1;
}

int T() { return F() && Tp(); }

int Tp() {
    if (s[p] == '*') {
        p++;
        return F() && Tp();
    }
    return 1;
}

int F() {
    if (s[p] == '(') {
        p++;
        if (!E()) return 0;
        if (s[p] == ')') {
            p++;
            return 1;
        }
        return 0;
    }
    if (s[p] == 'i') {
        p++;
        return 1;
    }
    return 0;
}

int main() {
    FILE *f = fopen("input.txt", "r");
    while (fscanf(f, "%s", s) == 1) {
        p = 0;
        if (E() && s[p] == '\0')
            printf("%s : Accepted\n", s);
        else
            printf("%s : Rejected\n", s);
    }
    fclose(f);
    return 0;
}
