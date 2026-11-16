## Overview

This repository contains scripts for population genomic analysis of Brook Trout 
(*Salvelinus fontinalis*) reintroductions in Great Smoky Mountains National Park, 
using low-coverage whole genome sequencing (lcWGS). The goal is to estimate 
demographic history and time since isolation among source populations used for 
reintroductions across watersheds.

Analyses use ANGSD for allele frequency estimation and site frequency spectrum 
(SFS) calculation, followed by fastsimcoal2 for demographic modeling.

## Pipeline

1. Index BAM files (`index_bam.sh`)
2. Estimate site allele frequencies with ANGSD (`SAF_all_array.sh`)
3. Compute 2D folded SFS for all population pairs with realSFS (.realSFS.sh)
4. Convert SFS output to fastsimcoal2 format (`convert2obs.sh`)
5. Run demographic inference with fastsimcoal2

# BrookTrout_ANGSD
Population genomic analyses of Brook Trout using ANGSD, including allele frequency estimation, site frequency spectra, and demographic inference.
| Script | Description |
|---|---|
| [index_bam.sh](scripts/index_bam.sh) | Indexes BAM files using samtools to allow efficient access to aligned sequencing reads. |
|  [calculate_SAF_GS28.sh](scripts/calculate_SAF_GS28.sh) | TEST RUN: Estimates site allele frequency likelihoods for a test dataset using ANGSD. |
|[SAF_all.sh](scripts/SAF_all.sh) | Runs ANGSD SAF estimation across population BAM lists using a Bash loop. |
|  [SAF_all_array.sh](scripts/SAF_all_array.sh) | Uses a Slurm job array to estimate SAFs across 15 Brook Trout populations. |
| [convert2obs.sh](scripts/convert2obs.sh) | Converts realSFS 2D SFS output to fastsimcoal2 .obs format. |
