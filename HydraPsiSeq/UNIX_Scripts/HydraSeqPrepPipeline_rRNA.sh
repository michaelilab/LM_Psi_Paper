
#!/usr/bin/env tcsh

#path to raw sequence directory
set path1="RawData/"
#path to scripts directory
set path2="Scripts/"
#path to analysis directory
set analysis_dir=""
set type="rRNA"
#rRNA fasta file
set fasta="DB/LA/La_rRNA_coding.fa"
#Database formatted for smalt
set genome="DB/LA/La_rRNA"
#genome file with names of sequences and their corresponding lengths
set file1="DB/LA/rRNA.genome"

foreach fastq_file ($path1/*_ME_R1*.fastq.gz)
   echo $fastq_file
   set base=`basename $fastq_file|cut -f1 -d\.`
   echo $base
   set fastq_file2=`echo $fastq_file |sed -e 's/_R1/_R2/'` ;
   echo $fastq_file2

   #map to rRNA using smalt
   smalt map $genome $fastq_file $fastq_file2 > $base\_vs_$type.sam
  
   #filter for good pairs only
   samtools view -f 0x02 -bS  $base\_vs_$type.sam > $base\_vs_$type\_good_pairs.bam
   rm $base\_vs_$type.sam
end

foreach bam_file ($analysis_dir/*pairs.bam)
    echo $bam_file
    set prefix=`basename $bam_file|cut -f1,2 -d\_`
    ##BAM_TO_BED
    bedtools bamtobed -bedpe -i  $bam_file  | awk '{print $1 "\t" $2  "\t" $6 "\t" $7 "\t" $8 "\t" $9}' | sort -k1,1 -k2,2n > $prefix\_vs_$type\_good_pairs.sorted.bed

    ##init
    cat $prefix\_vs_$type\_good_pairs.sorted.bed  | perl $path2/CountInitiating.pl $file1   > $prefix\_vs_$type\_good_pairs.sorted.init

    #sort bam files
    samtools sort $bam_file -o $prefix.sorted.bam

    samtools mpileup -f $fasta -aBQ0 -d10000000 $prefix.sorted.bam | cut -f1-4 > coverage_mpileup_$prefix\_vs_$type.csv
end


