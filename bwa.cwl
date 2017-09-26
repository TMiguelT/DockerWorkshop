cwlVersion: cwl:draft-3
class: CommandLineTool
baseCommand: [bwa, mem]
stdout: alignment.bam
hints:
  - class: DockerRequirement
    dockerPull: my_bwa
inputs:
  - id: reference
    type: File
    inputBinding:
      position: 1
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
      glob: alignment.bam
