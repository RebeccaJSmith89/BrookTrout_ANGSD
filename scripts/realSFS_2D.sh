#!/bin/bash
#SBATCH --job-name=realSFS_2D
#SBATCH --output=../logs/realSFS_2D_%A_%a.log
#SBATCH --time=08:00:00
#SBATCH --mem=160G
#SBATCH --cpus-per-task=24
#SBATCH --array=1-105%10
#SBATCH --exclude=moose1,moose2

set -euo pipefail

# Load ANGSD module
module load angsd/0.940-GCC-14.3.0

SAF_DIR="../SAF_array_results"
PAIRS_FILE="population_pairs.txt"
OUT_DIR="."

# ---- Get this task's pair --------------------------------------------------
pair=$(sed -n "${SLURM_ARRAY_TASK_ID}p" "$PAIRS_FILE")
pop1=$(echo "$pair" | awk '{print $1}')
pop2=$(echo "$pair" | awk '{print $2}')

echo "========================================"
echo "echo Starting folded 2D-SFS: ${pop1} x ${pop2}"
echo "Start time: $(date)"
echo "CPUs allocated: $SLURM_CPUS_PER_TASK"
echo "========================================"

saf1="${SAF_DIR}/${pop1}.saf.idx"
saf2="${SAF_DIR}/${pop2}.saf.idx"

realSFS \
    "$saf1" \
    "$saf2" \
    -fold 1 \
    -P 24 \
    > "${OUT_DIR}/${pop1}_${pop2}.2dsfs"

echo ""
echo "Output: ${OUT_DIR}/${pop1}_${pop2}.2dsfs"
echo "File size: $(wc -c < "${OUT_DIR}/${pop1}_${pop2}.2dsfs") bytes"
echo "Finished at: $(date)"

