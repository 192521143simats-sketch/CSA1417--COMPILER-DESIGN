#include <stdio.h>
#include <string.h>

char in[100], st[100];
int top, ip;

void show(char *a) {
    st[top] = '\0';
    printf("%-10s %-10s %s\n", st, in + ip, a);
}

int reduce() {
    if (top >= 1 && st[top - 1] == 'i') {
        st[top - 1] = 'E';
        show("REDUCE E->id");
        return 1;
    }
    if (top >= 3 && st[top - 3] == '(' && st[top - 2] == 'E' && st[top - 1] == ')') {
        st[top - 3] = 'E';
        top -= 2;
        show("REDUCE E->(E)");
        return 1;
    }
    if (top >= 3 && st[top - 3] == 'E' && st[top - 2] == '*' && st[top - 1] == 'E') {
        st[top - 3] = 'E';
        top -= 2;
        show("REDUCE E->E*E");
        return 1;
    }
    if (top >= 3 && st[top - 3] == 'E' && st[top - 2] == '+' && st[top - 1] == 'E' && in[ip] != '*') {
        st[top - 3] = 'E';
        top -= 2;
        show("REDUCE E->E+E");
        return 1;
    }
    return 0;
}

int main() {
    FILE *f = fopen("input.txt", "r");
    while (fscanf(f, "%s", in) == 1) {
        top = 0;
        ip = 0;
        printf("Input string: %s\n", in);
        printf("%-10s %-10s %s\n", "STACK", "INPUT", "ACTION");
        while (1) {
            if (reduce()) continue;
            if (in[ip]) {
                st[top++] = in[ip++];
                show("SHIFT");
            } else
                break;
        }
        if (top == 1 && st[0] == 'E')
            printf("Result: Accepted\n\n");
        else
            printf("Result: Rejected\n\n");
    }
    fclose(f);
    return 0;
}
