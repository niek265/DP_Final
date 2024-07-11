rule trim:
    input:
        R1 = f"{results_dir}/demultiplexed/{{sample}}_R1.fastq",
        R2 = f"{results_dir}/demultiplexed/{{sample}}_R2.fastq"
    output:
        R1 = f"{results_dir}/trimmed/{{sample}}_val_1.fq",
        R2 = f"{results_dir}/trimmed/{{sample}}_val_2.fq",
        trim_flag = touch(f"{results_dir}/flags/trimmed/{{sample}}_trimmed_done")
    log:
        f"logs/trim_galore/{{sample}}.log"
    params:
        output_dir = f"{results_dir}/trimmed",
        length = config["trim_galore_min_length"]
    shell:
        """
            (
            trim_galore \
                --paired \
                --dont_gzip \
                --length {params.length} \
                --no_report_file \
                --output_dir {params.output_dir} \
                --basename {wildcards.sample} \
                {input.R1} \
                {input.R2} \
            ) > {log} 2>&1
            """
