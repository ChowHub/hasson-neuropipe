#!/bin/bash
#
#
# author: j.chen

set -e # stop immediately when an error occurs

# load subject-wide settings, such as the subject's ID
source globals.sh 

DATA_DIR=data
FEAT_DIR=analysis/preproc/preproc01.feat
FUNC_VOL=mean_func.nii.gz
REF_VOL=data/nifti/${SUBJ}_t1_mprage_192_brain.nii.gz
REF_MAT=example_func2highres.mat
OUTPUT_DIR=analysis/preproc/preproc01.feat
OUTPUT_VOL=mean_func2highres.nii.gz
flirt -in $FEAT_DIR/$FUNC_VOL -ref $REF_VOL -out $OUTPUT_DIR/$OUTPUT_VOL -init $FEAT_DIR/reg/$REF_MAT -applyxfm
 
