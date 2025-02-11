#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
# SBATCH --gpus-per-task=1
#SBATCH --time=3-00:00:00
#SBATCH --output=logs/NER-BERT-train-%J.out
#SBATCH --error=logs/NER-BERT-train-%J.err
#SBATCH --job-name="NER-BERT-train"

CONTAINER_IMAGE_PATH="$PWD/containers/sing-container.sif"

# singularity run --nv $CONTAINER_IMAGE_PATH bin/exec-bert.sh --full-finetuning --epochs 5 --test # --train
singularity run --nv $CONTAINER_IMAGE_PATH bin/exec-bert.sh --epochs 5 --test --train 
