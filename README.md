# BrookTrout_ANGSD
Population genomic analyses of Brook Trout using ANGSD, including allele frequency estimation, site frequency spectra, and demographic inference.
| Script | Description |
|---|---|
| [index_bam.sh](scripts/index_bam.sh) | Indexes BAM files using samtools to allow efficient access to aligned sequencing reads. |
|  [calculate_SAF_GS28.sh](scripts/calculate_SAF_GS28.sh) | TEST RUN: Estimates site allele frequency likelihoods for a test dataset using ANGSD. |
|[SAF_all.sh](scripts/SAF_all.sh) | Runs ANGSD SAF estimation across population BAM lists using a Bash loop. |
|  [SAF_all_array.sh](scripts/SAF_all_array.sh) | Uses a Slurm job array to estimate SAFs across 15 Brook Trout populations. |
