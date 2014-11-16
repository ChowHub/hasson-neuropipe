#!/bin/bash
#
# prep.sh prepares for analysis of the subject's data
# original author: mason simon (mgsimon@princeton.edu)
# this script was provided by NeuroPipe. modify it to suit your needs

set -e

source globals.sh

#bash scripts/convert-and-wrap-raw-data.sh $DICOM_ARCHIVE $NIFTI_DIR $SUBJ $RUNORDER_FILE
#bash scripts/qa-wrapped-data.sh $NIFTI_DIR $QA_DIR
#bash scripts/reorient-to-las.sh $NIFTI_DIR

bash scripts/retrieve-data-from-conquest.sh
python scripts/nii_names_to_run_order.py $NIFTI_DIR
bash scripts/nii_numtr.sh data/nifti
bash scripts/nii_numtr.sh data/nifti > data/nifti/TR_summary.txt
