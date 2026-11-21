#include <stdio.h>
#include <string.h>
#include <ctype.h>

char prod[6][10] = {"E=E+T", "E=T", "T=T*F", "T=F", "F=(E)", "F=i"};
int trail[128][128];

int main() {
    int n = 6, i, j, L, changed = 1;
    char nt[] = "ETF";
    for (i = 0; i < n; i++) {
        L = strlen(prod[i]);
        char a = prod[i][0], x = prod[i][L - 1], y = prod[i][L - 2];
        if (!isupper(x))
            trail[(int)a][(int)x] = 1;
        else if (L - 2 >= 2 && !isupper(y))
            trail[(int)a][(int)y] = 1;
    }
    while (changed) {
        changed = 0;
        for (i = 0; i < n; i++) {
            L = strlen(prod[i]);
            char a = prod[i][0], x = prod[i][L - 1];
            if (isupper(x) && x != a)
                for (j = 0; j < 128; j++)
                    if (trail[(int)x][j] && !trail[(int)a][j]) {
                        trail[(int)a][j] = 1;
                        changed = 1;
                    }
        }
    }
    printf("Grammar:\n");
    for (i = 0; i < n; i++)
        printf("%c -> %s\n", prod[i][0], prod[i] + 2);
    printf("\n");
    for (i = 0; i < 3; i++) {
        printf("TRAILING(%c) = { ", nt[i]);
        for (j = 0; j < 128; j++)
            if (trail[(int)nt[i]][j])
                printf("%c ", j);
        printf("}\n");
    }
    return 0;
}
