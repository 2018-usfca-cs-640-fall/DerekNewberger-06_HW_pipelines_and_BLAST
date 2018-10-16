#!/usr/bin/env bash
# Script to process Fierer 16s dataset
# Including downloading from NCBI SRA
# To fasta from fastq, and finally
# BLASTING with command -line blastn

# Derek Newberger
# Support from Madelene Shehan
# DrNewberger@usfca.edu
# October 8, 2018

# The pipe and tail -n +2 is a handy way to exclude the first line.

for SRA_number in $(cut -f 6 data/metadata/fierer_forensic_hand_mouse_SraRunTable.txt | tail -n +2)
do
    fastq-dump -v "$SRA_number" -O data/raw_data
done

# Create QC reports for each of the runs using the FastQC program.
# To view the reports one needs to connect to something like Cyberduck to
# transfer the files to your laptop.

fastqc data/raw_data/*.fastq --outdir=output/fastqc

# Info on the Trimmomatic tool available here:
# http://www.usadellab.org/cms/index.php?page=trimmomatic
# The parameters were set to toss out any sequences below a length of 150 base pairs(minimun lenght),
# a sliding window of 25, and a quality of phred 33.
#A new subdirectory in data was made for these files.

for file in data/raw_data/*.fastq
do
TrimmomaticSE -threads 2 -phred33 "$file" data/trimmed/"$(basename -s .fastq "$file").trim.fastq" LEADING:5 TRAILING:5 SLIDINGWINDOW:8:25 MINLEN:150
done

# We are converting fastq files into fasta files so they can be used as BLAST queries.
# The trimmed files were converted and placed into a new subdirectory in data with the first name billy
# to demonstrate confidence within myself, individuality from the README file and directions, and why not?

for file in data/trimmed/*.trim.fastq
do
bioawk -c fastx '{print ">"$name"\n"$seq}' "$file" > data/billy_fasta/"$(basename -s .trim.fastq "$file").fasta"
done

# Using blastn to search for the top match of each sequence against the nt database.
# The BLAST files were placed in a subdirectory of output called billytwin because of the similarities of
# the files and because this is our final desired output.Below can be used as a reference for the code.
# options and what they're for:
# -db sets which database to use, in this case the nucleotide database
# -num_threads is how many different processor threads to use
# -outfrmt is the output format, further info available here:
# https://www.ncbi.nlm.nih.gov/books/NBK279675/
# -out is the filename to save the results in
# -max_target_seqs is the number of matches ot return for each query
# -negative_gilist tells BLAST which sequences to exclude from matches
# This cuts down on the number of uncultured or environmental matches
# -query is the fasta file of sequences we want to search for matches to

for file in data/billy_fasta/*.fasta
do
blastn -db /blast-db/nt -num_threads 2 -outfmt '10 sscinames std' -out output/billytwin_csv/"$(basename -s .fasta "$file").csv" -max_target_seqs 1 -negative_gilist /blast-db/2018-09-19_environmental_sequence.gi -query "$file"
done
