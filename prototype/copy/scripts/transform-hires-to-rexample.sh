#!/bin/bash
#
#
# author: j.chen

set -e # stop immediately when an error occurs

# load subject-wide settings, such as the subject's ID
source globals.sh 

FEAT_DIR=analysis/preproc/preproc01.feat/rreg
INPUT_VOL=highres.nii
REF_VOL=rexample_func.nii
REF_MAT=highres2rexample_func.mat
OUTPUT_DIR=analysis/preproc/preproc01.feat/rreg
OUTPUT_VOL=highres2rexample_func.nii
flirt -in $FEAT_DIR/$INPUT_VOL -ref $FEAT_DIR/$REF_VOL -out $OUTPUT_DIR/$OUTPUT_VOL -init $FEAT_DIR/$REF_MAT -applyxfm

FEAT_DIR=analysis/preproc/preproc02.feat/rreg
INPUT_VOL=highres.nii
REF_VOL=rexample_func.nii
REF_MAT=highres2rexample_func.mat
OUTPUT_DIR=analysis/preproc/preproc02.feat/rreg
OUTPUT_VOL=highres2rexample_func.nii
flirt -in $FEAT_DIR/$INPUT_VOL -ref $FEAT_DIR/$REF_VOL -out $OUTPUT_DIR/$OUTPUT_VOL -init $FEAT_DIR/$REF_MAT -applyxfm
 
