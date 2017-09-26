cwlVersion: cwl:draft-3
class: CommandLineTool
baseCommand: [samtools, index]
stdout: alignment.bam.bai
hints:
  - class: DockerRequirement
    dockerPull: my_samtools
inputs:
  - id: bam
    type: File
    inputBinding:
      position: 1
outputs:
  - id: output
    type: File
    outputBinding:
      glob: alignment.bam.bai
