cd "$(dirname "$0")"
cd ../build

echo "--------------"
echo "Proving time"
echo "--------------"
time snarkjs plonk prove mimc_feistel_preimage_final.zkey feistel_witness.wtns proof.json public.json

echo "--------------"
echo "Verifier time"
echo "--------------"
time snarkjs plonk verify mimc_feistel_preimage_verification_key.json public.json proof.json
