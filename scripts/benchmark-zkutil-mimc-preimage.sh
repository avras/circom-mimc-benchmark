cd "$(dirname "$0")"
cd ../build

echo "--------------"
echo "MiMC Preimage"
echo "zkutil Groth16 proving time"
echo "--------------"
time zkutil prove -c mimc_hash_preimage.r1cs -p mimc_params.bin --public mimc_preimage_input.json -w mimc_preimage_witness.wtns

echo "--------------"
echo "MiMC Preimage"
echo "zkutil Groth16 verification time"
echo "--------------"
time zkutil verify -p mimc_params.bin --public mimc_preimage_input.json