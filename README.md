# DSCI512_RNAseq_singleend
Fall 2022. DSCI512 RNA Sequencing Data Analysis. This is a pipeline to assist students with single-end RNA-seq data in their analysis

-----


*DSCI512 - RNA sequencing data analysis - course scripts*

*A simple set of wrappers and tools for RNA-seq analysis. These tools were designed for the DSCI512 RNA-seq analysis class at Colorado State University*

This set of pipelines are specifically designed for students who want to use **single-end** short read sequencing data.

----

## Let's download the scripts from github

**To obtain the repository of scripts**


  * Navigate into your project directory and to your subdirectory called 02_scripts
  * Use git clone as shown below to pull the information from github to your location on SUMMIT

```bash
$ cd /scratch/summit/<eID>@colostate.edu    #Replace <eID> with your EID
$ cd PROJ05_ExamProject
$ cd 02_scripts
$ git clone <paste path to github repository here>
```

**To explore what you obtained**

Notice that instead of having a single script, you now have a few scripts. These will work in a **Two step** method for executing jobs on summit. The `execute` script calls the `analyze` script. This Readme file and a license file were also downloaded.

Let's copy the two scripts up one directory. This will create duplicate copies for you to edit on and will move the scripts directly into ''02_scripts'', not its sub-directory.

```bash
$ cd 2022_DSCI512_RNAseq_singleend
$ cp execute_RNAseq_pipeline.sbatch ..
$ cp RNAseq_single_analyzer_220624.sh
$ cp RNAseq_cleanup_220615.sh ..
$ cd ..
```

-----

## Let's prepare the metadata file

  * Prepare a metadata file in which:
    * The first column is the .fastq file
    * The second column is blank
    * The third column is a nickname in the form NN01
    * The fourth column is a nickname with some information about the conditions like NN01_cond1_cond2_rep1
    * The next columns keep track of the different conditions
    * the last column is the replicate #

Example of a metadata file:
  
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

Note - You'll need to write this yourself based on the infomration you can obtain from the paper or the SRA Archive information.

--- 

## Let's execute the script

  * Amend the #SBATCH commands
  * With the execute script, add the path to your metadata file
  * Within the analyze script, amend the Modify This Section part
  * Execute the script like so...
  
  
```bash
$ sbatch execute execute_RNAseq_pipeline.sbatch
```


