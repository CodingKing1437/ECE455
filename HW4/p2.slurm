#!/usr/bin/env zsh
#SBATCH --partition=instruction
#SBATCH --time=00:01:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --gpus-per-task=1
#SBATCH --output=thread_indexing.output

module load nvidia/cuda
cd $SLURM_SUBMIT_DIR
nvcc thread_indexing.cu -o thread_indexing
./thread_indexing
