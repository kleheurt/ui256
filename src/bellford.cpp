#include "../include/bellford.h"
#include <vector>
#include <iostream>

// TODO price impact
void reserves2prices(Edge* edges[], size_t n_edges){
    for(int i = 0; i < n_edges; ++i){
        edges[i]->p = div(edges[i]->r0, edges[i]->r1) - DECIMALS; 
    }
}

void r2p_arr(bf_uint r0[], bf_uint r1[], bf_int p[], size_t n_edges){
    for(int i = 0; i < n_edges; ++i){
        p[i] = div(r0[i], r1[i]) - DECIMALS;
    }
}

bool bellford(Edge* edges[], bf_id src, unsigned int n_vertices, size_t n_edges){
    reserves2prices(edges, n_edges);
    print(edges, n_edges);

    std::vector<bf_int> dist(n_vertices, BF_INFINITY);
    dist[src] = 0;

    for(int i = 0; i < n_vertices; i++){
        for(int j = 0; j < n_edges; j++){
            if(dist[edges[j]->src] != BF_INFINITY && dist[edges[j]->src] + edges[j]->p < dist[edges[j]->dst]){
                dist[edges[j]->dst] = dist[edges[j]->src] + edges[j]->p;
            }
        }
    }

    for(int i = 0; i < n_edges; i++){
        if(dist[edges[i]->src] != BF_INFINITY && dist[edges[i]->src] + edges[i]->p < dist[edges[i]->dst]){
            return false;
        }
    }
    return true;
}