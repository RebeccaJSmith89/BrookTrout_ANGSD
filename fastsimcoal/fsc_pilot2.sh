#!/bin/bash
#SBATCH --job-name="FSC_pilot2run_RS"
#SBATCH --output=fscRun_%j.out   ### File in which to store job output
#SBATCH --time=8-00:00:00           ### Wall clock time limit in Days-HH:MM:SS e.g., 1-00:00:00
#SBATCH --export=ALL
#SBATCH --nodes=1                 ### Node count required for the job
#SBATCH --ntasks-per-node=1       ### Number of tasks to be launched per Node (can be increased to 5 for java or 10)
#SBATCH --mem-per-cpu=6G                  ### 32G for next gen?
#SBATCH --cpus-per-task=40

for i in {1..10}
do
date
mkdir pilot2$i
cp BT.tpl BT.est pilot2$i"/"
cp *.obs pilot2$i"/"
cd pilot2$i
../fsc28 -t BT.tpl -e BT.est -d -M -n10000 -L50 -q -y4 -c8 -B16
cd ..
done

date

