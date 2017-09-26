cwlVersion: v1.0
class: CommandLineTool
baseCommand: [index]
stdout: alignment.bam.bai
requirements:
  - class: InitialWorkDirRequirement
    listing: [ $(inputs.bam) ]
hints:
  - class: DockerRequirement
    dockerPull: my_samtools
inputs:
  bam:
    type: File
    inputBinding:
      position: 1
outputs:
  indexed_alignment:
    type: File
    outputBinding:
      glob: $(inputs.bam.basename)
    secondaryFiles:
      - .bai
