#!/usr/bin/env bash

#SBATCH --job-name=RNAseq_pipeline 
#SBATCH --nodes=1                           # this script is designed to run on one node
#SBATCH --ntasks=2                          # modify this number to reflect how many cores you want to use (up to 24)
#SBATCH --time=04:00:00                     # modify this number to reflect how much time to request
#SBATCH --partition=shas                    # modify this to reflect which queue you want to use. Either 'shas' or 'shas-testing'
#SBATCH --qos=normal                        # Should be 'normal' if partition is 'shas'; should be 'testing' if partition is 'shas-testing'
#SBATCH --mail-type=END                     # Keep these two lines of code if you want an e-mail sent to you when it is complete.
#SBATCH --mail-user=<youremail>             # add your e-mail here
#SBATCH --output=log_RNAseq_pipe_%j.txt     # this will capture all output in a logfile with %j as the job #


######### Instructions ###########

# Modify your SLURM entries above to fit your choices
# Below, modify the SECOND argument to point to YOUR metadata.file
# Below, you don't need to change $SLURM_NTASKS. It will automatically populate whatever you put in --ntasks=# above.
# Execute this script using $ sbatch execute_RNAseq_pipeline.sbatch



## Execute the RNA-seq_pipeline to run the pipeline
bash RNAseq_single_analyzer_220624.sh <metadatafile> $SLURM_NTASKS


## Execute the cleanup script to zip .fastq files and delete extra files
#bash RNAseq_cleanup_220615.sh <metadatafile> 



################## NOTES ##################
# A note on the metadata file:
# 
# The first column is the .fastq file. The second column is blank. 
#
# Example:
#
#SRR10398489.fastq		CYSL01	01_N2_ribo_1	N2	riboseq	1
#SRR10398490.fastq		CYSL02	02_N2_ribo_2	N2	riboseq	2
#SRR10398491.fastq		CYSL03	03_N2_ribo_3	N2	riboseq	3
#SRR10398492.fastq		CYSL04	04_meg34_ribo_1	meg34	riboseq	1
#SRR10398493.fastq		CYSL05	05_meg34_ribo_2	meg34	riboseq	2
#SRR10398494.fastq		CYSL06	06_meg34_ribo_3	meg34	riboseq	3
#SRR10398495.fastq		CYSL07	07_N2_mRNA_1	N2	mRNA	1
#SRR10398496.fastq		CYSL08	08_N2_mRNA_2	N2	mRNA	2
#SRR10398497.fastq		CYSL09	09_N2_mRNA_3	N2	mRNA	3
#SRR10398498.fastq		CYSL10	10_meg34_mRNA_1	meg34	mRNA	1
#SRR10398499.fastq		CYSL11	11_meg34_mRNA_2	meg34	mRNA	2
#SRR10398500.fastq		CYSL12	12_meg34_mRNA_3	meg34	mRNA	3