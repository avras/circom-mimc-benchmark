cd "$(dirname "$0")"
cd ../build

echo "--------------"
echo "MiMC Preimage"
echo "snarkjs PLONK proving time"
echo "--------------"
time snarkjs plonk prove mimc_preimage_plonk_final.zkey plonk_witness.wtns proof.json public.json

echo "--------------"
echo "MiMC Preimage"
echo "snarkjs PLONK verifier time"
echo "--------------"
time snarkjs plonk verify mimc_preimage_plonk_verification_key.json public.json proof.json
