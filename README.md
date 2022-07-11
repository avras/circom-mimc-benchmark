# MiMC7 preimage proof in `circom`

Based on code organization and scripts at https://github.com/akinovak/circom2-example

## Overview
File organization
- The `scripts` directory has the script for generating the circuit files and benchmarking the prover/verifier.
- The `circuits` directory has the `circom` circuits

## Instructions for measuring the prover and verifier time
1. `npm install -g snarkjs`
2. `cargo install zkutil`
3. *(Optional)* Clone the [rapidsnark](https://github.com/iden3/rapidsnark) repository in a sibling location to the current repository and compile the prover. The `scripts/build-mimc-*.sh` scripts attempt the following command: `cp ../rapidsnark/build/prover .`
4. `npm install`
5. Run the following. This needs to be run only once.
    ```
    ./scripts/build-mimc-preimage-circuits.sh
    ./scripts/build-mimc-feistel-preimage-circuits.sh
    ```
6. For `snarkjs` proving and verification times using PLONK and Groth16, run the following
    ```
    ./scripts/benchmark-snarkjs-mimc-preimage.sh
    ./scripts/benchmark-snarkjs-mimc-feistel-preimage.sh
    ```
7. For `zkutil` proving and verification times using Groth16, run the following
    ```
    ./scripts/benchmark-zkutil-mimc-preimage.sh
    ./scripts/benchmark-zkutil-mimc-feistel-preimage.sh
    ```
8. For `rapidsnark` proving time using Groth16, run the following
    ```
    ./scripts/benchmark-rapidsnark-mimc-preimage.sh
    ./scripts/benchmark-rapidsnark-mimc-feistel-preimage.sh
    ```