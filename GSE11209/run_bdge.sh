#!/bin/bash
export PATH=$PATH:/opt/RNA-Seq/bin/bowtie2-2.2.1
export PATH=$PATH:/opt/RNA-Seq/bin/tophat-2.0.11.Linux_x86_64
export PATH=$PATH:/opt/RNA-Seq/bin/samtools-0.1.19:/opt/RNA-Seq/bin/samtools-0.1.19/bcftools:/opt/RNA-Seq/bin/samtools-0.1.19/misc
if [ -f log.txt ]; then rm log.txt; fi
touch log.txt
if [ ! -d "/media/sf_GSE11209" ]; then mkdir "/media/sf_GSE11209"; fi
if ls "/media/sf_GSE11209"/*.count &> /dev/null; then rm '/media/sf_GSE11209'/*.count ; fi
# dT_bio
echo dT_bio `date +'%Y-%m-%d %T'` >> log.txt
echo dT_bio
tophat2 --no-coverage-search -p 4 -o "dT_bio" "/media/sf_GSE11209/genome" SRR002062.fastq 
samtools sort -n "dT_bio/accepted_hits.bam" "dT_bio_sn"
samtools view -o "dT_bio_sn.sam" "dT_bio_sn.bam"
python -m HTSeq.scripts.count -s no -a 10 "dT_bio_sn.sam" "/media/sf_GSE11209/genes.gtf" > "/media/sf_GSE11209/dT_bio.count"

echo
# dT_tech
echo dT_tech `date +'%Y-%m-%d %T'` >> log.txt
echo dT_tech
tophat2 --no-coverage-search -p 4 -o "dT_tech" "/media/sf_GSE11209/genome" SRR002064.fastq 
samtools sort -n "dT_tech/accepted_hits.bam" "dT_tech_sn"
samtools view -o "dT_tech_sn.sam" "dT_tech_sn.bam"
python -m HTSeq.scripts.count -s no -a 10 "dT_tech_sn.sam" "/media/sf_GSE11209/genes.gtf" > "/media/sf_GSE11209/dT_tech.count"

echo
# dT_ori
echo dT_ori `date +'%Y-%m-%d %T'` >> log.txt
echo dT_ori
tophat2 --no-coverage-search -p 4 -o "dT_ori" "/media/sf_GSE11209/genome" SRR002051.fastq 
samtools sort -n "dT_ori/accepted_hits.bam" "dT_ori_sn"
samtools view -o "dT_ori_sn.sam" "dT_ori_sn.bam"
python -m HTSeq.scripts.count -s no -a 10 "dT_ori_sn.sam" "/media/sf_GSE11209/genes.gtf" > "/media/sf_GSE11209/dT_ori.count"

echo
# RH_bio
echo RH_bio `date +'%Y-%m-%d %T'` >> log.txt
echo RH_bio
tophat2 --no-coverage-search -p 4 -o "RH_bio" "/media/sf_GSE11209/genome" SRR002058.fastq 
samtools sort -n "RH_bio/accepted_hits.bam" "RH_bio_sn"
samtools view -o "RH_bio_sn.sam" "RH_bio_sn.bam"
python -m HTSeq.scripts.count -s no -a 10 "RH_bio_sn.sam" "/media/sf_GSE11209/genes.gtf" > "/media/sf_GSE11209/RH_bio.count"

echo
# RH_tech
echo RH_tech `date +'%Y-%m-%d %T'` >> log.txt
echo RH_tech
tophat2 --no-coverage-search -p 4 -o "RH_tech" "/media/sf_GSE11209/genome" SRR002061.fastq 
samtools sort -n "RH_tech/accepted_hits.bam" "RH_tech_sn"
samtools view -o "RH_tech_sn.sam" "RH_tech_sn.bam"
python -m HTSeq.scripts.count -s no -a 10 "RH_tech_sn.sam" "/media/sf_GSE11209/genes.gtf" > "/media/sf_GSE11209/RH_tech.count"

echo
# RH_ori
echo RH_ori `date +'%Y-%m-%d %T'` >> log.txt
echo RH_ori
tophat2 --no-coverage-search -p 4 -o "RH_ori" "/media/sf_GSE11209/genome" SRR002059.fastq 
samtools sort -n "RH_ori/accepted_hits.bam" "RH_ori_sn"
samtools view -o "RH_ori_sn.sam" "RH_ori_sn.bam"
python -m HTSeq.scripts.count -s no -a 10 "RH_ori_sn.sam" "/media/sf_GSE11209/genes.gtf" > "/media/sf_GSE11209/RH_ori.count"

echo
echo completed `date +'%Y-%m-%d %T'` >> log.txt
