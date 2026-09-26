# HealthSeq-NF Foundations: Student Project

Build a personal Nextflow project progressively, from one process to a reusable multi-process workflow.

No previous programming, terminal, Git, or Nextflow experience is required.

## Start Here

Open `COURSE_START.md`.

## Project Path

```text
one process
-> file input
-> connected processes
-> parameters
-> reusable pipeline
-> personal Git history
```

Lesson 1 is complete so you can run Nextflow immediately.

Lessons 2 through 5 contain guided `STUDENT TASK` sections that you will complete and commit.

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

## What You Will Learn

- process inputs and outputs;
- channels and dependencies;
- parameters and reusable workflows;
- publishing selected results;
- Git commits and GitHub collaboration;
- scientific interpretation boundaries.

## Project Structure

```text
COURSE_START.md
COURSE_PATH.md
lessons/
exercises/FOUNDATIONS_EXERCISES.md
scripts/check_environment.sh
```

The instructor guide and answer key are not included in this repository.

## Your Work

You will complete workflow sections, correct controlled errors, document your progress, and create meaningful commits.

Generated files under `work/` and `lessons/outputs/` are excluded from Git.

## Scientific Boundary

The examples teach reproducible workflow design. They do not independently confirm antimicrobial resistance, susceptibility, treatment suitability, or clinical conclusions.

## Applied Example

A larger sequencing workflow is available at:

```text
https://github.com/ofecheverm/healthseq-nf-applied
```

HealthSeq-NF Foundations remains independently useful and can be extended to other scientific workflows.
