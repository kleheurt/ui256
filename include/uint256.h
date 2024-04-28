#ifndef UINT256_H
#define UINT256_H

typedef unsigned long long int uint256_t[4]; // Little-endian
typedef unsigned long long int ull_t;
typedef long long int ill_t;
typedef unsigned char byte_t;
static const auto UINT256_SIZE = sizeof(uint256_t) / sizeof(size_t);
static const auto WORD_SIZE = sizeof(size_t) * 8;
static uint256_t UINT256_MAX = {0xFFFFFFFFFFFFFFFF, 
                                0xFFFFFFFFFFFFFFFF, 
                                0xFFFFFFFFFFFFFFFF, 
                                0xFFFFFFFFFFFFFFFF};

static uint256_t UINT256_ZERO = {0, 0, 0, 0};

int get_slot(int i);
void print(uint256_t x);
uint256_t *from_bytes(void *src);
int most_sig_bit(uint256_t x);
void zero_out(uint256_t &x);
void max_out(uint256_t &x);
void from_2pow(unsigned char powers[], size_t len, uint256_t &x);
void from_ill(uint256_t &x, ill_t a, ill_t b, ill_t c, ill_t d);
bool eq(uint256_t x, uint256_t y);
int compare(uint256_t x, uint256_t y);
void add(uint256_t x, uint256_t y, uint256_t &z);
void sub(uint256_t x, uint256_t y, uint256_t &z);
void shl(uint256_t x, int y, uint256_t &z);
void shr(uint256_t x, int y, uint256_t &z);
void mul(uint256_t x, uint256_t y, uint256_t &z);
void div(uint256_t x, uint256_t y, uint256_t &q, uint256_t &r);
int popcount256d(uint256_t x);


#endif // UINT256_H