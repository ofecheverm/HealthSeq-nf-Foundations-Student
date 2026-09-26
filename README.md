# HealthSeq-NF Foundations: Instructor Reference

HealthSeq-NF Foundations is a runnable, beginner-friendly Nextflow project for
learning how reproducible computational workflows are designed, executed,
modified, tested, and shared.

The repository is designed for learners in pharmacy, medicine, biology,
biomedical science, public health, and related fields. No previous experience
with programming, GitHub, the terminal, Git, or Nextflow is required.

The project begins with one small process and develops progressively into a
reusable multi-process pipeline with inputs, outputs, channels, parameters,
dependencies, published results, version control, and automated validation.

## Start Here

Open:

- `COURSE_START.md`

The guide begins with GitHub and Codespaces, introduces essential terminal
commands, and then leads through the Nextflow examples in order.

After opening a GitHub Codespace, the first terminal command is:

```bash
pwd
```

## What This Repository Does

The repository contains five executable Nextflow workflows.

The progression is:

```text
one process
→ one declared output
→ one file input
→ two connected processes
→ one parameterized workflow
→ one reusable three-process pipeline
```

Each workflow can be run independently and inspected through the generated
files under Nextflow's `work/` directory.

The final foundations pipeline also publishes a user-facing report outside the
internal task directories.

## Learning Outcomes

After completing the project, learners should be able to:

- navigate a GitHub repository and GitHub Codespace;
- use essential terminal commands;
- run a Nextflow workflow;
- identify process inputs, scripts, and outputs;
- distinguish file inputs from value inputs;
- explain how channels connect processes;
- explain why downstream processes wait for upstream outputs;
- modify workflow behavior through parameters;
- publish selected results with `publishDir`;
- diagnose simple input and connection errors;
- create meaningful Git commits;
- push individual work to GitHub;
- distinguish successful computation from scientific or clinical
  interpretation.

Learners are not expected to memorize every Nextflow or Groovy syntax detail.

## Quick Start

Verify the configured environment:

```bash
./scripts/check_environment.sh
```

Run the first workflow:

```bash
nextflow -C lessons/lesson.config run \
  lessons/01_hello_nextflow.nf
```

Run the reusable three-process pipeline:

```bash
nextflow -C lessons/lesson.config run \
  lessons/05_small_pipeline.nf
```

Display its published report:

```bash
cat lessons/outputs/lesson5_final_report.txt
```

## Project Structure

```text
.
├── COURSE_START.md
├── COURSE_PATH.md
├── APPLIED_WORKSHOP.md
├── lessons/
│   ├── 01_hello_nextflow.nf
│   ├── 01_first_nextflow.md
│   ├── 02_process_inputs.nf
│   ├── 02_process_inputs.md
│   ├── 03_channels_and_data_flow.nf
│   ├── 03_channels_and_data_flow.md
│   ├── 04_parameters.nf
│   ├── 04_parameters.md
│   ├── 05_small_pipeline.nf
│   ├── 05_small_pipeline.md
│   ├── 06_git_and_github.md
│   ├── 07_prepare_for_applied.md
│   ├── lesson.config
│   └── upec_context.txt
├── exercises/
│   ├── FOUNDATIONS_EXERCISES.md
│   └── FOUNDATIONS_ANSWER_KEY.md
├── docs/
│   └── INSTRUCTOR_GUIDE.md
├── scripts/
│   └── check_environment.sh
├── .devcontainer/
└── .github/workflows/
```

## Executable Examples

### 1. One Process and One Output

```bash
nextflow -C lessons/lesson.config run \
  lessons/01_hello_nextflow.nf
```

Introduces:

- `process`;
- `script`;
- declared output;
- `workflow`;
- the Nextflow `work/` directory.

### 2. File Input and Output

```bash
nextflow -C lessons/lesson.config run \
  lessons/02_process_inputs.nf
```

Introduces:

- `path` inputs;
- file channels;
- input staging;
- generated outputs;
- missing-input troubleshooting.

### 3. Channels and Dependencies

```bash
nextflow -C lessons/lesson.config run \
  lessons/03_channels_and_data_flow.nf
```

Introduces:

- named output channels;
- `emit`;
- downstream process inputs;
- data-driven execution;
- process dependencies.

### 4. Parameters and Reuse

```bash
nextflow -C lessons/lesson.config run \
  lessons/04_parameters.nf \
  --case_name "My reproducible case"
```

Introduces:

- default parameters;
- command-line overrides;
- `val` inputs;
- `Channel.value`;
- reuse without rewriting process logic.

### 5. Reusable Multi-Process Pipeline

```bash
nextflow -C lessons/lesson.config run \
  lessons/05_small_pipeline.nf \
  --case_name "My learning pipeline" \
  --lesson_outdir lessons/custom_outputs
```

Introduces:

- file and value inputs;
- three connected processes;
- named output channels;
- parameterized behavior;
- `publishDir`;
- evidence boundaries;
- user-facing final outputs.

## Why the Examples Use a Health Context

The examples are connected to a published case involving uropathogenic
*Escherichia coli* strain U13824.

The health context helps learners connect workflow design to familiar ideas:

- defined analytical procedures;
- required inputs;
- quality control;
- traceability;
- reproducibility;
- evidence limitations.

The foundations workflows use small text files rather than sequencing files so
that learners can concentrate on Nextflow concepts before adding
bioinformatics complexity.

## Scientific Boundary

This repository teaches computational workflow design.

The examples do not independently:

- analyze antimicrobial-resistance genes;
- confirm ESBL production;
- predict antimicrobial susceptibility;
- identify an appropriate treatment;
- provide dosing guidance;
- provide clinical decision support.

The clinical and antimicrobial-resistance context comes from the associated
publication, not from the foundations workflows.

## Reuse and Extension

The workflows are intentionally small, but the patterns are scalable.

The same foundations can be extended to:

- sequencing quality control;
- data preprocessing;
- reference alignment;
- variant-analysis preparation;
- report aggregation;
- image-processing workflows;
- laboratory data transformation;
- reproducible research pipelines in other scientific domains.

A learner can replace the text input, add processes, expose additional
parameters, introduce containers, or publish different outputs while preserving
the same Nextflow design principles.

## Git and GitHub

Participants create individual project histories through meaningful commits.

Examples include:

```text
Complete first Nextflow process
Complete process input lesson
Complete channels and data-flow lesson
Add parameterized workflow example
Complete reusable pipeline
Document Nextflow learning progress
```

The repository includes guidance for:

```text
edit
→ inspect
→ stage
→ commit
→ push
```

Generated files under `work/` and lesson output directories remain excluded
from version control.

## Automated Validation

GitHub Actions runs every executable foundations workflow and checks the
expected outputs.

The automated validation confirms that:

- the environment contains Java and Nextflow;
- required lesson files exist;
- Lessons 1 through 5 execute successfully;
- expected report content is generated;
- the repository remains reproducible after changes.

A green automated check demonstrates computational reproducibility under the
recorded repository revision. It does not establish scientific or clinical
validity.

## Using This Repository as a Template

This repository can be used as a GitHub template.

A learner can:

1. select **Use this template**;
2. create a personal repository;
3. open a GitHub Codespace;
4. follow `COURSE_START.md`;
5. complete the exercises;
6. create an individual commit history;
7. extend the workflows according to personal or research interests.

The resulting repository belongs to the learner and can serve as evidence of
workflow-development, reproducibility, Git, and scientific-communication
skills.

## Further Application

The foundations in this repository can be applied to larger scientific
workflows.

A complete UPEC sequencing quality-control and reference-alignment project is
available in the separate HealthSeq-NF repository:

```text
https://github.com/ofecheverm/healthseq-nf-applied
```

That repository demonstrates FastQC, fastp, BWA-MEM2, SAMtools, MultiQC,
containers, GitHub Actions, and documented result interpretation.

HealthSeq-NF Foundations remains useful independently. The applied repository
is one example of how the same Nextflow principles can scale.

## Documentation

- Getting started: `COURSE_START.md`
- Project progression: `COURSE_PATH.md`
- Applied example: `APPLIED_WORKSHOP.md`
- Learner exercises: `exercises/FOUNDATIONS_EXERCISES.md`
- Instructor guidance: `docs/INSTRUCTOR_GUIDE.md`
- Instructor answer key: `exercises/FOUNDATIONS_ANSWER_KEY.md`

## License

See `LICENSE` for the repository's license terms.
