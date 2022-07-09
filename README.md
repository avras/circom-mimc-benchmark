# MiMC7 preimage proof in `circom`

Based on code organization and scripts at https://github.com/akinovak/circom2-example

## Overview
File organization
- The `scripts` directory has the script for generating the circuit files and benchmarking the prover/verifier.
- The `circuits` directory has the `circom` circuits

## Instructions for measuring the prover and verifier time
1. `npm install`
2. Run the following. This needs to be run only once.
    ```
    ./scripts/build-mimc-preimage-circuits.sh
    ./scripts/build-mimc-feistel-preimage-circuits.sh
    ```
3. For snarkjs proving and verification times using PLONK, run the following
    ```
    ./scripts/benchmark-snarkjs-mimc-preimage.sh
    ./scripts/benchmark-snarkjs-mimc-feistel-preimage.sh
    ```