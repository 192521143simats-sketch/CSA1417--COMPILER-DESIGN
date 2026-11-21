#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main() {
    FILE *f = fopen("input.txt", "r");
    char s[200];
    int i, c, count = 0;
    fgets(s, 200, f);
    s[strcspn(s, "\n")] = '\0';
    for (i = 0; s[i]; i++) {
        c = tolower(s[i]);
        if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u')
            count++;
    }
    fclose(f);
    printf("Sentence         : %s\n", s);
    printf("Number of vowels : %d\n", count);
    return 0;
}
