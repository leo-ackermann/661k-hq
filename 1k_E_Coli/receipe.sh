#!/usr/bin/env bash
# Copyright (C) 2025 Léo Ackermann - All Rights Reserved

# REQUIEREMENTS
# - This script assume {https://github.com/ag-computational-bio/bakrep-cli} is installed on the machine





grep "Escherichia coli" ../661k_HQ.tsv | head -1000 > 1k_E_Coli.tsv





# Recover only the .fa.gz files
bakrep download -t 1k_E_Coli.tsv -d ./contigs -F -m filetype:fa

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

# Remove all .progress/ and all the (empty) contigs directories
rm -rf ./contigs/.progress/
rm -R -- ./contigs/*/
