import os

def get_sample_names():
    """Get sample names from barcode file and check if trimming has been done."""
    sample_names = []
    barcode_path = os.path.join(data_dir, barcode_file)
    trimmed_dir = os.path.join(data_dir, "trimmed")

    with open(barcode_path, "r") as bf:
        for line in bf:
            split_line = line.strip().split(" ")
            sample_name = split_line[1].split("_R")[0]
            sample_names.append(sample_name)

    # Check if trimming has already been done
    if not os.path.exists("results/flags/trimmed/*"):
        return sample_names

    # Filter out samples with empty trimmed files
    non_empty_samples = [s for s in sample_names if os.path.getsize(os.path.join(trimmed_dir, f"{s}.trimmed.fastq.gz")) > 0]
    return non_empty_samples
