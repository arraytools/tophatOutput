#!/bin/bash
export PATH=$PATH:/opt/RNA-Seq/bin/bowtie2-2.2.1
export PATH=$PATH:/opt/RNA-Seq/bin/tophat-2.0.11.Linux_x86_64
export PATH=$PATH:/opt/RNA-Seq/bin/samtools-0.1.19:/opt/RNA-Seq/bin/samtools-0.1.19/bcftools:/opt/RNA-Seq/bin/samtools-0.1.19/misc
tophat2 --no-coverage-search -p 5 -o Starved_1 genome SRR314738.fastq 
tophat2 --no-coverage-search -p 5 -o Starved_2 genome SRR314739.fastq 
tophat2 --no-coverage-search -p 5 -o Serum_1 genome SRR314740.fastq 
tophat2 --no-coverage-search -p 5 -o Serum_2 genome SRR314741.fastq 
