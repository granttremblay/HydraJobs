#!/bin/sh

# Set number of cores you'd like to use (24 for MUSE data on Hydra)
export OMP_NUM_THREADS=24

export rawdir='/data/sao/gtremblay/Data/MUSE/rawdata'
export caldir='/home/gtremblay/Software/MUSE/calib/muse-2.2/cal'

echo "=======  STARTING REDUCTION OF MUSE DATA ======="

echo "Setting number of OMP threads to " $OMP_NUM_THREADS
echo "Rawdata directory set to: " $rawdir
echo "Static calibration directory set to: " $caldir


echo " "
echo "=======       CREATING MASTER BIAS       ======="
esorex --log-file=bias.log muse_bias --nifu=-1 --merge bias.sof



echo " "
echo "=======       CREATING MASTER DARK       ======="
esorex --log-file=dark.log muse_dark --nifu=-1 --merge dark.sof



echo " "
echo "=======       CREATING MASTER FLAT       ======="
esorex --log-file=flat.log muse_flat --nifu=-1 --merge flat.sof



echo " "
echo "=======      WAVELENGTH CALIBRATION     ======="
esorex --log-file=wavecal.log muse_wavecal --nifu=-1 --resample --residuals --merge wavecal.sof


echo " "
echo "=======       LINE SPREAD FUNCTION      ======="
esorex --log-file=lsf.log muse_lsf --nifu=-1 --merge lsf.sof


echo " "
echo "=======         IT'S TWILIGHT TIME      ======="
esorex --log-file=twilight.log muse_twilight twilight.sof


echo " "
echo "=======            SCI BASIC            ======="
esorex --log-file=science_scibasic.log muse_scibasic --nifu=-1 --merge science_scibasic.sof