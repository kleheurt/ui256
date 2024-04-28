#include <iostream>
#include <cstdint>
#include <chrono>
#include "include/workload.h"
#include "src/bellford.cpp"
#include "src/test_ui256.cpp"
#include "src/test_graph.cpp"

#ifdef _MSC_VER
#include <intrin.h>

static inline uint64_t get_cycles(){
    return __rdtsc();
}

#else

static inline uint64_t get_cycles(){
    uint64_t t;
    __asm__ __volatile__("rdtsc" : "=A"(t));
    return t;
}

#endif

static const int WORKLOAD_SIZE = 0;

Edge** get_test_data(){
    Edge** bf_test = new Edge*[3];
    for(int i = 0; i < 3; i++){
        bf_test[i] = new Edge;
        *bf_test[i] = BF_TEST[i];
    }
    return bf_test;
}

// PLACEHOLDER
inline void workload(int i){
    int z;
    for(int j = 0; j < i; j++){
        bellford(get_test_data(), 0, 3, 3);
    }
}

void eval_perf(WorkloadStats* stats){
    auto t_start = std::chrono::high_resolution_clock::now();
    uint64_t c_start = get_cycles();
    workload(WORKLOAD_SIZE);
    uint64_t c_end = get_cycles();
    auto t_end = std::chrono::high_resolution_clock::now();
    auto t_between = std::chrono::duration_cast<std::chrono::nanoseconds>(t_end - t_start);

    stats->cycles.push_back(c_end - c_start);
    stats->times.push_back(t_between.count());
}

// void test_ui256(){
//     uint256_t x = {0};
//     unsigned char powers[6] = {1,65,154,255,2,0};
//     size_t len = sizeof(powers) / sizeof(powers[0]);
//     from_2pow(powers, len, x);
//     print(x);
// }

void do_bf(){
    std::cout << " *** Bellman-Ford *** " << std::endl; 

    WorkloadStats* stats = new WorkloadStats;
    eval_perf(stats);
    std::cout << "avg cycles: " << avg(stats->cycles) << std::endl;
    std::cout << "avg time: " << avg(stats->times) << " ns" << std::endl;
    delete stats;

    auto test_data = get_test_data();
    std::cout 
        << "BF test: " 
        << (bellford(test_data, 0, 3, 3) ? "no cycle" : "cycle !") 
        << std::endl
        << " *** Exiting *** " 
        << std::endl;
}

int main(){

    run_all_tests();
    test_rev();

    return 0;
}