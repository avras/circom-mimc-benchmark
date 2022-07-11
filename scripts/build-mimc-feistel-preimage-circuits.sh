cd "$(dirname "$0")"

mkdir -p ../build

cd ../build

if [ -f ./powersOfTau28_hez_final_14.ptau ]; then
    echo "powersOfTau28_hez_final_14.ptau already exists. Skipping."
else
    echo 'Downloading powersOfTau28_hez_final_14.ptau'
    wget https://hermez.s3-eu-west-1.amazonaws.com/powersOfTau28_hez_final_14.ptau
fi

circom ../circuits/mimc_feistel_hash_preimage.circom --r1cs --wasm --sym

snarkjs r1cs export json mimc_feistel_hash_preimage.r1cs mimc_feistel_hash_preimage.r1cs.json

node ../scripts/create_mimc_feistel_preimage_inputs.js mimc_feistel_preimage_input.json

snarkjs wc mimc_feistel_hash_preimage_js/mimc_feistel_hash_preimage.wasm mimc_feistel_preimage_input.json mimc_feistel_preimage_witness.wtns

snarkjs plonk setup mimc_feistel_hash_preimage.r1cs powersOfTau28_hez_final_14.ptau mimc_feistel_preimage_plonk_final.zkey
snarkjs zkey export verificationkey mimc_feistel_preimage_plonk_final.zkey mimc_feistel_preimage_plonk_verification_key.json

# Groth16 setup

snarkjs groth16 setup mimc_feistel_hash_preimage.r1cs powersOfTau28_hez_final_14.ptau mimc_feistel_hash_preimage_0000.zkey

snarkjs zkey contribute mimc_feistel_hash_preimage_0000.zkey mimc_feistel_hash_preimage_0001.zkey --name="Frist contribution" -v -e="Random entropy"
snarkjs zkey contribute mimc_feistel_hash_preimage_0001.zkey mimc_feistel_hash_preimage_0002.zkey --name="Second contribution" -v -e="Another random entropy"
snarkjs zkey beacon mimc_feistel_hash_preimage_0002.zkey mimc_feistel_preimage_groth16_final.zkey 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f 10 -n="Final Beacon phase2"

snarkjs zkey export verificationkey mimc_feistel_preimage_groth16_final.zkey mimc_feistel_preimage_groth16_verification_key.json

if [ -f ./prover ]; then
    echo "rapidsnark prover exists. Skipping"
elif [ -f ./../../rapidsnark/build/prover ]; then
# Script assumes this file already exists in a sibling directory to current repo.
# Follow instructions at https://github.com/iden3/rapidsnark
    echo "Copying rapidsnark prover from ../../rapidsnark/build/"
    cp ../../rapidsnark/build/prover .
else
    echo "ERROR: rapidsnark/build/prover not found"
    echo "Script assumes this file already exists in a sibling directory to current repo."
    echo "Follow instructions at https://github.com/iden3/rapidsnark"
    exit 1
fi

if which zkutil >/dev/null; then
    echo "zkutil is already installed"
else
    echo "zkutil is not installed. Run: cargo install zktuil"
    exit 1
fi

# zkutil setup
zkutil setup -c mimc_feistel_hash_preimage.r1cs -p mimc_feistel_params.bin
