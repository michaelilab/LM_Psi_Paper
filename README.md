# LM_Psi_Paper

A UNIX shell, PERL and the R software are needed to use these scripts.

The "Unix_scripts" needs smalt, samtools, perl and Bedtools. You can use your own alignment tools if you prefer, but be sure that the alignment output in SAM/BAM format. Bedtools is mandatory. These pipeline requires paired-end sequencing data.

**HydraPsiSeq pipeline
**
HydraPsiSeq pipeline came from the repository - https://github.com/FlorianPichot/HydraPsiSeqPipeline with minor modifications

General pipeline: Alignment (Unix script) --> NormUCount (R script) --> Analysis with list of known sites(R script)
