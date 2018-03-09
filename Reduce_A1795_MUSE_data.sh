#!/bin/sh

# Set number of cores you'd like to use (24 for MUSE data on Hydra)
export OMP_NUM_THREADS=24

echo "=======  STARTING REDUCTION OF MUSE DATA ======="

echo "Setting number of OMP threads to" $OMP_NUM_THREADS

# MASTER BIAS
esorex --log-file=bias.log muse_bias --nifu=-1 --merge bias.sof