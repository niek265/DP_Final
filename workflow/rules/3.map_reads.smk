rule map_reads:
    input:
        R1 = f"{results_dir}/trimmed/{{sample}}_val_1.fq",
        R2 = f"{results_dir}/trimmed/{{sample}}_val_2.fq",
        genome = f"{data_dir}/{genome}",
        genome_index = f"{data_dir}/{genome}.amb"
    output:
        "results/mapped_reads/{sample}.bam"
    log:
        "logs/bwa_mem/{sample}.log"
    shell:
        """
        (
        bwa mem -t4 {input.genome} {input.R1} {input.R2} | 
        samtools view -bS - > {output}
        ) > {log} 2>&1
        """


