#include "include/graph.h"

inline lli_t a_out(lli_t r_out, lli_t r_in, lli_t a_in){
    return a_in == 0 ? 0 : r_out / (1 + (r_in / a_in));
}

inline lli_t price(lli_t r_out, lli_t r_in, lli_t a_in){
    return r_out == 0 ? 0 : (r_in / r_out) + (a_in / r_out);
}

inline lli_t swap_output(lli_t r_in, lli_t r_out, lli_t delta_in){
    return r_in * r_out / (r_in + delta_in) - r_out;
}