#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=00:09:00
#SBATCH --output=sbatch/SLURM-mandelbrot-C32.log
#SBATCH --mem=16G
#SBATCH --cpus-per-task=32
#SBATCH --job-name=mandelbrot-C32
#SBATCH --distribution=block:block
#SBATCH --constraint=skylake
././mandelbrot --tasks 2> logs/mandelbrot-C32.log
