#!/bin/bash
#SBATCH --job-name=SAF_array
#SBATCH --output=SAF_array_%A_%a.log
#SBATCH --time=04:00:00
#SBATCH --mem=8G
#SBATCH --cpus-per-task=24
#SBATCH --array=1-15%5

set -euo pipefail

module load angsd/0.940-GCC-14.3.0

# Pick this task's bamlist based on array index
file=$(ls *.bamlist | sed -n "${SLURM_ARRAY_TASK_ID}p")
pop="${file%.bamlist}"

echo "========================================"
echo "Starting SAF estimation for $pop"
echo "Array task: ${SLURM_ARRAY_TASK_ID}/15"
echo "Start time: $(date)"
echo "========================================"

angsd -GL 1 -bam "$file" -doSaf 1 \
    -anc ../WGS_reference/GCF_029448725.1_ASM2944872v1_genomic.fna \
    -minMapQ 30 -minQ 20 -P 24 \
    -out SAF_array_results/"$pop"

echo "Finished $pop at $(date)"
