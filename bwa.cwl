cwlVersion: cwl:draft-3
class: CommandLineTool
baseCommand: [bwa, mem]
requirements:
  - class: InlineJavascriptRequirement
stdout: alignment.sam
hints:
  - class: DockerRequirement
    dockerPull: biocontainers/bwa
inputs:
  - id: reference
    type: File
    inputBinding:
      position: 1
    secondaryFiles:
      - $(self.basename.replace(/.fasta$/, '.dict'))
      - .amb
      - .ann
      - .bwt
      - .fai
      - .pac
      - .sa
  - id: fastq_r1
    type: File
    inputBinding:
      position: 2
  - id: fastq_r2
    type: File
    inputBinding:
      position: 3
outputs:
  - id: output
    type: File
    outputBinding:
      glob: alignment.sam
