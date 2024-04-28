#include "src/uint256.cpp"
#include <cassert>

int test_eq(){
    // equal
    uint256_t x0, y0 = {0};
    unsigned char powers_0[6] = {1,65,154,255,2,0};
    size_t len0 = 6;
    from_2pow(powers_0, len0, x0);
    from_2pow(powers_0, len0, y0);
    assert(eq(x0, y0));

    // not equal    
    uint256_t x1, y1 = {0};
    unsigned char powers_1[7] = {1,65,154,255,2,0, 77};
    size_t len1 = 7;
    from_2pow(powers_1, len1, x1);
    from_2pow(powers_0, len0, y1);
    assert(!eq(x1, y1));

    // uint256 max
    uint256_t x2 = {0};
    unsigned char powers_2[256];
    for(int i = 0; i < 256; i++){
        powers_2[i] = i;
    }
    from_2pow(powers_2, 256, x2);
    assert(eq(x2, UINT256_MAX));

    return 0;
}

int test_comp(){
    // equal
    uint256_t x0, y0 = {0};
    unsigned char powers_0[6] = {1,65,154,255,2,0};
    size_t len0 = 6;
    from_2pow(powers_0, len0, x0);
    from_2pow(powers_0, len0, y0);
    assert(compare(x0, y0) == 0);

    // not equal
    uint256_t x1, y1 = {0};
    unsigned char powers_1[7] = {1,65,154,255,2,0,77};
    size_t len1 = 7;
    from_2pow(powers_1, len1, x1);
    from_2pow(powers_0, len0, y1);
    assert(compare(x1, y1) == 1); // gt
    assert(compare(y1, x1) == -1); // lt
    
    return 0;
}

int test_add(){

    // 0 + 0 = 0
    uint256_t x_zero = {0};
    uint256_t z_zero = {0};
    uint256_t r_zero = {0};

    add(x_zero, x_zero, z_zero);
    assert(eq(z_zero, r_zero));

    //saturation
    uint256_t x3 = {0};
    uint256_t y3 = {0};
    uint256_t z3 = {0};
    unsigned char powers_x3[1] = {255};
    unsigned char powers_y3[3] = {1,2,255};

    from_2pow(powers_x3, 1, x3);
    from_2pow(powers_y3, 3, y3);

    add(x3, y3, z3);
    assert(eq(z3, UINT256_MAX));

    //w/out carry
    uint256_t x0, y0, z0, r0 = {0};
    unsigned char powers_x0[2] = {1,65};
    unsigned char powers_y0[1] = {2};
    unsigned char powers_r0[3] = {1,2,65};

    from_2pow(powers_x0, 2, x0);
    from_2pow(powers_y0, 1, y0);
    from_2pow(powers_r0, 3, r0);

    add(x0, y0, z0);
    assert(eq(z0, r0));

    // w/ carry
    uint256_t x1, y1, z1, r1 = {0};
    unsigned char powers_x1[1] = {63};
    unsigned char powers_y1[1] = {0};
    unsigned char powers_r1[1] = {64};

    from_2pow(powers_x1, 1, x1);
    from_2pow(powers_y1, 1, y1);
    from_2pow(powers_r1, 1, r1);

    add(x1, x1, z1);
    assert(eq(z1, r1));

    //
    uint256_t x2, y2, z2, z2_bis, r2 = {0};
    unsigned char powers_x2[4] = {128,212,7,8};
    unsigned char powers_y2[5] = {1,2,55,57,145};
    unsigned char powers_r2[9] = {1,2,55,57,145,128,212,7,8};

    from_2pow(powers_x2, 4, x2);
    from_2pow(powers_y2, 5, y2);
    from_2pow(powers_r2, 9, r2);

    add(x2, y2, z2);
    add(y2, x2, z2_bis);
    assert(eq(z2, r2));
    assert(eq(z2_bis, r2));
    assert(eq(z2, z2_bis));

    return 0;
}

// (x - y) + y = x
inline bool test_sub_add(uint256_t x, uint256_t y){
    uint256_t z, a = {0};

    sub(x, y, z);
    add(z, y, a);
    // print(x);
    // std::cout << std::endl;
    // print(y);
    // std::cout << std::endl;
    // print(z);
    // std::cout << std::endl;
    // print(a);
    // std::cout << std::endl;

    return eq(x, a);
}

int test_sub(){

    //0 - 0 = 0
    uint256_t x_zero = {0};
    uint256_t z_zero = {0};
    uint256_t r_zero = {0};

    sub(x_zero, x_zero, z_zero);
    assert(eq(z_zero, r_zero));

    // x - x  = 0
    uint256_t x_x, z_x = {0};

    sub(x_x,x_x,z_x);
    assert(eq(z_x, r_zero));

    //saturation
    uint256_t x3 = {0};
    uint256_t y3 = {0};
    uint256_t z3 = {0};
    unsigned char powers_x3[1] = {255};
    unsigned char powers_y3[3] = {1,2,255};

    from_2pow(powers_x3, 1, x3);
    from_2pow(powers_y3, 3, y3);

    sub(x3, y3, z3);
    // print(x3);
    // std::cout << std::endl;
    // print(y3); 
    // std::cout << std::endl;
    // print(z3);
    // std::cout << std::endl;
    // print(r_zero);  
    // std::cout << std::endl;
    assert(eq(z3, r_zero));

    // x - x = 0
    uint256_t x0, y0, z0, r0 = {0};
    unsigned char powers_x0[2] = {1,65};
    unsigned char powers_y0[2] = {1,65};

    from_2pow(powers_x0, 2, x0);
    from_2pow(powers_y0, 2, y0);

    sub(x0, y0, z0);
    assert(eq(z0, r_zero));

    // minus one
    uint256_t x1, y1, z1, r1 = {0};
    unsigned char powers_x1[1] = {63};
    unsigned char powers_y1[1] = {0};

    from_2pow(powers_x1, 1, x1);
    from_2pow(powers_y1, 1, y1);
    from_ill(r1,0,0,0,9223372036854775807);

    sub(x1, y1, z1);
    // print(x1);
    // std::cout << std::endl;
    // print(y1); 
    // std::cout << std::endl;
    // print(z1);
    // std::cout << std::endl;
    // print(r1);  
    // std::cout << std::endl;
    assert(eq(z1, r1));

    // 1234 - 1134 = 100
    uint256_t x4, y4, z4, r4 = {0};
    from_ill(x4, 0, 1234, 0, 1);
    from_ill(y4, 0, 1134, 0, 1);
    from_ill(r4, 0, 100, 0, 0);

    sub(x4, y4, z4);
    // print(x4);
    // std::cout << std::endl;
    // print(y4); 
    // std::cout << std::endl;
    // print(z4);
    // std::cout << std::endl;
    // print(r4);  
    // std::cout << std::endl;
    assert(eq(z4, r4));

    // 2^128 - 2^127 = 2^127	
    uint256_t x2, y2, z2  = {0};
    unsigned char powers_x2[1] = {128};
    unsigned char powers_y2[1] = {127};
    
    from_2pow(powers_x2, 1, x2);
    from_2pow(powers_y2, 1, y2);

    sub(x2, y2, z2);
    // print(x2);
    // std::cout << std::endl;
    // print(y2);
    // std::cout << std::endl;
    // print(z2);
    // std::cout << std::endl;
    assert(eq(z2, y2));

    // more tests
    uint256_t x5, y5, z5, r5 = {0};
    from_ill(x5, 0, 100, 0, 0);
    from_ill(y5, 0, 0, 503, 0);
    ill_t tmp = (ill_t) 0xFFFFFFFFFFFFFFFF - 503 + 1;
    from_ill(r5, 0, 99, tmp, 0);

    sub(x5, y5, z5);
    // print(x5);
    // std::cout << std::endl;
    // print(y5); 
    // std::cout << std::endl;
    // print(z5);
    // std::cout << std::endl;
    // print(r5);  
    // std::cout << std::endl;
    assert(eq(z5, r5));

    uint256_t zz5 = {0};
    add(r5, y5, zz5);
    // print(y5);
    // std::cout << std::endl;
    // print(z5); 
    // std::cout << std::endl;
    // print(zz5);
    // std::cout << std::endl;
    // print(x5);  
    // std::cout << std::endl;
    assert(eq(x5, zz5));

    // ADD SUB
    assert(test_sub_add(x4, y4));
    assert(test_sub_add(x5, y5));
    // std::cout << "passed sub_add " << std::endl;

    return 0;
}

int test_from_ill(){
    uint256_t x = {0};
    from_ill(x, 1, 2, 3, 4);
    std::cout << "from_ill: 1 2 3 4 --> ";
    print(x);
    std::cout << std::endl;
    
    from_ill(x, 0, 0, 0, 4);
    std::cout << "from_ill: 0, 0, 0, 4 --> ";
    print(x);
    std::cout << std::endl;

    from_ill(x, 99999, 1234567, 0, 987654321);
    std::cout << "from_ill: 99999, 1234567, 0, 987654321 --> ";
    print(x);
    std::cout << std::endl;

    return 0;
}

int test_from_bytes(){
    uint256_t r = {0};
    from_ill(r, 4, 3, 2, 1);
    uint256_t *x = from_bytes(&r);
    assert(eq(r, *x));

    return 0;
}

int test_shl(){
    uint256_t x, z, r = {0};
    from_ill(x, 0, 4, 4, 4);
    from_ill(r, 0, 16, 16, 16);
    // std::cout << "shl: 4 2 " << std::endl;
    // print(x);
    // std::cout << std::endl;
    shl(x,2,z);
    // print(z);
    // std::cout << std::endl;
    assert(eq(z, r));

    from_ill(x, 0, 0, 4, 4);
    from_ill(r, 0, 4, 4, 0);
    // std::cout << "shl: 4 64 " << std::endl;
    // print(x);
    // std::cout << std::endl;
    shl(x,64,z);
    // print(z);
    // std::cout << std::endl;
    assert(eq(z, r));

    from_ill(x, 0, 0, 4, 4);
    from_ill(r, 0, 16, 16, 0);
    // std::cout << "shl: 4 66 " << std::endl;
    // print(x);
    // std::cout << std::endl;
    shl(x,66,z);
    // print(z);
    // std::cout << std::endl;
    assert(eq(z,r));

    return 0;
}

int test_shr(){
    uint256_t x, z, r = {0};
    from_ill(x, 4, 4, 4, 0);
    from_ill(r, 1, 1, 1, 0);
    // std::cout << "shr: 4 2 " << std::endl;
    // print(x);
    // std::cout << std::endl;
    shr(x,2,z);
    // print(z);
    // std::cout << std::endl;
    assert(eq(z, r));

    from_ill(r, 0, 0, 4, 4);
    from_ill(x, 0, 4, 4, 0);
    // std::cout << "shr: 4 64 " << std::endl;
    // print(x);
    // std::cout << std::endl;
    shr(x,64,z);
    // print(z);
    // std::cout << std::endl;
    assert(eq(z, r));

    from_ill(r, 0, 0, 4, 4);
    from_ill(x, 0, 16, 16, 0);
    // std::cout << "shr: 4 66 " << std::endl;
    // print(x);
    // std::cout << std::endl;
    shr(x,66,z);
    // print(z);
    // std::cout << std::endl;
    assert(eq(z,r));

    return 0;
}

int test_popcount256d(){
    uint256_t x = {0};
    unsigned char powers[6] = {1,65,154,255,2,0};
    size_t len = sizeof(powers) / sizeof(powers[0]);
    from_2pow(powers, len, x);
    assert(popcount256d(x) == 6);

    return 0;
}

int test_mul(){

    uint256_t x, y, z, r = {0};
    from_ill(x, 0, 4, 4, 4);
    from_ill(y, 0, 0, 0, 2);
    from_ill(r, 0, 8, 8, 8);
    // mul(x, y, z);
    // print(x);
    // std::cout << std::endl;
    // print(y);
    // std::cout << std::endl;
    // print(z);
    // std::cout << std::endl;
    // print(r);
    // std::cout << std::endl;
    // assert(eq(z, r));
    mul(y, x, z);
    // print(z);
    // std::cout << std::endl;
    assert(eq(z, r));

    from_ill(x, 0, 4, 4, 4);
    from_ill(y, 0, 0, 0, 1);
    mul(x, y, z);
    // print(x);
    // std::cout << std::endl;
    // print(y);
    // std::cout << std::endl;
    // print(z);
    // std::cout << std::endl;
    assert(eq(z, x));

    from_ill(x, 0, 4, 4, 4);
    from_ill(y, 0, 0, 0, 0);
    from_ill(r, 0, 0, 0, 0);
    mul(x, y, z);
    // print(x);
    // std::cout << std::endl;
    // print(y);
    // std::cout << std::endl;
    // print(z);
    // std::cout << std::endl;
    // print(r);
    // std::cout << std::endl;
    assert(eq(z, r));
    mul(y, x, z);
    // print(z);
    // std::cout << std::endl;
    assert(eq(z, r));

    from_ill(x, 0, 4, 4, 4);
    from_ill(y, 0, 0, 1, 0);
    from_ill(r, 4, 4, 4, 0);
    mul(x, y, z);
    // print(x);
    // std::cout << std::endl;
    // print(y);
    // std::cout << std::endl;
    // print(z);
    // std::cout << std::endl;
    // print(r);
    // std::cout << std::endl;
    assert(eq(z, r));
    // mul(y, x, z);
    // print(z);
    // std::cout << std::endl;
    assert(eq(z, r));

    return 0;

}

int test_most_sig(){
    uint256_t x = {0};
    from_ill(x, 0, 4, 4, 4);
    assert(most_sig_bit(x) == 130);

    from_ill(x, 0, 0, 0, 0);
    assert(most_sig_bit(x) == -1);
    
    from_ill(x, 0, 0, 0, 1);
    assert(most_sig_bit(x) == 0);

    return 0;

}

int test_div(){

    uint256_t x, y, z_q, z_r, e_q, e_r = {0};

    from_ill(x, 0, 0, 0, 12);
    from_ill(y, 0, 0, 0, 4);
    from_ill(e_q, 0, 0, 0, 3);
    from_ill(e_r, 0, 0, 0, 0);
    div(x, y, z_q, z_r);
    // print(x);
    // std::cout << std::endl;
    // print(y);
    // std::cout << std::endl;
    // print(z_q);
    // std::cout << std::endl;
    // print(e_q);
    // std::cout << std::endl;
    // print(z_r);
    // std::cout << std::endl;
    // print(e_r);
    // std::cout << std::endl;
    assert(eq(z_q, e_q));
    assert(eq(z_r, e_r));

    from_ill(x, 0, 4, 4, 4);
    from_ill(y, 0, 0, 0, 2);
    from_ill(e_q, 0, 2, 2, 2);
    from_ill(e_r, 0, 0, 0, 0);
    div(x, y, z_q, z_r);
    // print(x);
    // std::cout << std::endl;
    // print(y);
    // std::cout << std::endl;
    // print(z_q);
    // std::cout << std::endl;
    // print(e_q);
    // std::cout << std::endl;
    // print(z_r);
    // std::cout << std::endl;
    // print(e_r);
    // std::cout << std::endl;
    assert(eq(z_q, e_q));
    assert(eq(z_r, e_r));

    from_ill(x, 0, 4, 4, 4);
    from_ill(y, 0, 0, 0, 1);
    from_ill(e_r, 0, 0, 0, 0);
    div(x, y, z_q, z_r);
    // print(x);
    // std::cout << std::endl;
    // print(y);
    // std::cout << std::endl;
    // print(z_q);
    // std::cout << std::endl;
    // print(x);
    // std::cout << std::endl;
    // print(z_r);
    // std::cout << std::endl;
    // print(e_r);
    // std::cout << std::endl;
    assert(eq(z_q, x));
    assert(eq(z_r, e_r));

    from_ill(x, 0, 4, 4, 4);
    from_ill(y, 0, 1234567, 0, 0);
    from_ill(e_r, 0, 0, 0, 0);
    div(x, y, z_q, z_r);
    // print(x);
    // std::cout << std::endl;
    // print(y);
    // std::cout << std::endl;
    // print(z_q);
    // std::cout << std::endl;
    // print(x);
    // std::cout << std::endl;
    // print(z_r);
    // std::cout << std::endl;
    // print(e_r);
    // std::cout << std::endl;
    assert(eq(z_q, e_r));
    assert(eq(z_r, x));

    from_ill(x, 0, 4, 4, 4);
    from_ill(y, 0, 0, 0, 0);
    from_ill(e_r, 0, 0, 0, 0);
    div(x, y, z_q, z_r);
    // print(x);
    // std::cout << std::endl;
    // print(y);
    // std::cout << std::endl;
    // print(z);
    // std::cout << std::endl;
    // print(r);
    // std::cout << std::endl;
    assert(eq(z_q, UINT256_MAX));
    assert(eq(z_r, UINT256_MAX));

    from_ill(x, 0, 4, 4, 4);
    from_ill(y, 0, 0, 1, 0);
    from_ill(e_q, 0, 0, 4, 4);
    from_ill(e_r, 0, 0, 0, 4);
    div(x, y, z_q, z_r);
    // print(x);
    // std::cout << std::endl;
    // print(y);
    // std::cout << std::endl;
    // print(z_q);
    // std::cout << std::endl;
    // print(e_q);
    // std::cout << std::endl;
    // print(z_r);
    // std::cout << std::endl;
    // print(e_r);
    // std::cout << std::endl;
    assert(eq(z_r, e_r));
    mul(y, z_q, e_q);
    add(e_q, z_r, e_r);
    // print(z_q);
    // std::cout << std::endl;
    assert(eq(e_r, x));

    return 0;

}


void run_all_tests(){
    std::cout
        << " *** uint256 arithmetic test *** "
        << std::endl
        << " EQ : "
        << (test_eq() == 0 ? "OK" : "FAIL")
        << std::endl
        << " COMP : "
        << (test_comp() == 0 ? "OK" : "FAIL")
        << std::endl
        << " ADD : "
        << (test_add() == 0 ? "OK" : "FAIL")
        << std::endl
        << " SUB : "
        << (test_sub() == 0 ? "OK" : "FAIL")
        // << std::endl
        // << " FROM_ILL : "
        // << (test_from_ill() == 0 ? "OK" : "FAIL")
        << std::endl
        << " FROM_BYTES : "
        << (test_from_bytes() == 0 ? "OK" : "FAIL")
        << std::endl
        << " SHL : "
        << (test_shl() == 0 ? "OK" : "FAIL")
        << std::endl
        << " SHR : "
        << (test_shr() == 0 ? "OK" : "FAIL")
        << std::endl
        << " POPCOUNT256D : "
        << (test_popcount256d() == 0 ? "OK" : "FAIL")
        << std::endl
        << " MUL : "
        << (test_mul() == 0 ? "OK" : "FAIL")
        << std::endl
        << " MOST_SIG : "
        << (test_most_sig() == 0 ? "OK" : "FAIL")
        << std::endl
        << " DIV : "
        << (test_div() == 0 ? "OK" : "FAIL")
        << std::endl
        << " *** Exiting *** "
        << std::endl;

        test_div();

}