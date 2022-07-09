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

cd mimc_feistel_hash_preimage_js
node generate_witness.js mimc_feistel_hash_preimage.wasm ../mimc_feistel_preimage_input.json ../plonk_feistel_witness.wtns

cd ..
snarkjs plonk setup mimc_feistel_hash_preimage.r1cs powersOfTau28_hez_final_14.ptau mimc_feistel_preimage_plonk_final.zkey
snarkjs zkey export verificationkey mimc_feistel_preimage_plonk_final.zkey mimc_feistel_preimage_plonk_verification_key.json
