# intended to be run from analysis/preproc/preprocfeatdir

set +e

source ../../../scripts/subject_id.sh

/bin/mkdir -p rreg

cp rexample_func.nii rreg
cd rreg

/usr/local/fsl/bin/fslmaths ../../../../data/nifti/${SUBJ}_t1_mprage_192_brain highres

/usr/local/fsl/bin/fslmaths ../../../../../../data/MNI152_T1_2mm_brain standard

/usr/local/fsl/bin/flirt -ref highres -in rexample_func -out rexample_func2highres -omat rexample_func2highres.mat -cost \
corratio -dof 7 -searchrx -90 90 -searchry -90 90 -searchrz -90 90 -interp trilinear  

/usr/local/fsl/bin/convert_xfm -inverse -omat highres2rexample_func.mat rexample_func2highres.mat

/usr/local/fsl/bin/slicer rexample_func2highres highres -s 2 -x 0.35 sla.png -x 0.45 slb.png -x 0.55 slc.png -x 0.65 sld.png \
-y 0.35 sle.png -y 0.45 slf.png -y 0.55 slg.png -y 0.65 slh.png -z 0.35 sli.png -z 0.45 slj.png -z 0.55 slk.png -z 0.65 \
sll.png ; /usr/local/fsl/bin/pngappend sla.png + slb.png + slc.png + sld.png + sle.png + slf.png + slg.png + slh.png + \
sli.png + slj.png + slk.png + sll.png rexample_func2highres1.png ; /usr/local/fsl/bin/slicer highres rexample_func2highres -s \
2 -x 0.35 sla.png -x 0.45 slb.png -x 0.55 slc.png -x 0.65 sld.png -y 0.35 sle.png -y 0.45 slf.png -y 0.55 slg.png -y 0.65 \
slh.png -z 0.35 sli.png -z 0.45 slj.png -z 0.55 slk.png -z 0.65 sll.png ; /usr/local/fsl/bin/pngappend sla.png + slb.png + \
slc.png + sld.png + sle.png + slf.png + slg.png + slh.png + sli.png + slj.png + slk.png + sll.png rexample_func2highres2.png \
; /usr/local/fsl/bin/pngappend rexample_func2highres1.png - rexample_func2highres2.png rexample_func2highres.png; /bin/rm -f \
sl?.png

/usr/local/fsl/bin/flirt -ref standard -in highres -out highres2standard -omat highres2standard.mat -cost corratio -dof 12 \
-searchrx -90 90 -searchry -90 90 -searchrz -90 90 -interp trilinear  

/usr/local/fsl/bin/convert_xfm -inverse -omat standard2highres.mat highres2standard.mat

/usr/local/fsl/bin/slicer highres2standard standard -s 2 -x 0.35 sla.png -x 0.45 slb.png -x 0.55 slc.png -x 0.65 sld.png -y \
0.35 sle.png -y 0.45 slf.png -y 0.55 slg.png -y 0.65 slh.png -z 0.35 sli.png -z 0.45 slj.png -z 0.55 slk.png -z 0.65 sll.png \
; /usr/local/fsl/bin/pngappend sla.png + slb.png + slc.png + sld.png + sle.png + slf.png + slg.png + slh.png + sli.png + \
slj.png + slk.png + sll.png highres2standard1.png ; /usr/local/fsl/bin/slicer standard highres2standard -s 2 -x 0.35 sla.png \
-x 0.45 slb.png -x 0.55 slc.png -x 0.65 sld.png -y 0.35 sle.png -y 0.45 slf.png -y 0.55 slg.png -y 0.65 slh.png -z 0.35 \
sli.png -z 0.45 slj.png -z 0.55 slk.png -z 0.65 sll.png ; /usr/local/fsl/bin/pngappend sla.png + slb.png + slc.png + sld.png \
+ sle.png + slf.png + slg.png + slh.png + sli.png + slj.png + slk.png + sll.png highres2standard2.png ; \
/usr/local/fsl/bin/pngappend highres2standard1.png - highres2standard2.png highres2standard.png; /bin/rm -f sl?.png

/usr/local/fsl/bin/convert_xfm -omat rexample_func2standard.mat -concat highres2standard.mat rexample_func2highres.mat

/usr/local/fsl/bin/flirt -ref standard -in rexample_func -out rexample_func2standard -applyxfm -init rexample_func2standard.mat -interp trilinear

/usr/local/fsl/bin/convert_xfm -inverse -omat standard2rexample_func.mat rexample_func2standard.mat

/usr/local/fsl/bin/slicer rexample_func2standard standard -s 2 -x 0.35 sla.png -x 0.45 slb.png -x 0.55 slc.png -x 0.65 \
sld.png -y 0.35 sle.png -y 0.45 slf.png -y 0.55 slg.png -y 0.65 slh.png -z 0.35 sli.png -z 0.45 slj.png -z 0.55 slk.png -z \
0.65 sll.png ; /usr/local/fsl/bin/pngappend sla.png + slb.png + slc.png + sld.png + sle.png + slf.png + slg.png + slh.png + \
sli.png + slj.png + slk.png + sll.png rexample_func2standard1.png ; /usr/local/fsl/bin/slicer standard rexample_func2standard \
-s 2 -x 0.35 sla.png -x 0.45 slb.png -x 0.55 slc.png -x 0.65 sld.png -y 0.35 sle.png -y 0.45 slf.png -y 0.55 slg.png -y 0.65 \
slh.png -z 0.35 sli.png -z 0.45 slj.png -z 0.55 slk.png -z 0.65 sll.png ; /usr/local/fsl/bin/pngappend sla.png + slb.png + \
slc.png + sld.png + sle.png + slf.png + slg.png + slh.png + sli.png + slj.png + slk.png + sll.png rexample_func2standard2.png \
; /usr/local/fsl/bin/pngappend rexample_func2standard1.png - rexample_func2standard2.png rexample_func2standard.png; /bin/rm -f \
sl?.png

