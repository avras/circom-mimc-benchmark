cd "$(dirname "$0")"
cd ../build

echo "--------------"
echo "MiMC Preimage"
echo "zkutil Groth16 proving time"
echo "--------------"
time zkutil prove -c mimc_feistel_hash_preimage.r1cs -p mimc_feistel_params.bin --public mimc_feistel_preimage_input.json -w mimc_feistel_preimage_witness.wtns

echo "--------------"
echo "MiMC Preimage"
echo "zkutil Groth16 verification time"
echo "--------------"
time zkutil verify -p mimc_feistel_params.bin --public mimc_feistel_preimage_input.json