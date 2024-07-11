rule call_variants:
    input:
        bam_files=expand("results/mapped_reads/{sample}.rg.bam", sample=get_sample_names()),
        bam_indices=expand("results/mapped_reads/{sample}.rg.bam.bai", sample=get_sample_names()),
        ref_genome=f"{data_dir}/{genome}",
        ref_genome_index=f"{data_dir}/{genome}.fai",
        ref_genome_dict=f"{data_dir}/{genome.rsplit('.', 1)[0]}.dict"
    params:
        extra=lambda wildcards, input: ' -I '.join(input.bam_files)
    output:
        "results/variants.vcf"
    log:
        "logs/gatk_haplotypecaller.log"
    shell:
        """
        (gatk HaplotypeCaller -R {input.ref_genome} -I {params.extra} -O {output}) > {log} 2>&1
        """