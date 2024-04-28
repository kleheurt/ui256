#include "graph.cpp"
#include <iostream>

static Pair test_addr[5] = {
    {0, 1},
    {1, 2},
    {3, 0},
    {2, 4},
    {4, 3}
};

static Pair test_reserves[] = {
    {1000, 1000}, // 0
    {1000, 1000}, // 1
    {1000, 1000}, // 2
    {1000, 1000}, // 3
    {1000, 1000}  // 4
};

int test_dfs(){
    lli_t **graph = new lli_t*[5];
    graph[0] = new lli_t[5]{0, 1, 1, 0, 0};
    graph[1] = new lli_t[5]{1, 0, 0, 1, 0};
    graph[2] = new lli_t[5]{1, 0, 0, 1, 1};
    graph[3] = new lli_t[5]{0, 1, 1, 0, 0};
    graph[4] = new lli_t[5]{0, 0, 1, 0, 0};

    std::cout << "dfs test" << std::endl;
    auto paths = dfs_matrix(graph, 0, 5);
    std::cout << "Paths from 0: " << std::endl;
    for(auto path : paths){
        for(auto node : path){
            std::cout << node << " ";
        }
        std::cout << std::endl;
    }

    return 0;
}

int test_rev(){

    std::vector<std::vector<size_t>> paths;
    paths.push_back({0, 1, 3, 4, 2});

    std::cout << "Revenue test" << std::endl;
    std::cout << "paths : " << std::endl;
    print_vec_of_vec(&paths);
    
    std::cout << "revenues : " << std::endl;
    auto rev = revenue(&paths, test_reserves);
    print_vec(&rev);

    return 0;

}