cwlVersion: cwl:draft-3
class: CommandLineTool
baseCommand: [freebayes]
stdout: variants.vcf
requirements:
  - class: InlineJavascriptRequirement
hints:
  - class: DockerRequirement
    dockerPull: heuermh/freebayes
inputs:
  - id: reference
    type: File
    inputBinding:
      prefix: --fasta-reference
    secondaryFiles:
      - $(self.basename.replace(/.fasta$/, '.dict'))
      - .amb
      - .ann
      - .bwt
      - .fai
      - .pac
      - .sa
  - id: alignment
    type: File
    inputBinding:
      position: 1
outputs:
  - id: variants
    type: File
    outputBinding:
      glob: variants.vcf
