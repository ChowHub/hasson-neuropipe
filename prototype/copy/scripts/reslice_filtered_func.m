% Has to be in the same directory as the image file
% Remember to change SubjID
addpath /usr/pni/pkg/MATLAB/toolboxes_thirdparty/NIFTI/nifti

original = fullfile('..','analysis','preproc','preproc01.feat','example_func.nii');
output = fullfile('..','analysis','preproc','preproc01.feat','rexample_func.nii');
reslice_nii(original, output, 3);

original = fullfile('..','analysis','preproc','preproc01.feat','filtered_func_data.nii');
output = fullfile('..','analysis','preproc','preproc01.feat','rfiltered_func_data.nii');
reslice_nii(original, output, 3);


