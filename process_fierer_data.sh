# !/usr/bin/env bash
# Script to process Fierer 16s dataset
# Including downloading from NCBI SRA
# To fasta from fastq, and finally
# BLASTING with command -line blastn

# Derek Newberger
# DrNewberger@usfca.edu
# October 8, 2018

# The pipe and tail -n +2 is a handy way to exclude the first line

for SRA_number in $(cut -f 6 data/metadata/fierer_forensic_hand_mouse_SraRunTable.txt | tail -n +2)
do
    fastq-dump -v $SRA_number -O data/raw_data
done

# Create QC reports for each of the runs using the FastQC program
# To view the reports one needs to connect to something like Cyberduck to
# transfer the files to your laptop

fastqc data/raw_data/*.fastq --outdir=output/fastqc

# Info on the Trimmomatic tool available here:
# http://www.usadellab.org/cms/index.php?page=trimmomatic
for file in data/raw_data/*.fastq
do
TrimmomaticSE -threads 2 -phred33 $file data/trimmed/$(basename -s .fastq $file).trim.fastq LEADING:5 TRAILING:5 SLIDINGWINDOW:8:25 MINLEN:150
done

# We are converting fastq files into fasta files so they can be used as BLAST queries.
for file in data/trimmed/*.trim.fastq
do
bioawk -c fastx '{print ">"$name"\n"$seq}' $file > data/billy_fasta/$(basename -s .trim.fastq $file).fasta
done

# Using blastn to search for the top match of each sequence against the nt database

for file in data/billy_fasta/ERR1942297.fasta
do
blastn -db /blast-db/nt -num_threads 2 -outfmt '10 sscinames std' -out output/billytwin_csv/$(basename -s .fasta $file).csv -max_target_seqs 1 -negative_gilist /blast-db/2018-09-19_environmental_sequence.gi -query $file
done
