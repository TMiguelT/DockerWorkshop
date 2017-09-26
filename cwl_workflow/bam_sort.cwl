cwlVersion: v1.0
class: CommandLineTool
baseCommand: [sort, -O, bam]
stdout: alignment.sorted.bam
hints:
  - class: DockerRequirement
    dockerPull: my_samtools
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
