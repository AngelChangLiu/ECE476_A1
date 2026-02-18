#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:09:00
#SBATCH --output=sbatch/SLURM-sqrt-C32.log
#SBATCH --mem=16G
#SBATCH --cpus-per-task=32
#SBATCH --job-name=sqrt-C32
#SBATCH --distribution=block:block
#SBATCH --constraint=skylake
././sqrt --tasks 2> logs/sqrt-C32.log
