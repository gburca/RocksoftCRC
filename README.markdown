[![Build Status](https://travis-ci.org/gburca/RocksoftCRC.svg?branch=master)](https://travis-ci.org/gburca/RocksoftCRC)
[![Coverity](https://scan.coverity.com/projects/11176/badge.svg)](https://scan.coverity.com/projects/gburca-rocksoftcrc)

This repo contains the source code for the Rocksoft^tm Model CRC Algorithm.

For full details, see the `Rocksoft/CRC_Explained.txt` file.

For a short example on how to compute the CRC of some data using the Ethernet
CRC-32 algorithm, see the crc-32.c file.

The `crctable` binary when executed will generate a `crctable.out` file that
can be used in your C/C++ code to compute fast table-driven checksums for
blocks of data.

By default, the table generated is for the Ethernet CRC-32 checksum. To
generate a table for a different type of checksum (ex: different polynomial),
modify the following defines at the top of crctable.c and rebuild:

```
#define TB_WIDTH  4
#define TB_POLY   0x04C11DB7L
#define TB_REVER  TRUE
```
