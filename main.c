#include <stddef.h>

extern int puts(const char *s);
size_t strlen(const char *s);

size_t strlen(const char *s) {
    const char *a = s;
    for (; *s; s++);
    return s - a;
}

int _start(int argc, char **argv) {
    (void)argc, (void)argv;
    puts("test 😊😊😊😊😊😊😊😊\n");
    return 0;
}
