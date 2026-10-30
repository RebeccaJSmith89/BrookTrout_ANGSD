#!/bin/bash
#SBATCH --job-name=SAF_all
#SBATCH --output=SAF_all_%j.log
#SBATCH --time=04:00:00
#SBATCH --mem=8G
#SBATCH --cpus-per-task=24

set -euo pipefail

module load angsd/0.940-GCC-14.3.0
for file in *.bamlist; do 
ec

angsd -GL 1 -bam $file -doSaf 1 -anc ../WGS_reference/GCF_029448725.1_ASM2944872v1_genomic.fna -minMapQ 30 -minQ 20 -P 24 -out SAF_results/$file

done
