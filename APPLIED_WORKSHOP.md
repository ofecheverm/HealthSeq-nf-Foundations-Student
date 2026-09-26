# Further Application

HealthSeq-NF Foundations teaches reusable workflow-development patterns with
small text-based examples.

The same patterns can scale to scientific files, software containers, larger
process graphs, and automated analysis pipelines.

## Applied HealthSeq-NF

A complete sequencing quality-control and reference-alignment example is
available at:

```text
https://github.com/ofecheverm/healthseq-nf-applied
```

That project applies Nextflow to:

```text
paired FASTQ
→ FastQC
→ fastp
→ BWA-MEM2
→ SAMtools
→ MultiQC
```

The applied repository demonstrates:

- public sequencing inputs;
- containerized bioinformatics tools;
- reference indexing and alignment;
- sorted and indexed BAM files;
- alignment statistics;
- consolidated reporting;
- GitHub Actions validation;
- documented scientific limitations.

## Before Moving to a Larger Project

Learners should be able to explain:

- process;
- input;
- output;
- channel;
- dependency;
- parameter;
- `publishDir`;
- commit;
- push.

The applied repository is one possible extension. The Foundations project can
also be adapted to other computational and scientific domains.
