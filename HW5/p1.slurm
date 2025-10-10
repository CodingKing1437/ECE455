#!/usr/bin/env zsh
#SBATCH --partition=instruction
#SBATCH --time=00:01:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --gpus-per-task=1
#SBATCH --output=mm_naive.output

module load nvidia/cuda
cd $SLURM_SUBMIT_DIR
nvcc mm_naive.cu -o vector_add
./mm_naive
