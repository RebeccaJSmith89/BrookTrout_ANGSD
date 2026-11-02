#!/bin/bash
#SBATCH --job-name=index_BAMs
#SBATCH --output=index_BAMs_%j.log
#SBATCH --time=08:00:00
#SBATCH --mem=8G
#SBATCH --cpus-per-task=3

#Optional Saftey feature; -e is exit on error; -u error on undefined variables; -o pipe fail
set -euo pipefail 

module load SAMtools

# Define directories
BAM_DIR="../WGS_bams"
INDEX_DIR="../bam_indexes"

# Loop through every BAM file
for bam in "$BAM_DIR"/*.bam; do

    # Extract the filename
    filename=$(basename "$bam")

    # Define the index output path
    index="$INDEX_DIR/$filename.bai"

    # Skip files that already have indexes
    if [[ -s "$index" ]]; then
        echo "Skipping $filename (index exists)"
        continue
    fi

    echo "Indexing $filename"

    samtools index -@ 2 -o "$index" "$bam"

    echo "Finished $filename"

done

echo "All BAM files have been processed!"
