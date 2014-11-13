source globals.sh
set +e

gunzip analysis/preproc/preproc01.feat/filtered_func_data.nii.gz
gunzip analysis/preproc/preproc01.feat/example_func.nii.gz
#rm analysis/preproc/preproc01.feat/rfiltered_func_data.nii*

cd scripts
submit_short reslice_filtered_func.m
cd ..

while [ ! -f analysis/preproc/preproc01.feat/rfiltered_func_data.nii ]
do
 sleep 2
done

echo reslice done

cd analysis/preproc/preproc01.feat
./../../../scripts/coreg2rfunc.sh

cd ../preproc02.feat
./../../../scripts/coreg2rfunc.sh
