#/bin/bash

# This analysis is performed on Computerome 2.0 (The Danish National Life Science Supercomputing Center)

cd /home/projects/cu_10181/people/tuhu/kelvin_collaboration
module load jdk/18.0.2.1 nextflow/22.10.4 singularity/3.9.6 anaconda3/2023.03
nextflow run nf-core/rnaseq \
    -revision 3.12.0 \
    -profile singularity \
    -w data/nextflow_wd \
    --trimmer fastp \
    --pseudo_aligner salmon \
    --fasta /home/projects/cu_10181/data/_reference/mus_musculus/Mus_musculus.GRCm39.dna.primary_assembly.fa \
    --gtf /home/projects/cu_10181/data/_reference/mus_musculus/Mus_musculus.GRCm39.109.gtf \
    --input data/nextflow_input.csv \
    --outdir data/nextflow_outputdir \
    --max_cpus 40 \
    --max_memory 170GB \
    -resume

# The job submission code to Computerome.

# qsub -W group_list=ku_00216 -A ku_00216 -l nodes=1:thinnode:ppn=40,mem=175gb,walltime=120:00:00 /home/projects/cu_10181/people/tuhu/kelvin_collaboration/analysis/1_nfcore_rnaseq_mapping.sh

