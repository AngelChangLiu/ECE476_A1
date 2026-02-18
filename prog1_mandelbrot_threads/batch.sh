#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:09:00
#SBATCH --output=sbatch/SLURM-mandelbrot-C2-T1-K0-O0.log
#SBATCH --mem-per-cpu=16G
#SBATCH --cpus-per-task=64
#SBATCH --job-name=mandelbrot-C2-T1-K0-O0
#SBATCH --distribution=block:block
#SBATCH --constraint=v6
./mandelbrot -t 64 -v 1
lscpu >> sbatch/mandelbrot_64thread_test.log
