#include <stdio.h>

int main() {
    FILE *f = fopen("input.txt", "r");
    int c, chars = 0, words = 0, lines = 0, inword = 0;
    while ((c = fgetc(f)) != EOF) {
        chars++;
        if (c == '\n')
            lines++;
        if (c == ' ' || c == '\n' || c == '\t')
            inword = 0;
        else if (!inword) {
            inword = 1;
            words++;
        }
    }
    fclose(f);
    printf("Characters : %d\n", chars);
    printf("Words      : %d\n", words);
    printf("Lines      : %d\n", lines);
    return 0;
}
