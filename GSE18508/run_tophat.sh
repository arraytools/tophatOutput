#!/bin/bash
export PATH=$PATH:/opt/RNA-Seq/bin/bowtie2-2.2.1
export PATH=$PATH:/opt/RNA-Seq/bin/tophat-2.0.11.Linux_x86_64
export PATH=$PATH:/opt/RNA-Seq/bin/samtools-0.1.19:/opt/RNA-Seq/bin/samtools-0.1.19/bcftools:/opt/RNA-Seq/bin/samtools-0.1.19/misc
tophat2 --no-coverage-search -p 5 -o Untreated-3 Dme1_BDGP5_70 SRR031714_1.fastq,SRR031715_1.fastq SRR031714_2.fastq,SRR031715_2.fastq
tophat2 --no-coverage-search -p 5 -o Untreated-4 Dme1_BDGP5_70 SRR031716_1.fastq,SRR031717_1.fastq SRR031716_2.fastq,SRR031717_2.fastq
tophat2 --no-coverage-search -p 5 -o CG8144_RNAi-3 Dme1_BDGP5_70 SRR031724_1.fastq,SRR031725_1.fastq SRR031724_2.fastq,SRR031725_2.fastq
tophat2 --no-coverage-search -p 5 -o CG8144_RNAi-4 Dme1_BDGP5_70 SRR031726_1.fastq,SRR031727_1.fastq SRR031726_2.fastq,SRR031727_2.fastq
tophat2 --no-coverage-search -p 5 -o Untreated-1 Dme1_BDGP5_70 SRR031708.fastq,SRR031709.fastq,SRR031710.fastq,SRR031711.fastq,SRR031712.fastq,SRR031713.fastq 
tophat2 --no-coverage-search -p 5 -o CG8144_RNAi-1 Dme1_BDGP5_70 SRR031718.fastq,SRR031719.fastq,SRR031720.fastq,SRR031721.fastq,SRR031722.fastq,SRR031723.fastq 
tophat2 --no-coverage-search -p 5 -o Untreated-6 Dme1_BDGP5_70 SRR031728.fastq,SRR031729.fastq 
