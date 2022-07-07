cd "$(dirname "$0")"
cd ../build

echo "--------------"
echo "Proving time"
echo "--------------"
time snarkjs plonk prove mimc_preimage_final.zkey witness.wtns proof.json public.json

echo "--------------"
echo "Verifier time"
echo "--------------"
time snarkjs plonk verify mimc_preimage_verification_key.json public.json proof.json
