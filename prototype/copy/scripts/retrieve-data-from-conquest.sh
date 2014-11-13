#!/bin/bash
# author: janice@princeton.edu
# downloads nifti data from conquest folder

set -e # fail immediately on error
source globals.sh

mkdir data/nifti
cp -r /jukebox/hasson/janice/TZ/raw/$SUBJ/NII/* data/nifti
cd scripts
submit_short rename_data_from_conquest.m
cd ..
