#include <stdint.h>
#include <stddef.h>
#include <stdio.h>

#include "crctable.out"

int main(int argc, const char *argv[]) {
    const uint32_t CRC_INIT = 0xffffffffL;
    const uint32_t XO_ROT   = 0xffffffffL;

    if (argc < 2) {
        printf("Usage: %s \"some string\"\n", argv[0]);
        return 1;
    }

    uint32_t crc = CRC_INIT;
    const char *data = argv[1];

    while (*data) {
        crc = crctable[(crc ^ *data++) & 0xFFL] ^ (crc >> 8);
    }
    crc = crc ^ XO_ROT;

    printf("Input: %s\n", argv[1]);
    printf("CRC: 0x%08x\n", crc);

    return 0;
}
