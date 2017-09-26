cwlVersion: v1.0
class: CommandLineTool
baseCommand: [bwa, mem]
requirements:
  - class: InlineJavascriptRequirement
stdout: alignment.sam
hints:
  - class: DockerRequirement
    dockerPull: biocontainers/bwa
inputs:
  reference:
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
  fastq_r1:
    type: File
    inputBinding:
      position: 2
  fastq_r2:
    type: File
    inputBinding:
      position: 3
outputs:
  alignment:
    type: File
    outputBinding:
      glob: alignment.sam
