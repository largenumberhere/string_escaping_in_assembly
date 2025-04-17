
#include "convert.h"
#include <string.h>
#include <stdlib.h>

#include <stdio.h>
int main() {
    char* ip = "192.168.1.1";
    int len = strlen(ip);
    char* ptr = convert(ip, len);
    printf("ip = '%p'\n", ip);
    printf("ptr = %p\n", ptr);
    printf("*ip = '%s'\n", ip);
    printf("*ptr ='%s'\n", ptr);
    
    
    free(ptr);
    return 0;
}