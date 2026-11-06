#!/bin/bash
for file in *.2dsfs; do
    base=$(echo "$file" | cut -d'.' -f1)
    pop1=$(echo "$base" | cut -d'_' -f1)
    pop2=$(echo "$base" | cut -d'_' -f2)
    out="${pop1}_${pop2}_jointMAFpop1_0.obs"

    echo "1 observations" > "$out"
    printf "\td${pop2}_0\td${pop2}_1\td${pop2}_2\td${pop2}_3\td${pop2}_4\n" >> "$out"

    cat "$file" | xargs -n 5 > temp
    awk '{$1=d++i FS $1;}1' temp > temp2
    awk -v p="$pop1" '{printf "d" p "_" $1; for(i=2; i<=NF; i++) printf "\t%.0f", $i; printf "\n"}' temp2 > temp3
    cat temp3 >> "$out"

    rm -f temp temp2 temp3

done
