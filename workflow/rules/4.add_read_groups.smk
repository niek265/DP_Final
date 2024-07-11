rule add_read_groups:
    input:
        "results/mapped_reads/{sample}.bam"
    output:
        "results/mapped_reads/{sample}.rg.bam"
    params:
        rg_id="ID",
        rg_lb="lib1",
        rg_pl="illumina",
        rg_pu="unit1",
        rg_sm="{sample}"
    log:
        "logs/add_read_groups/{sample}.log"
    shell:
        """(
        gatk AddOrReplaceReadGroups \
            -I {input} \
            -O {output} \
            -RGID {params.rg_id} \
            -RGLB {params.rg_lb} \
            -RGPL {params.rg_pl} \
            -RGPU {params.rg_pu} \
            -RGSM {params.rg_sm}
        ) >{log} 2>&1"""