cwlVersion: cwl:draft-3
class: CommandLineTool
baseCommand: [freebayes]
stdout: variants.vcf
hints:
  - class: DockerRequirement
    dockerPull: my_freebayes
inputs:
  - id: reference
    type: File
    inputBinding:
      prefix: --fasta-reference
  - id: alignment
    type: File
    inputBinding:
      position: 1
outputs:
  - id: variants
    type: File
    outputBinding:
      glob: variants.vcf
