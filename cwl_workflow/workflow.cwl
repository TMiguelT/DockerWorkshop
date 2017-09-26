cwlVersion: v1.0
class: Workflow
requirements:
  - class: InlineJavascriptRequirement
inputs:
  read_1: File
  read_2: File
  reference:
    type: File
    secondaryFiles:
      - $(self.basename.replace(/.fasta$/, '.dict'))
      - .amb
      - .ann
      - .bwt
      - .fai
      - .pac
      - .sa

outputs:
  variants:
    type: File
    outputSource: call_variants/variants

steps:

  align:
    run: bwa.cwl
    in:
      reference: reference
      fastq_r1: read_1
      fastq_r2: read_2
    out: [alignment]

  sort:
    run: bam_sort.cwl
    in:
      alignment: align/alignment
    out: [sorted_alignment]

  index:
    run: bam_index.cwl
    in:
      bam: sort/sorted_alignment
    out: [indexed_alignment]

  call_variants:
    run: freebayes.cwl
    in:
      alignment: index/indexed_alignment
      reference: reference
    out: [variants]
