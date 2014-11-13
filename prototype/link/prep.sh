#!/bin/bash
#
# prep.sh prepares for analysis of the subject's data
# original author: mason simon (mgsimon@princeton.edu)
# this script was provided by NeuroPipe. modify it to suit your needs

set -e

source globals.sh

#bash scripts/retrieve-data-from-conquest.sh
bash scripts/render-fsf-templates.sh
