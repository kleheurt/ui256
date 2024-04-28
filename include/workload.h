#ifndef WORKLOAD_H
#define WORKLOAD_H

#include <vector>

// workload statistics
struct WorkloadStats{
    int i; // number of iterations
    std::vector<int> cycles; // list of cycles per iteration
    std::vector<int> times; // list of times per iteration
};

int avg(std::vector<int> v){
    int sum = 0;
    int size = v.size();
    for(int i = 0; i < size; i++){
        sum += v[i];
    }
    return size == 0 ? 0 : sum / size;
}

#endif // WORKLOAD_H