#!/bin/bash
source globals.sh
# Run all .fsf files in fsf directory
for fsf in $(ls -d $FSF_DIR/*.fsf); do feat "$fsf"; done
