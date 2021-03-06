#!/bin/bash
#author:Zelin Li
#date:2020.03.24
#utility:assemble paired-end clean data(reads,fastq format), use self selected assembly soft/softs, then do blast search and make circos graph.
#usage:bash assembly+.sh /PATH/TO/WHERE/YOU/WANT/TO/GET/RESULT/ /PATH/TO/CLEAN/DATA/READS/ /PATH/TO/BLAST/QUERY/SEQS.fa
#noted that:your reads name should be like 'XXX_1_clean.fq, XXX_2_clean.fq', and the list(defult is automatically generate, but you can write it by yourself) should only contain 'XXX' in one row.

workload_path=$1
readsfq_path=$2
query=$3
#cp list $workload_path
#cp mt.fa $workload_path
cp assembly_*.sh $workload_path
cp n50.sh $workload_path
cp blast_and_circos.sh $workload_path
cd $readsfq_path
ls *_1_clean.fq | sed -e 's/_1_clean.fq//g' > ${workload_path}list
cd $workload_path
chmod 777 *.sh
for i in $(cat list); do
	mkdir ${i}
done
./assembly_a.sh $readsfq_path $query
./assembly_p.sh $readsfq_path $query
./assembly_s.sh $readsfq_path $query
