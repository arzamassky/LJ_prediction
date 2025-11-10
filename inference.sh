#!/usr/bin/env bash

# step 0, install https://github.com/isayevlab/AIMNet-X2D 
# Activate your conda env
source ~/miniconda3/etc/profile.d/conda.sh    # adjust based on anaconda env installation
conda activate ~/miniconda3/envs/aimnet-x2d/  # adjust based on anaconda env installation

NUM_CORES=12
AIMNET_DIR="~/aimnet-x2d" # adjust where the aimnet-x2d installed

for i in {0..4}; do
    python ${AIMNET_DIR}/main.py \
      --inference_csv         "./input.csv" \
      --inference_output      "./output_${i}_pred.csv" \
      --model_save_path       "./model_${i}.pth" \
      --inference_mode        streaming \
      --smiles_column         SMILES \
      --target_column         Property \
      --num_workers           "${NUM_CORES}" \
      --num_gpu_devices       1 \
      --batch_size            4000 \
      --stream_chunk_size     16000 
done

