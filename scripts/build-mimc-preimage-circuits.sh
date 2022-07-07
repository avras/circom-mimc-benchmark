cd "$(dirname "$0")"

mkdir -p ../build

cd ../build

if [ -f ./powersOfTau28_hez_final_14.ptau ]; then
    echo "powersOfTau28_hez_final_14.ptau already exists. Skipping."
else
    echo 'Downloading powersOfTau28_hez_final_14.ptau'
    wget https://hermez.s3-eu-west-1.amazonaws.com/powersOfTau28_hez_final_14.ptau
fi

circom ../circuits/mimc_hash_preimage.circom --r1cs --wasm --sym

snarkjs r1cs export json mimc_hash_preimage.r1cs mimc_hash_preimage.r1cs.json

node ../scripts/create_mimc_preimage_inputs.js mimc_preimage_input.json

cd mimc_hash_preimage_js
node generate_witness.js mimc_hash_preimage.wasm ../mimc_preimage_input.json ../witness.wtns

cd ..
snarkjs plonk setup mimc_hash_preimage.r1cs powersOfTau28_hez_final_14.ptau mimc_preimage_final.zkey
snarkjs zkey export verificationkey mimc_preimage_final.zkey mimc_preimage_verification_key.json
