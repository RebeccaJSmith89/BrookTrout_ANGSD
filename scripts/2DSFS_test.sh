#!/bin/bash
#SBATCH --job-name=2DSFS_test
#SBATCH --partition=high_mem
#SBATCH --output=logs/2DSFS_test_%j.log
#SBATCH --time=12:00:00
#SBATCH --mem=650G
#SBATCH --cpus-per-task=16

set -euo pipefail

# Load ANGSD module
module load angsd/0.940-GCC-14.3.0

# Run from the directory where the job was submitted
cd "$SLURM_SUBMIT_DIR"

# Create output directory
mkdir -p SFS_2D_tests

echo "========================================"
echo "Starting folded 2D-SFS: Cosby vs GB"
echo "Start time: $(date)"
echo "CPUs allocated: $SLURM_CPUS_PER_TASK"
echo "========================================"

# Estimate full-genome folded 2D-SFS
realSFS \
    SAF_array_results/Cosby.saf.idx \
    SAF_array_results/GB.saf.idx \
    -fold 1 \
    -P "$SLURM_CPUS_PER_TASK" \
    > SFS_2D_tests/Cosby_GB.folded.sfs

echo "========================================"
echo "Finished Cosby vs GB"
echo "End time: $(date)"
echo "========================================"
