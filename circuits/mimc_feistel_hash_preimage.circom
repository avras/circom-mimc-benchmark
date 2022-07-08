pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/mimcsponge.circom";

template FeistelHashPreimage() {
    signal input hash_left;
    signal input hash_right;
    signal input preimage_left;
    signal input preimage_right;

    component hasher = MiMCFeistel(220);
    hasher.xL_in <== preimage_left;
    hasher.xR_in <== preimage_right;
    hasher.k <== 0;

    var result_left = hasher.xL_out; 
    var result_right = hasher.xR_out; 
    hash_left === result_left;
    hash_right === result_right;
}

component main { public [ hash_left, hash_right ]} = FeistelHashPreimage();