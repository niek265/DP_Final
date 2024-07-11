rule index_genome:
    input:
        genome_file=f"{data_dir}/{genome}"
    output:
        genome_index = f"{data_dir}/{genome}.amb",
    log:
        "logs/bwa_index.log"
    message:
        "Indexing the genome"
    shell:
        """
        (
            bwa index {input.genome_file}
        ) > {log} 2>&1
        """