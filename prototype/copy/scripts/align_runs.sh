#!/bin/bash
#
# align filtered functional runs to each other (native space)
# j.chen & olga.lositsky

set -e

source globals.sh


# Merge all runs into one file, big4D.nii.gz

FUNC01=$PREPROC_DIR/preproc01.feat/filtered_func_data.nii.gz
FUNC02=$PREPROC_DIR/preproc02.feat/filtered_func_data.nii.gz
FUNC03=$PREPROC_DIR/preproc03.feat/filtered_func_data.nii.gz
FUNC04=$PREPROC_DIR/preproc04.feat/filtered_func_data.nii.gz
FUNC05=$PREPROC_DIR/preproc05.feat/filtered_func_data.nii.gz
FUNC06=$PREPROC_DIR/preproc06.feat/filtered_func_data.nii.gz

fslmerge -a big4D $FUNC01 $FUNC02 $FUNC03 $FUNC04 $FUNC05 $FUNC06

# motion correct using mcflirt

mcflirt -in big4D -o big4D_mc -plots

# split the motion corrected data back into indiv runs

fslroi big4D_mc $PREPROC_DIR/preproc01.feat/aligned_filt_func_data.nii.gz 0 225
fslroi big4D_mc $PREPROC_DIR/preproc02.feat/aligned_filt_func_data.nii.gz 225 225
fslroi big4D_mc $PREPROC_DIR/preproc03.feat/aligned_filt_func_data.nii.gz 450 225
fslroi big4D_mc $PREPROC_DIR/preproc04.feat/aligned_filt_func_data.nii.gz 675 225
fslroi big4D_mc $PREPROC_DIR/preproc05.feat/aligned_filt_func_data.nii.gz 900 225
fslroi big4D_mc $PREPROC_DIR/preproc06.feat/aligned_filt_func_data.nii.gz 1125 225

rm big4D.nii.gz
rm big4D_mc.par
