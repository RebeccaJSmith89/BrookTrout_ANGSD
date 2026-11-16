## SFS Conversion: ANGSD to fastsimcoal2

This script converts the 2D folded site frequency spectrum output from realSFS 
into the `.obs` format required by fastsimcoal2 for demographic modeling.

**Script:** `scripts/convert2obs.sh`

**Background**

realSFS outputs a flat, space-separated line of values representing a 2D SFS 
matrix. fastsimcoal2 requires this same data as a tab-separated matrix with 
specific headers. No dedicated conversion tool exists for this — this script 
fills that gap.

**Input**

- `*.2dsfs` files from realSFS (one per population pair)
- Each file contains a single line of 25 space-separated floats (5×5 matrix, 
  folded SFS for n=2 per population)

**Output**

- `*_jointMAFpop1_0.obs` files, one per population pair
- Tab-separated 5×5 matrix with row/column labels in fastsimcoal2 format
- Decimal values retained (not rounded)

**How it works**

1. Parses population names from the filename (e.g., `AB_BU.2dsfs` → pop1=AB, pop2=BU)
2. Writes the header line `1 observations`
3. Writes column labels (`d{pop2}_0` through `d{pop2}_4`)
4. Reshapes the flat 25-value line into a 5×5 matrix using `xargs -n 5`
5. Adds row labels (`d{pop1}_0` through `d{pop1}_4`) using `awk`
6. Outputs results to `obsfiles_noround/`

**Usage**

Run from the directory containing your `.2dsfs` files:


**Notes**

- Matrix size is 2n+1 per population — with n=2 this produces a 5×5 matrix, 
but will vary with your dataset.
- The 2D SFS uses only sites where both populations have coverage, so total 
  counts will be slightly lower than the corresponding 1D SFS.
- Decimal values are intentionally preserved. fastsimcoal2 accepts float input.
