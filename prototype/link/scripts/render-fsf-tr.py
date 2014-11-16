#!/bin/python
import pandas
import yaml, re, difflib, sys
from glob import glob
from os import listdir, path, remove
datadir = 'data/nifti'
if len(sys.argv) > 1: preproc_key = sys.argv[1]
else: raise Exception("need to give preproc_key as argument")
all_nii = listdir(datadir)

all_preprocs = yaml.load(open(preproc_key))     # fsf_file_name: nifti_name
df = pandas.read_csv(datadir+'/TR_summary.txt', sep='\t', header=None)
changeTR = {}

# If nifti name contains a preproc entry, get that row from TR_summary
crnt_preprocs = {}
for k, v in all_preprocs.items():
    match = [row for ii, row in df.iterrows() if v in row[0]]
    assert len(match) <= 1
    if match: crnt_preprocs[k] = match[0]  # add all TR info

# For matches, replace number of volumes in fsf file with correct value
for k, v in crnt_preprocs.iteritems():
    print k, ':\t', v[0]
    print 'TRs','\t', v[2]
    raw_input('press enter to change fsf templates')
    fsf_file = path.join('fsf', k+'.fsf')
    with open(fsf_file, 'r') as f: template = f.read()
    new_template = re.sub(r'(set fmri\(npts\)).*', r'\1 '+str(v[2]), template)
    #show changes between original and new
    diff = difflib.unified_diff(template.splitlines(), new_template.splitlines())
    for line in diff: print line

    #write changes
    with open(fsf_file, 'w') as f_out: f_out.write(new_template)

# Remove non-matching preprocs
for fname in glob('fsf/*.fsf'):
    # fsf file does not match any preprocs (e.g. were removed from key because no nii)
    if not any([procname in fname for procname in crnt_preprocs]):
        print 'removing:\t', fname
        remove(fname)

