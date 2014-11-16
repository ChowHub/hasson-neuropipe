#!/bin/bash
if [ ! -z "$1" ]
then
    cd "$1"
    #echo "setting directory to $1"
fi

set -e
for j in $(ls *nii*)
do
    dims=$(fslinfo $j | grep '^dim4' | sed -e 's/ \+/\t/g')
    echo -e "$j"'\t'"$dims"
done
