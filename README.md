# HealthSeq-NF Foundations: Student Project

HealthSeq-NF Foundations is a guided Nextflow project for learning how
reproducible scientific workflows are designed, tested, documented, and shared.

The project is designed for learners in pharmacy, medicine, biology,
biomedical science, public health, and related fields. No previous programming,
terminal, Git, GitHub, or Nextflow experience is required.

You will begin with one working process and progressively complete a reusable
multi-process pipeline. Your repository will record your workflow code,
explanations, modifications, and Git history.

## Paper-Based Teaching Case

The project is organized around a published case involving uropathogenic
*Escherichia coli* strain U13824.

The publication describes U13824 as a multidrug-resistant,
extended-spectrum-beta-lactamase-producing UPEC strain isolated from an adult
woman with a urinary tract infection.

Foundations uses a simplified text representation of this case so you can focus
on Nextflow and reproducibility before working with sequencing files and
bioinformatics software.

The project progression is:

```text
published biomedical case
→ simplified Foundations workflows
→ reproducible workflow concepts
→ applied sequencing analysis
→ evidence-aware interpretation
```

### Source Publication

Magaña-Lizárraga JA and colleagues. Draft genome sequence of uropathogenic
*Escherichia coli* U13824, a multidrug-resistant and
extended-spectrum-beta-lactamase-producing UPEC strain isolated from an adult
woman with urinary tract infection. *Microbiology Resource Announcements*.
2024;13(6):e00027-24.

Key identifiers:

- DOI: `10.1128/mra.00027-24`
- SRA run: `SRR21010776`
- BioProject: `PRJNA715781`
- RefSeq assembly: `GCF_033843365.1`

## Start Here

Open:

```text
COURSE_START.md
```

The guide explains how to create a personal repository, open a GitHub
Codespace, verify the environment, use the terminal, and run your first
Nextflow process.

## Project Path

```text
one process
→ one declared output
→ one file input
→ connected processes
→ parameters
→ reusable pipeline
→ personal Git history
```

Lesson 1 is complete so you can run Nextflow immediately.

Lessons 2 through 5 contain guided `STUDENT TASK` sections that you will
complete, test, troubleshoot, and commit.

## Quick Start

Verify the environment:

```bash
./scripts/check_environment.sh
```

Run Lesson 1:

```bash
nextflow -C lessons/lesson.config run \
  lessons/01_hello_nextflow.nf
```

Locate the output:

```bash
find work -name hello_nextflow.txt -type f
```

## What You Will Learn

By completing the project, you should be able to:

- use essential terminal commands;
- run a Nextflow workflow;
- identify process inputs and outputs;
- distinguish file inputs from value inputs;
- connect processes through channels;
- change workflow behavior with parameters;
- publish selected outputs;
- diagnose simple workflow errors;
- create and push meaningful Git commits;
- connect a workflow to a published scientific case;
- distinguish computational output from unsupported conclusions.

## Lessons

1. `lessons/01_first_nextflow.md`  
   Run one complete process and inspect its output.

2. `lessons/02_process_inputs.md`  
   Complete a process that receives a file and creates an output.

3. `lessons/03_channels_and_data_flow.md`  
   Connect two processes through a named output channel.

4. `lessons/04_parameters.md`  
   Make workflow behavior configurable with a parameter.

5. `lessons/05_small_pipeline.md`  
   Complete a multi-process pipeline and publish its final report.

6. `lessons/06_git_and_github.md`  
   Record meaningful project checkpoints with Git and GitHub.

7. `lessons/07_prepare_for_applied.md`  
   Review the project and propose an extension.

## Exercises

Use:

```text
exercises/FOUNDATIONS_EXERCISES.md
```

Complete the exercises after the corresponding lessons and write explanations
in your own words.

The instructor guide and answer key are intentionally not included in this
student repository.

## Your Work

You will:

- complete the guided workflow sections;
- correct controlled errors;
- test each completed workflow;
- document your progress in `MY_PROGRESS.md`;
- create meaningful commits;
- push your work to GitHub.

Suggested commits include:

```text
Run first Nextflow process
Add file input and summary output
Connect processes through a channel
Add configurable workflow parameter
Complete reusable multi-process pipeline
Document Nextflow learning progress
```

## Connecting the Paper to the Workflows

The published U13824 case provides a concrete scientific context rather than an
abstract programming exercise.

In Foundations:

- the scientific case becomes a documented input;
- each computational task becomes a process;
- channels represent movement between tasks;
- parameters make workflow behavior configurable;
- published outputs separate results from internal task files;
- Git records how the workflow developed.

The Foundations workflows use text files rather than FASTQ files. This allows
you to learn workflow concepts before adding sequencing formats and
bioinformatics tools.

As you work, consider:

1. What scientific question does the publication address?
2. Which part of the analysis does the current workflow represent?
3. Which conclusions cannot be drawn from the workflow output alone?

## Scientific Boundary

This repository teaches reproducible workflow design.

The examples do not independently:

- identify antimicrobial-resistance genes;
- confirm ESBL production;
- predict antimicrobial susceptibility;
- establish complete strain identity;
- determine an appropriate treatment;
- provide dosing or clinical guidance.

The urinary tract infection, multidrug-resistance, and ESBL context comes from
the source publication.

## Generated Files

Nextflow creates internal task files under:

```text
work/
```

The completed pipeline publishes selected outputs under:

```text
lessons/outputs/
```

These generated directories are excluded from Git.

## Automated Validation

GitHub Actions validates the student starter structure and runs Lesson 1.

As you complete the remaining workflows, you can extend the automated checks
to validate your own results.

A green check confirms successful computational execution. It does not
establish scientific or clinical validity.

## Applied Example

The complete sequencing quality-control and reference-alignment workflow is
available at:

```text
https://github.com/ofecheverm/healthseq-nf-applied
```

HealthSeq-NF Applied uses public sequencing data associated with the U13824
publication and demonstrates FastQC, fastp, BWA-MEM2, SAMtools, MultiQC, BAM
processing, reporting, provenance, and automated validation.

Foundations remains independently useful and can be extended to other
scientific workflows.

## Completion Checklist

Your project is complete when:

- [ ] Lesson 1 runs successfully;
- [ ] Lessons 2 through 5 are completed;
- [ ] the final pipeline publishes its report;
- [ ] the exercises are completed;
- [ ] `MY_PROGRESS.md` documents your learning;
- [ ] your repository contains meaningful commits;
- [ ] your work is pushed to GitHub;
- [ ] you can explain the workflow data flow;
- [ ] you can connect the workflow to the publication;
- [ ] you can distinguish computational output from unsupported conclusions.

## License

See `LICENSE` for the repository license terms.
