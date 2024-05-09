# LM_Psi_Paper
Structural and mechanistic insights into the function of Leishmania ribosome lacking a single pseudouridine modification

Leishmania is the causative agent of cutaneous and visceral diseases affecting millions of individuals worldwide. Pseudouridine (Ψ), the most abundant modification on rRNA, changes during the parasite life cycle. Alterations in the level of a specific Ψ in helix 69 (H69) affected ribosome function. To decipher the molecular mechanism of this phenotype, we determine the structure of ribosomes lacking the single Ψ and its parental strain at ∼2.4–3 Å resolution using cryo-EM. Our findings demonstrate the significance of a single Ψ on H69 to its structure and the importance for its interactions with helix 44 and specific tRNAs. Our study suggests that rRNA modification affects translation of mRNAs carrying codon bias due to selective accommodation of tRNAs by the ribosome. Based on the high-resolution structures, we propose a mechanism explaining how the ribosome selects specific tRNAs.

A UNIX shell, PERL and the R software are needed to use these scripts.

The "Unix_scripts" needs smalt, samtools, perl and Bedtools. You can use your own alignment tools if you prefer, but be sure that the alignment output in SAM/BAM format. Bedtools is mandatory. These pipelines requires paired-end sequencing data.

**HydraPsiSeq pipeline
**
HydraPsiSeq pipeline came from the repository - https://github.com/FlorianPichot/HydraPsiSeqPipeline with minor modifications

General pipeline: Alignment (Unix script) --> NormUCount (R script) --> Analysis with list of known sites(R script)
