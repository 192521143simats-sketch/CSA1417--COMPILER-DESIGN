#include <stdio.h>
#include <string.h>

int main() {
    FILE *f = fopen("input.txt", "r");
    char in[100], opnd[20][10], opr[20], lhs;
    char *level[2] = {"*/", "+-"};
    int n, p, t, i, j, k;
    while (fscanf(f, "%s", in) == 1) {
        lhs = in[0];
        n = 0;
        p = 2;
        t = 1;
        while (in[p]) {
            opnd[n][0] = in[p];
            opnd[n][1] = '\0';
            n++;
            if (in[p + 1]) {
                opr[n - 1] = in[p + 1];
                p += 2;
            } else
                p++;
        }
        printf("Expression : %s\n", in);
        for (k = 0; k < 2; k++) {
            i = 0;
            while (i < n - 1) {
                if (strchr(level[k], opr[i])) {
                    printf("t%d = %s %c %s\n", t, opnd[i], opr[i], opnd[i + 1]);
                    sprintf(opnd[i], "t%d", t);
                    t++;
                    for (j = i + 1; j < n - 1; j++)
                        strcpy(opnd[j], opnd[j + 1]);
                    for (j = i; j < n - 2; j++)
                        opr[j] = opr[j + 1];
                    n--;
                } else
                    i++;
            }
        }
        printf("%c = %s\n\n", lhs, opnd[0]);
    }
    fclose(f);
    return 0;
}
