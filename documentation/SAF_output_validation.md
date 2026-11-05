## SAF Output Validation

Before proceeding to site frequency spectrum (SFS) estimation, inspect the ANGSD outputs to verify successful completion and evaluate potential differences among populations.

### Quality Control Checks

1. **Verify output files:** Confirm that each population has all four expected outputs (`.arg`, `.saf.gz`, `.saf.pos.gz`, and `.saf.idx`).
2. **Compare file sizes:** Use `ls -lhS` to identify unusually small or large output files that may indicate differences in sequencing coverage, data quality, or retained sites.
3. **Check Slurm logs:** Examine logs for errors and confirm successful ANGSD completion (`[ALL done]`).
4. **Evaluate site retention:** Record the total number of sites analyzed and the number retained after filtering for each population.
5. **Investigate outliers:** Flag populations with unusually low site counts or unexpected file sizes for further quality assessment before downstream analyses.

### Useful Commands

**Inspect output file sizes:**
```bash
ls -lhS SAF_array_results/
```

**Search logs for errors:**
```bash
grep -iE "error|failed|killed|out.of.memory|time limit" logs/SAF_array_*.log
```

**Examine site retention statistics:**
```bash
grep -A 1 "Total number of sites analyzed" logs/SAF_array_*.log
```

**Verify successful ANGSD completion:**
```bash
grep -l "\[ALL done\]" logs/SAF_array_*.log
```

### Notes

Differences in SAF file sizes do not necessarily indicate failed analyses. File sizes can vary with sequencing coverage, data quality, and the amount of information retained.

High site-retention percentages also do not necessarily indicate high-quality genotype information, particularly for low-coverage sequencing data.

Any unusual results should be evaluated before SFS estimation and documented alongside the filtering parameters used.
