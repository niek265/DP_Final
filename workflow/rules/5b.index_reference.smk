rule index_reference:
    input:
        ref_genome=f"{data_dir}/{genome}"
    output:
        ref_genome_index=f"{data_dir}/{genome}.fai"
    log:
        "logs/index_reference.log"
    shell:
        "(samtools faidx {input.ref_genome}) >{log} 2>&1"