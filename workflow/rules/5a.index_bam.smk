rule index_bam:
    input:
        "results/mapped_reads/{sample}.rg.bam"
    output:
        "results/mapped_reads/{sample}.rg.bam.bai"
    log:
        "logs/index_bam/{sample}.log"
    shell:
        "(samtools index {input}) > {log} 2>&1"