import matplotlib.pyplot as plt
import re

# Constants
VCF_FILE = "/home/nieks/DataspellProjects/DP2_Final/variants_test.vcf"
OUTPUT_FILE = "/home/nieks/DataspellProjects/DP2_Final/results/variants_plot.png"
HEADER_RE = re.compile(r'[ \t]+')


def extract_variant_qualities(vcf_file):
    """Extract variant qualities from a VCF file."""
    variant_qualities = []
    with open(vcf_file, 'r') as file:
        for line in file:
            if line.startswith('##'):
                continue
            elif line.startswith('#'):
                header = re.split(HEADER_RE, line)
            else:
                data = re.split(HEADER_RE, line)
                variant_qualities.append(int(data[5]))
    return variant_qualities


def plot_variant_qualities(variant_qualities, output_file):
    """Create and save a scatter plot of variant qualities."""
    plt.figure(figsize=(10, 6))
    plt.scatter(range(len(variant_qualities)), variant_qualities)
    plt.title("Quality Scores Scatterplot")
    plt.xlabel("Variant Index")
    plt.ylabel("Quality Score")
    plt.savefig(output_file)


def main():
    variant_qualities = extract_variant_qualities(VCF_FILE)
    plot_variant_qualities(variant_qualities, OUTPUT_FILE)


if __name__ == "__main__":
    main()
