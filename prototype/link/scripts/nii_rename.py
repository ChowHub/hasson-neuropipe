import os, yaml
splitext = lambda x: (x[:x.find('.nii')], x[x.find('.nii'):])

subID = os.path.basename(os.getcwd())
print subID
path = 'data/nifti'
nii_dir = [entry for entry in os.listdir(path) if '.nii' in entry]
rename = yaml.load(open('run-order.txt'))

print "===Planning to Rename==="
for nii in nii_dir:
    if not splitext(nii)[0] in rename:
        print "MISSING nifti in run-order.txt"
        print splitext(nii)[0], ':\t not in run-order.txt'
        raise SystemExit
    else:
        print nii, '\t=>\t', rename[splitext(nii)[0]]

raw_input('Press Enter to continue, or ctrl+c to abort')
for nii in nii_dir:
    basename, ext = splitext(nii)
    newname = os.path.join(path, subID + '_' + rename[basename] + ext)
    print nii, '\t=>\t', newname
    os.rename(os.path.join(path, nii), newname)
