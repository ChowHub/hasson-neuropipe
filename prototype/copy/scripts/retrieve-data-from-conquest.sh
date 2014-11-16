#!/bin/bash
# author: janice@princeton.edu
# downloads nifti data from conquest folder

set -e # fail immediately on error
source globals.sh

mkdir $NIFTI_DIR
RAW_DATA_DIR=/jukebox/hasson/skeleton2/raw_data
cp -r "$RAW_DATA_DIR"/$SUBJ/NII/* $NIFTI_DIR
