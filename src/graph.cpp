#include "include/graph.h"
#include "price.cpp"
#include <vector>
#include <stack>
#include <iostream>

void stack_to_vec(std::stack<size_t> *s, std::vector<size_t> *v){
    while(!s->empty()){
        v->push_back(s->top());
        s->pop();
    }
    std::reverse(v->begin(), v->end());
    for(auto e : *v){
        s->push(e);
    }
}

void print_stack(std::stack<size_t> *s){
    std::vector<size_t> v;
    stack_to_vec(s, &v);
    std::cout << "S: ";
    for(auto e : v){
        std::cout << e << " ";
    }
}

template <typename T>
void print_vec(std::vector<T> *v){
    std::cout << "V: ";
    for(auto e : *v){
        std::cout << e << " ";
    }
}

template <typename T>
void print_vec_of_vec(std::vector<std::vector<T>> *v){
    for(auto path : *v){
       print_vec(&path);
       std::cout << " | ";
    }
    std::cout << std::endl;
}


std::vector<lli_t> revenue(std::vector<std::vector<size_t>> *paths, Pair *reserves){
    std::vector<lli_t> rev;
    lli_t a_in;
    for(int i = 0; i < paths->size(); i++){
        a_in = ARB_VOL;
        auto path = (*paths)[i];
        for(int j = 0; j < path.size(); j++){
            auto index = path[j];
            Pair pool = reserves[index];
            a_in = a_out(pool.y, pool.x, a_in);
            std::cout << a_in << " ";
        }
        rev.push_back(a_in);
    }
    std::cout << std::endl;
    return rev;
}

// retrieve all cyles from node n to node n in graph
std::vector<std::vector<size_t>> dfs_matrix(lli_t **graph, size_t src, size_t len){
    std::vector<std::vector<size_t>> paths;
    std::stack<size_t> s;
    bool *visited = new bool[len]{false};
    size_t node;
    s.push(src);
    while(!s.empty()){
        print_stack(&s); 
        node = s.top();
        s.pop();
        visited[node] = true;
        for(int i = 0; i < len; i++){
            if(graph[node][i]) {
                if (!visited[i]){
                    s.push(i);
                } else if(i == src) {
                    std::cout << "found cycle --> ";
                    std::vector<size_t> stack_content;
                    stack_to_vec(&s, &stack_content);
                    stack_content.push_back(node);
                    print_vec(&stack_content);
                    paths.push_back(stack_content);
                }
            } 
        }
        std::cout << std::endl;
    }
    delete[] visited;
    return paths;
}

// std::vector<std::vector<size_t>> rec_dfs_matrix(lli_t **graph, size_t node, size_t len, bool *wip, bool *done){
//     wip[node] = true;
//     lli_t *neighbors = graph[node];
//     for(int i = 0; i < len; i++){
//         lli_t n = neighbors[node];
//         if(n && !wip[i]){
//             rec_dfs_matrix(graph, i, len, wip, done);
//         } else if(n && wip[i] && !done[i]){
//             std::cout << "found cycle" << std::endl;
//         }
//     } 
//     done[node] = true;
// 
// }