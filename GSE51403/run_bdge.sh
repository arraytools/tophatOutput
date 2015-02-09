#!/bin/bash
export bdge_bowtie_PATH=/opt/RNA-Seq/bin/bowtie2-2.2.1
export bdge_tophat_PATH=/opt/RNA-Seq/bin/tophat-2.0.11.Linux_x86_64
export bdge_samtools_PATH=/opt/RNA-Seq/bin/samtools-0.1.19:/opt/RNA-Seq/bin/samtools-0.1.19/bcftools:/opt/RNA-Seq/bin/samtools-0.1.19/misc
export PATH=$bdge_bowtie_PATH:$bdge_samtools_PATH:$bdge_tophat_PATH:$PATH

if [ ! -d "/home/brb/GSE51403/output_hg18_2" ]; then mkdir "/home/brb/GSE51403/output_hg18_2"; fi
if ls "/home/brb/GSE51403/output_hg18_2"/*.count &> /dev/null; then rm '/home/brb/GSE51403/output_hg18_2'/*.count ; fi
if [ ! -d tmp ]; then mkdir tmp; fi

if [ -f tmp/log.txt ]; then rm tmp/log.txt; fi
touch tmp/log.txt

# E2_Rep2
echo E2_Rep2 `date +'%Y-%m-%d %T'` >> tmp/log.txt
echo E2_Rep2
tophat2 --no-coverage-search -p 5 -o "E2_Rep2" "/home/brb/igenome/human/UCSC/hg18/genome" SRR1012919.fastq,SRR1012920.fastq 
samtools sort -n "E2_Rep2/accepted_hits.bam" "tmp/E2_Rep2_sn"
samtools view -o "tmp/E2_Rep2_sn.sam" "tmp/E2_Rep2_sn.bam"
python -m HTSeq.scripts.count -s no -a 10 "tmp/E2_Rep2_sn.sam" "/home/brb/igenome/human/UCSC/hg18/genes.gtf" > "/home/brb/GSE51403/output_hg18_2/E2_Rep2.count"

echo
# E2_Rep1
echo E2_Rep1 `date +'%Y-%m-%d %T'` >> tmp/log.txt
echo E2_Rep1
tophat2 --no-coverage-search -p 5 -o "E2_Rep1" "/home/brb/igenome/human/UCSC/hg18/genome" SRR1012917.fastq,SRR1012918.fastq 
samtools sort -n "E2_Rep1/accepted_hits.bam" "tmp/E2_Rep1_sn"
samtools view -o "tmp/E2_Rep1_sn.sam" "tmp/E2_Rep1_sn.bam"
python -m HTSeq.scripts.count -s no -a 10 "tmp/E2_Rep1_sn.sam" "/home/brb/igenome/human/UCSC/hg18/genes.gtf" > "/home/brb/GSE51403/output_hg18_2/E2_Rep1.count"

echo
echo completed `date +'%Y-%m-%d %T'` >> tmp/log.txt
