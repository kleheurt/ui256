#include "../include/uint256.h"
#include <iostream>

inline void zero_out(uint256_t &x){
    memcpy(x, UINT256_ZERO, sizeof(uint256_t));
}

inline void max_out(uint256_t &x){
    memcpy(x, UINT256_MAX, sizeof(uint256_t));
}

// TODO
// Assign a uint256_t from a list of powers of 2
// Bring your own ref
void from_2pow(unsigned char powers[], size_t len, uint256_t &x){
    size_t mask = 0; 
    unsigned char arr_pos, pow = 0;

    zero_out(x);

    for(int i = 0; i < len; i++){
        pow = powers[i];
        arr_pos = pow / WORD_SIZE;
        mask = ((ull_t) 1) << (pow % WORD_SIZE);
        x[arr_pos] |= mask;
    }
}

// TODO variadic ? arch ?
inline void from_ill(uint256_t &x, ill_t a, ill_t b, ill_t c, ill_t d){
    x[3] = a;
    x[2] = b;
    x[1] = c;
    x[0] = d;
}

bool eq(uint256_t x, uint256_t y){
    unsigned long long int xi, yi = 0;
    for(int i = 0; i < UINT256_SIZE; i++){
        if(x[i] != y[i]){
            return false;
        }
    }
    return true;
}

// x > y => 1, x < y => -1, x == y => 0
int compare(uint256_t x, uint256_t y){
    for(int i = UINT256_SIZE - 1; i >= 0; i--){
        if(x[i] == y[i]){
            continue;
        } else if(x[i] > y[i]){
            return 1;
        }
        return -1;
    }
    return 0;
}

// TODO magic numbers
// TODO magic masks
// TODO add_sub unit test is NOK
// addition with uneven windows
// using 64 bit words and 2 bits of carry
// will saturate to UINT_256_MAX on overflow
void add_deprecated_do_not_use(uint256_t x, uint256_t y, uint256_t &z){
    zero_out(z);

    byte_t carry = 0;
    for(int i = 0; i < UINT256_SIZE; i++){
        ull_t x_most = (x[i] & 0xC000000000000000) >> 2;
        ull_t y_most = (y[i] & 0xC000000000000000) >> 2;
        ull_t x_least = x[i] & 0x3FFFFFFFFFFFFFF;
        ull_t y_least = y[i] & 0x3FFFFFFFFFFFFFF;
        
        ull_t z_least = x_least + y_least + carry;
        ull_t ovflo = x_most + y_most;
        if(z_least & 0xC000000000000000) ovflo++;
        z[i] = z_least | (ovflo << 2);
        carry = ovflo >> 62;
    }

    if(carry) max_out(z);
}

// TODO magic numbers
// TODO magic masks
// addition with even windows
// using 4 64 bit words to work on
// will saturate to UINT_256_MAX on overflow
void add(uint256_t x, uint256_t y, uint256_t &z){
    zero_out(z);

    ill_t x_tmp = 0;
    ill_t y_tmp = 0;
    ull_t z_tmp = 0;
    ull_t z_least = 0;
    for(int i = 0; i < UINT256_SIZE; i++){
        x_tmp =  (ill_t) x[i] & 0x00000000FFFFFFFF;
        y_tmp = ((ill_t) y[i] & 0x00000000FFFFFFFF) + z_tmp;
        z_tmp = x_tmp + y_tmp;
        z_least = (z_tmp) & 0x00000000FFFFFFFF;

        x_tmp =  (ill_t) ((x[i] & 0xFFFFFFFF00000000) >> 32);
        y_tmp = ((ill_t) ((y[i] & 0xFFFFFFFF00000000) >> 32));
        y_tmp += (z_tmp >> 32);
        z_tmp = x_tmp + y_tmp;

        z[i] = z_least | ((z_tmp & 0x00000000FFFFFFFF) << 32);
        z_tmp >>= 32;
    }

    if(z_tmp) max_out(z);
}

// TODO magic numbers
// TODO magic masks
// subtraction using evenly sized windows 
// (work is done w/ 32 bit windows on 2complement 64 bits signed int)
// 64 bit words required for now
// will saturate to zero on underflow
void sub(uint256_t x, uint256_t y, uint256_t &z){
    zero_out(z);

    ill_t x_tmp = 0;
    ill_t y_tmp = 0;
    ull_t z_tmp = 0;
    ull_t z_least = 0;
    for(int i = 0; i < UINT256_SIZE; i++){
        x_tmp =  (ill_t) x[i] & 0x00000000FFFFFFFF;
        y_tmp = ((ill_t) y[i] & 0x00000000FFFFFFFF) + z_tmp;
        z_tmp = (ull_t) (x_tmp < y_tmp);
        x_tmp |= z_tmp << 32;
        z_least = x_tmp - y_tmp;

        x_tmp =  (ill_t) ((x[i] & 0xFFFFFFFF00000000) >> 32);
        y_tmp = ((ill_t) ((y[i] & 0xFFFFFFFF00000000) >> 32)) + z_tmp;
        z_tmp = (ull_t) (x_tmp < y_tmp);
        x_tmp |= z_tmp << 32;
        z_least |= (x_tmp - y_tmp) << 32;

        z[i] = z_least | ((x_tmp - y_tmp) << 32);
    }

    if(z_tmp) zero_out(z);
}

// TODO magic masks
// CAUTION overflow is undefined behavior
void shl_deprecated(uint256_t x, int y, uint256_t &z){
    zero_out(z);
    int shift_in_window = y % WORD_SIZE;
    int left_stop = WORD_SIZE - shift_in_window;

    ull_t left_mask = (left_stop % WORD_SIZE == 0) 
            ? 0x0000000000000000
            : 0xFFFFFFFFFFFFFFFF >> left_stop;
    ull_t right_mask = 0xFFFFFFFFFFFFFFFF << shift_in_window;

    for(int i = 0; i < UINT256_SIZE; i++){
        int window_start = i * WORD_SIZE;
        int new_start = window_start + y;
        int slot_l = (new_start + WORD_SIZE) / WORD_SIZE;
        int slot_r = (window_start + y) / WORD_SIZE;

        if (slot_l < UINT256_SIZE) z[slot_l] |= (x[i] & left_mask) << shift_in_window;
        if (slot_r < UINT256_SIZE) z[slot_r] |= (x[i] & right_mask) << shift_in_window;
    }
}

// CAUTION overflow is undefined behavior
// CAUTION won't works if access to negative array index throws exception
void shl(uint256_t x, int y, uint256_t &z){
    zero_out(z);

    ull_t z_left, z_right = 0; 
    int shift_left2right = y % WORD_SIZE;
    int shift_right2left = WORD_SIZE - shift_left2right;

    ull_t left_mask = (shift_left2right % WORD_SIZE == 0)
        ? 0x0000000000000000
        : 0xFFFFFFFFFFFFFFFF >> shift_left2right;
    ull_t right_mask = 0xFFFFFFFFFFFFFFFF << shift_right2left;

    int window_start = (UINT256_SIZE - 1) * WORD_SIZE - y;
    int left_slot = (window_start + WORD_SIZE) / WORD_SIZE;
    int right_slot = window_start / WORD_SIZE;
    int i = UINT256_SIZE - 1;

    while(i >= 0){

        z_left = (x[left_slot] & left_mask);
        z_right = (x[right_slot] & right_mask);

        z_left <<= shift_left2right;
        z_right >>= shift_right2left;

        z[i] = z_left | z_right;

        --left_slot;
        --right_slot;
        --i;
    }
}

// TODO less branching ?
// CAUTION underflow is undefined behavior
void shr(uint256_t x, int y, uint256_t &z){
    zero_out(z);
    int shift_in_window = y % WORD_SIZE;
    int right_stop = WORD_SIZE - shift_in_window;

    ull_t right_mask = 0xFFFFFFFFFFFFFFFF << right_stop;
    ull_t left_mask = (shift_in_window == 0) 
            ? 0x0000000000000000
            : 0xFFFFFFFFFFFFFFFF >> shift_in_window;

    for(int i = UINT256_SIZE - 1; i >= 0; i--){
        int new_start = (i+1) * WORD_SIZE - y;
        int slot_r = (new_start - WORD_SIZE) / WORD_SIZE;
        int slot_l = new_start / WORD_SIZE;

        if (slot_r >= 0) z[slot_r] |= (x[i] & right_mask) >> shift_in_window;
        if (slot_l >= 0) z[slot_l] |= (x[i] & left_mask) >> shift_in_window;
    }
}

// TODO opti
// CAUTION overflow is undefined behavior
void mul(uint256_t x, uint256_t y, uint256_t &z){
    zero_out(z);

    uint256_t z_shl, z_add, z_acc = {0};
    for(int i = 0; i < UINT256_SIZE; i++){
        ull_t y_ = y[i];
        ull_t mask = 1;
        for(int j = 0; j < WORD_SIZE; j++){
            if(y_ & mask){
                shl(x, j + i * WORD_SIZE, z_shl);
                add(z_acc, z_shl, z_add);
                memcpy(z_acc, z_add, sizeof(uint256_t));
            }
            mask <<= 1;
        }
    }

    memcpy(z, z_acc, sizeof(uint256_t));
}

// CAUTION div by 0 will saturate both quotient and remainder
// CAUTION unsafe call to shl
// long division algorithm
void div(uint256_t x, uint256_t y, uint256_t &q, uint256_t &r){
    if (eq(y, UINT256_ZERO)) {
        memcpy(q, UINT256_MAX, sizeof(uint256_t));
        memcpy(r, UINT256_MAX, sizeof(uint256_t));
        return;
    }

    uint256_t r_acc = {0};
    uint256_t r_shl = {0};
    uint256_t q_ = {0};
    for(int i = most_sig_bit(x) ; i >= 0; i--){
        shl(r_acc , 1, r_shl);

        int slot = get_slot(i);
        int offset = i % WORD_SIZE;
        ull_t mask = 1;
        mask <<= offset;
        ull_t x_i = (x[slot] & mask) >> offset;

        r_shl[0] |= x_i;
        if(compare(r_shl, y) >= 0){
            sub(r_shl, y, r_acc);
            q_[slot] |= mask;
        } else memcpy(r_acc, r_shl, sizeof(uint256_t));
    }

    memcpy(q, q_, sizeof(uint256_t));
    memcpy(r, r_acc, sizeof(uint256_t));

}

inline int get_slot(int i){
    return i / WORD_SIZE;
}

inline int most_sig_bit(uint256_t x){
    for (int i = UINT256_SIZE - 1; i >= 0; i--){
        if(x[i] == 0) continue;
        else {
            int offset = 0;
            ull_t mask = 0x8000000000000000;
            do{
                if(x[i] & mask) return i * WORD_SIZE + (WORD_SIZE - offset - 1);
                ++offset;
                mask >>= 1;
            } while(offset < WORD_SIZE);
        }
    }
    return -1;
}

// presumably only acceptable for low hamming weights
int popcount256d(uint256_t x){
    int total = 0;
    for(int i = 0; i < UINT256_SIZE; i++){
        int count = 0;
        ull_t y = x[i];
        for(count = 0; y; count++){
            y &= y - 1;
        }
        total += count;
    }
    return total;
}

inline void print(uint256_t x){
    std::cout << " < ";
    int i = UINT256_SIZE - 1;
    while(i > 0){
        std::cout << x[i] << " | ";
        --i;
    }
    std::cout << x[0] << " > ";
}

inline uint256_t *from_bytes(void *src){
    uint256_t *dst = new uint256_t[1];
    memcpy(dst, src, sizeof(uint256_t));
    return dst;
}