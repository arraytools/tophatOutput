#!/bin/bash
export bdge_bowtie_PATH=/opt/RNA-Seq/bin/bowtie2-2.2.1
export bdge_tophat_PATH=/opt/RNA-Seq/bin/tophat-2.0.11.Linux_x86_64
export bdge_samtools_PATH=/opt/RNA-Seq/bin/samtools-0.1.19:/opt/RNA-Seq/bin/samtools-0.1.19/bcftools:/opt/RNA-Seq/bin/samtools-0.1.19/misc
export PATH=$bdge_bowtie_PATH:$bdge_samtools_PATH:$bdge_tophat_PATH:$PATH

if [ ! -d "/home/brb/GSE45419/output" ]; then mkdir "/home/brb/GSE45419/output"; fi
if ls "/home/brb/GSE45419/output"/*.count &> /dev/null; then rm '/home/brb/GSE45419/output'/*.count ; fi
if [ ! -d tmp ]; then mkdir tmp; fi

if [ -f tmp/log.txt ]; then rm tmp/log.txt; fi
touch tmp/log.txt

# OP-535
echo OP-535 `date +'%Y-%m-%d %T'` >> tmp/log.txt
echo OP-535
tophat2 --no-coverage-search -p 11 -o "OP-535" "/home/brb/igenome/human/UCSC/hg19/genome" SRR791074_1.fastq SRR791074_2.fastq
samtools sort -n "OP-535/accepted_hits.bam" "tmp/OP-535_sn"
samtools view -o "tmp/OP-535_sn.sam" "tmp/OP-535_sn.bam"
python -m HTSeq.scripts.count -s no -a 10 "tmp/OP-535_sn.sam" "/home/brb/igenome/human/UCSC/hg19/genes.gtf" > "/home/brb/GSE45419/output/OP-535.count"

echo
echo completed `date +'%Y-%m-%d %T'` >> tmp/log.txt
