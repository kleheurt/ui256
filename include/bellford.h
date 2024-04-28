#ifndef BELLFORD_H
#define BELLFORD_H

#include <climits>
#include <iostream>

// TODO full precision
typedef unsigned long int bf_uint;     // 32 bits
typedef long long int bf_int;          // 64 bits
typedef unsigned int bf_id; // 64 bits

typedef struct Edge{
    bf_id src;
    bf_id dst;
    bf_uint r0;
    bf_uint r1;
    bf_int p;
} Edge;

static const auto EDGE_SIZE = sizeof(Edge);
static const auto BF_INFINITY = LLONG_MAX; // should match bf_int max value
static const bf_uint DECIMALS = 1000;

void reserves2prices(Edge* edges[]);
bool bf(Edge* edges[], bf_id src, unsigned int n_vertices);

static const Edge BF_TEST[] = {
    {0, 1, 10000, 10000},
    {1, 2, 20000, 10000},
    {2, 0, 10000, 40000}
};

void inline print(Edge* edges[], size_t n_edges){
    for(int i = 0; i < n_edges; i++){
        std::cout << "src: " << edges[i]->src << " | dst: " << edges[i]->dst << " | r0: " << edges[i]->r0 << " | r1: " << edges[i]->r1 << " | p: " << edges[i]->p << std::endl;
    }
}

bf_int inline div(bf_uint a, bf_uint b){
    return b == 0 ? BF_INFINITY : (bf_int) (a * DECIMALS / b); 
}

#endif // BELLFORD_H