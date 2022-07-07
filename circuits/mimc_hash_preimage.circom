pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/mimc.circom";

template HashPreimage() {
    signal input hash;
    signal input preimage;

    component hasher = MiMC7(91);
    hasher.x_in <== preimage;
    hasher.k <== 0;

    var result = hasher.out; 
    hash === result;
}

component main { public [ hash ]} = HashPreimage();