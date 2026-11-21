#include <stdio.h>
#include <string.h>

int main() {
    FILE *f = fopen("input.txt", "r");
    char line[100], r[10], a[10], b[10], o;
    while (fgets(line, 100, f)) {
        line[strcspn(line, "\n")] = '\0';
        printf("%s\n", line);
        if (sscanf(line, "%s = %s %c %s", r, a, &o, b) == 4) {
            printf("    MOV R0, %s\n", a);
            if (o == '+') printf("    ADD R0, %s\n", b);
            else if (o == '-') printf("    SUB R0, %s\n", b);
            else if (o == '*') printf("    MUL R0, %s\n", b);
            else if (o == '/') printf("    DIV R0, %s\n", b);
            printf("    MOV %s, R0\n", r);
        } else if (sscanf(line, "%s = %s", r, a) == 2) {
            printf("    MOV R0, %s\n", a);
            printf("    MOV %s, R0\n", r);
        }
    }
    fclose(f);
    return 0;
}
