cwlVersion: cwl:draft-3
class: Workflow
inputs:
  - id: reference
    type: File
  - id: read_1
    type: File
  - id: read_2
    type: File
  - id: reference_indices
    type: array
    items: File

outputs:
  - id: variants
    type: File
    source: "#call_variants/variants"

steps:
  - id: align
    run: bwa.cwl
    inputs:
      - id: reference
        source: "#reference"
      - id: fastq_r1
        source: "#read_1"
      - id: fastq_r2
        source: "#read_2"
      - id: reference_indices
        source: #reference_indices
    outputs:
      - id: alignment

  - id: sort
    run: bam_sort.cwl
    inputs:
      - id: bam
        source: "#align/alignment"
    outputs:
      - id: sorted_alignment

  - id: index
    run: bam_index.cwl
    inputs:
      - id: bam
        source: "#sort/sorted_alignment"
    outputs:
      - id: alignment_index

  - id: call_variants
    run: freebayes.cwl
    inputs:
      - id: alignment
        source: "#sort/sorted_alignment"
      - id: reference
        source: "#reference"
    outputs:
      - id: variants
