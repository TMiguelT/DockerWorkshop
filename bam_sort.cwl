cwlVersion: cwl:draft-3
class: CommandLineTool
baseCommand: [samtools, sort]
stdout: alignment.sorted.bam
hints:
  - class: DockerRequirement
    dockerPull: biocontainers/samtools
inputs:
  - id: bam
    type: File
    inputBinding:
      position: 1
outputs:
  - id: output
    type: File
    outputBinding:
      glob: alignment.sorted.bam
