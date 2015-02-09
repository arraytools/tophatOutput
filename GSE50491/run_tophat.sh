#!/bin/bash
export PATH=$PATH:/opt/RNA-Seq/bin/bowtie2-2.2.1
export PATH=$PATH:/opt/RNA-Seq/bin/tophat-2.0.11.Linux_x86_64
export PATH=$PATH:/opt/RNA-Seq/bin/samtools-0.1.19:/opt/RNA-Seq/bin/samtools-0.1.19/bcftools:/opt/RNA-Seq/bin/samtools-0.1.19/misc
tophat2 --no-coverage-search -p 5 -o RNA4_KO_BRD4 genome SRR960412_1.fastq SRR960412_2.fastq
tophat2 --no-coverage-search -p 5 -o RNA3_ctrl genome SRR960411_1.fastq SRR960411_2.fastq
tophat2 --no-coverage-search -p 5 -o RNA2_KO_BRD4 genome SRR960410.fastq 
tophat2 --no-coverage-search -p 5 -o RNA1_ctrl genome SRR960409.fastq 
