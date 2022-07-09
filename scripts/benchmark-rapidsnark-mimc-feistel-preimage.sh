cd "$(dirname "$0")"
cd ../build

echo "--------------"
echo "MiMC Feistel Preimage"
echo "rapidsnark Groth16 proving time"
echo "--------------"
time ./prover mimc_feistel_preimage_groth16_final.zkey mimc_feistel_preimage_witness.wtns proof.json public.json