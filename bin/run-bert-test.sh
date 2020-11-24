#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --gpus-per-task=1
#SBATCH --time=45:00
#SBATCH --output=logs/NER-BERT-test-%J.out
#SBATCH --error=logs/NER-BERT-test-%J.err
#SBATCH --job-name="NER-BERT-test"

set -euo pipefail

CONTAINER_IMAGE_PATH="$PWD/containers/pytorch-image.sqfs"

echo "$SLURM_JOB_ID -> Training the model..."

# the following command opens a bash terminal of an already existing container
# with the current directory (.) mounted
srun \
    --container-image "$CONTAINER_IMAGE_PATH" \
    --container-save "$CONTAINER_IMAGE_PATH" \
    --container-remap-root \
    --container-mounts "$PWD":/workspace,/shared/datasets/rsdo:/data \
    --container-entrypoint /workspace/bin/exec-bert.sh --test

echo "$SLURM_JOB_ID -> Done."

#wait
