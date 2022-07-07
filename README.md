# MiMC7 preimage proof in `circom`

Based on code organization and scripts at https://github.com/akinovak/circom2-example

## Overview
File organization
- The `scripts` directory has the script for generating the circuit files and benchmarking the prover/verifier.
- The `circuits` directory has the `circom` circuits

## Instructions for measuring the prover and verifier time
1. `npm install`
2. Run `./scripts/build-mimc-preimage-circuits.sh`. This needs to be run only once.
3. Run `./scripts/benchmark-mimc-preimage.sh` to get the proving and verification times.