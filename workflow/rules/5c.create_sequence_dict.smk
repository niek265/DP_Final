rule create_sequence_dict:
    input:
        ref_genome=f"{data_dir}/{genome}"
    output:
        ref_genome_dict=f"{data_dir}/{genome.rsplit('.', 1)[0]}.dict"
    log:
        "logs/create_dict.log"
    shell:
        """(
        gatk CreateSequenceDictionary \
            -R {input.ref_genome} \
            -O {output.ref_genome_dict}
        ) >{log} 2>&1"""