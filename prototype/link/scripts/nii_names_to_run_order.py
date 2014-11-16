import yaml, os, sys
if len(sys.argv) > 1: NIFTI_DIR = sys.argv[1]
else: raise Exception('Need to specify nifti directory')

stripext = lambda x: x[:x.find('.nii')]

nii_dir = map(stripext, os.listdir(NIFTI_DIR))        # nifti files (w/o ext)
nii_ro = yaml.load(open('run-order.txt'))             # prototype run-order

# if not labeled in prototype run, copy but leave value to be filled in
out = dict()
for fname in nii_dir:
    out[fname] = nii_ro[fname] if fname in nii_ro else None
    
# Save new run-order file
with open('run-order.txt', 'w') as fo:
    fo.write(yaml.dump(out, default_flow_style=False))
