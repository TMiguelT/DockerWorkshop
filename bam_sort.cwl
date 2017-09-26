cwlVersion: v1.0
class: CommandLineTool
baseCommand: [samtools, sort, -O, bam]
stdout: alignment.sorted.bam
hints:
  - class: DockerRequirement
    dockerPull: biocontainers/samtools
inputs:
  alignment:
    type: File
    inputBinding:
      position: 1
outputs:
  sorted_alignment:
    type: File
    outputBinding:
      glob: alignment.sorted.bam
