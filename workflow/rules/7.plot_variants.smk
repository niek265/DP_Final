rule plot_variants:
    input:
        vcf_file="results/variants.vcf"
    output:
        plot_file="results/variants_plot.png"
    log:
        "logs/plot_variants.log"
    shell:
        """
        python workflow/scripts/plot_variants.py {input.vcf_file} {output.plot_file} > {log} 2>&1
        """
