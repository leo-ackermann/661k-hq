#!/usr/bin/env bash
# Copyright (C) 2025 Léo Ackermann - All Rights Reserved

# REQUIEREMENTS
# - This script assume {https://github.com/ag-computational-bio/bakrep-cli} is installed on the machine





NAME="1k_S_Pneumoniae.tsv"
grep "Streptococcus pneumoniae" ../661k_HQ.tsv | head -1000 > $NAME





# Recover only the .fa.gz files
bakrep download -t $NAME -d ./contigs -F -m filetype:fa

# Unzip compressed contigs (cc) in place
for cc in ./contigs/*/*
do
    gzip -d $cc
done

# Move contigs at root
for c in ./contigs/*/*
do
    mv $c ./contigs/
done

# Remove all the (empty) contigs directories
rm -R -- ./contigs/*/

# Check the number of pulled genomes (for adjusting folder name)
echo "Number of pulled genomes:"
ls contigs/ | wc -l
