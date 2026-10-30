#!/bin/bash
#SBATCH --job-name=SAF_GS28
#SBATCH --output=SAF_GS28_%j.log
#SBATCH --time=01:00:00
#SBATCH --mem=8G
#SBATCH --cpus-per-task=4

set -euo pipefail

module load angsd/0.940-GCC-14.3.0

# Create output directory
mkdir -p SAF_results

# Calculate site allele frequency likelihoods
angsd \
  -bam GS28.bamlist \
  -GL 1 \ #SAMtools model
  -doSaf 1 \ #SAF estimation method
  -anc ../WGS_reference/GCF_029448725.1_ASM2944872v1_genomic.fna \ #ANCESTRAL REFERENCE FASTA
  -r NC_074665.1:1-1000000 \ #restricting test region
  #-baq 1: filtering base alignment quality
  #-C 50: adjust mapping quality
  -minMapQ 30 \ #mapping-quality threshold
  -minQ 20 \ #base-quality threshold
  -P 4 \ #4 threads
  -out SAF_results/GS28_test
