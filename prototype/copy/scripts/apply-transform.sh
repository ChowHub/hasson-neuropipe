#!/bin/bash
#
# apply-transform.sh
# transform filtered_func_data to 2mm standard space, then to 3mm standard space
# two-step procedure because warping of mprage to 2mm standard is better than to 3mm standard
# but then you want a 3mm file to work with in matlab (due to file size)
# j.chen

set +e  # don't stop when an error occurs

# load subject-wide settings, such as the subject's ID
source globals.sh 

FEAT_DIR=analysis/preproc/preproc01.feat
FUNC_VOL=filtered_func_data.nii.gz
REF_2MM=$PROJ_DIR/data/MNI152_T1_2mm_brain.nii
REF_3MM=$PROJ_DIR/data/MNI152_T1_3mm_brain.nii
REF_MAT_F2S=example_func2standard.mat
REF_MAT_2MM_TO_3MM=$PROJ_DIR/data/transmat_2mm_to_3mm.mat
REF_MAT_F_TO_3MM=example_func2standard_3mm.mat
VOL_3MM=trans_filtered_func_data.nii

# remove files from prev analyses, if they exist
rm -f $FEAT_DIR/$VOL_3MM*

# combine transforms: convert_xfm -omat AtoC.mat -concat BtoC.mat AtoB.mat
convert_xfm -omat $FEAT_DIR/reg/$REF_MAT_F_TO_3MM -concat $REF_MAT_2MM_TO_3MM $FEAT_DIR/reg/$REF_MAT_F2S

# transform filtered_func_data to trans_filtered_func_data_3mm
flirt -in $FEAT_DIR/$FUNC_VOL -ref $REF_3MM -out $FEAT_DIR/$VOL_3MM -init $FEAT_DIR/reg/$REF_MAT_F_TO_3MM -applyxfm
 

