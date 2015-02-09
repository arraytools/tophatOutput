#!/bin/bash
export PATH=$PATH:/opt/RNA-Seq/bin/bowtie2-2.2.1
export PATH=$PATH:/opt/RNA-Seq/bin/tophat-2.0.11.Linux_x86_64
export PATH=$PATH:/opt/RNA-Seq/bin/samtools-0.1.19:/opt/RNA-Seq/bin/samtools-0.1.19/bcftools:/opt/RNA-Seq/bin/samtools-0.1.19/misc
tophat2 -p 3 -o TNBC1  genome SRR1027171_1.fastq SRR1027171_2.fastq
