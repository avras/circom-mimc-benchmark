cd "$(dirname "$0")"
cd ../build

echo "--------------"
echo "MiMC Preimage"
echo "rapidsnark Groth16 proving time"
echo "--------------"
time ./prover mimc_preimage_groth16_final.zkey mimc_preimage_witness.wtns proof.json public.json