#!/bin/bash

set -e
python scripts/nii_rename.py
bash scripts/nii_numtr.sh data/nifti > data/nifti/TR_summary.txt
