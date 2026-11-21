#include <stdio.h>
#include <string.h>

struct symbol {
    char name[20];
    char type[20];
};

struct symbol table[50];
int n = 0;

int find(char *name) {
    int i;
    for (i = 0; i < n; i++)
        if (strcmp(table[i].name, name) == 0)
            return i;
    return -1;
}

int main() {
    FILE *f = fopen("input.txt", "r");
    int ch, i;
    char name[20], type[20];
    while (fscanf(f, "%d", &ch) == 1) {
        if (ch == 1) {
            fscanf(f, "%s %s", name, type);
            if (find(name) >= 0)
                printf("Insert %s : already exists\n", name);
            else {
                strcpy(table[n].name, name);
                strcpy(table[n].type, type);
                n++;
                printf("Insert %s : inserted\n", name);
            }
        } else if (ch == 2) {
            fscanf(f, "%s", name);
            i = find(name);
            if (i >= 0)
                printf("Search %s : found, type %s, index %d\n", name, table[i].type, i);
            else
                printf("Search %s : not found\n", name);
        } else if (ch == 3) {
            printf("Index  Name    Type\n");
            for (i = 0; i < n; i++)
                printf("%-7d%-8s%s\n", i, table[i].name, table[i].type);
        } else if (ch == 4) {
            fscanf(f, "%s", name);
            i = find(name);
            if (i < 0)
                printf("Delete %s : not found\n", name);
            else {
                for (; i < n - 1; i++)
                    table[i] = table[i + 1];
                n--;
                printf("Delete %s : deleted\n", name);
            }
        }
    }
    fclose(f);
    return 0;
}
