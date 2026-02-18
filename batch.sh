#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:09:00
#SBATCH --output=sbatch/SLURM-kmeans-C32.log
#SBATCH --mem=16G
#SBATCH --cpus-per-task=32
#SBATCH --job-name=kmeans-C32
#SBATCH --distribution=block:block
#SBATCH --constraint=skylake
./prog6_kmeans/kmeans 2> logs/kmeans-C32.log
