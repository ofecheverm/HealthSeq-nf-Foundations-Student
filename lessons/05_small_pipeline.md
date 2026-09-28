# Lesson 5: Build a Small Reusable Pipeline

## Learning Objective

By the end of this lesson, you should be able to:

- follow data through three connected processes;
- use both a file input and a parameter;
- identify named output channels;
- explain why downstream processes must wait;
- publish a final result outside the `work/` directory;
- reuse one workflow with different parameter values.

## Pipeline Map

Lesson 5 combines the concepts introduced in Lessons 1 to 4:

```text
upec_context.txt
+ case_name parameter
→ CREATE_CASE_SUMMARY
→ case_summary.txt
→ ADD_EVIDENCE_BOUNDARY
→ bounded_case_summary.txt
→ FINALIZE_LESSON_REPORT
→ lesson5_final_report.txt
```

Open:

```text
lessons/05_small_pipeline.nf
```

The workflow contains three processes:

1. `CREATE_CASE_SUMMARY`
2. `ADD_EVIDENCE_BOUNDARY`
3. `FINALIZE_LESSON_REPORT`

## Process 1: Create the Case Summary

The first process receives:

```groovy
path context_file
val case_name
```

`path` represents a file.

`val` represents a value.

The process creates `case_summary.txt` and emits the named output channel:

```groovy
CREATE_CASE_SUMMARY.out.summary
```

**Nextflow key**

- `path context_file`: receive a file;
- `val case_name`: receive a value;
- `emit: summary`: name the output channel `summary`;
- `.out.summary`: access the named output from the process.

## Process 2: Add an Evidence Boundary

The second process receives the first process output.

The second process adds an important scientific boundary:

> Sequencing quality control and alignment do not independently confirm
> antimicrobial susceptibility or treatment recommendations.

The process emits:

```groovy
ADD_EVIDENCE_BOUNDARY.out.bounded_report
```

**Output key**

- `emit: bounded_report`: name the output channel `bounded_report`;
- `.out.bounded_report`: access the named output from the process.

## Process 3: Publish the Final Report

The third process receives the bounded report and creates:

```text
lesson5_final_report.txt
```

The process uses:

```groovy
publishDir params.lesson_outdir, mode: 'copy'
```

**Publication key**

- `publishDir`: copy selected outputs to a user-facing directory;
- `params.lesson_outdir`: use the output directory selected by the parameter;
- `mode: 'copy'`: copy the file instead of creating a link.

Nextflow executes the task under `work/`, then copies the declared final output
to the selected lesson output directory.

## Run the Default Pipeline

From the repository root, run:

```bash
# Run Lesson 5 with the course configuration.
nextflow -C lessons/lesson.config run lessons/05_small_pipeline.nf
```

**Command key**

- `nextflow`: start Nextflow;
- `-C`: load a configuration file;
- `lessons/lesson.config`: the course configuration;
- `run`: execute the workflow;
- `lessons/05_small_pipeline.nf`: the workflow file.

Expected processes:

```text
CREATE_CASE_SUMMARY (U13824)
ADD_EVIDENCE_BOUNDARY (evidence boundary)
FINALIZE_LESSON_REPORT (final report)
```

All three processes should complete successfully.

Display the published report:

```bash
# Display the final report from the default output directory.
cat lessons/outputs/lesson5_final_report.txt
```

**Command key**

- `cat`: display a file;
- `lessons/outputs/`: the default published-output directory;
- `lesson5_final_report.txt`: the final report.

The report should contain:

- the U13824 case name;
- the public sequencing context;
- the evidence boundary;
- the reproducibility statement.

## Run with Custom Parameters

Run:

```bash
# Run Lesson 5 with a custom case name and output directory.
nextflow -C lessons/lesson.config run \
  lessons/05_small_pipeline.nf \
  --case_name "My UPEC learning case" \
  --lesson_outdir lessons/custom_outputs
```

**Parameter key**

- `--case_name`: change the case-name parameter;
- `"My UPEC learning case"`: provide the custom case name;
- `--lesson_outdir`: change the published-output directory;
- `lessons/custom_outputs`: provide the custom directory;
- `\`: continue the same command on the next line.

Display the custom report:

```bash
# Display the report from the custom output directory.
cat lessons/custom_outputs/lesson5_final_report.txt
```

The report should contain:

```text
Teaching case: My UPEC learning case
```

The workflow source code and process connections did not change.

Only the parameter values changed.

## What Nextflow Determined

Nextflow determined that:

1. Process 1 could begin when the file and case-name value were available.
2. Process 2 had to wait for the Process 1 output.
3. Process 3 had to wait for the Process 2 output.
4. The final report should be copied to the selected output directory.

This is data-driven execution.

## Connection to the Applied Workshop

The complete HealthSeq-NF pipeline uses the same pattern:

```text
scientific input
→ process
→ declared output
→ downstream process
→ published results
```

The applied pipeline uses FASTQ, FASTA, SAM, BAM, and report files, but the
underlying Nextflow principles are the same.

## Check Your Understanding

1. What two inputs does Process 1 receive?
2. What is the difference between `path` and `val`?
3. What output does Process 1 emit?
4. Why must Process 2 wait?
5. What does Process 2 add to the report?
6. What does `publishDir` do?
7. Where is the default report published?
8. How can the case name be changed without editing the workflow?
9. How can the output location be changed?
10. Why is the evidence boundary important?

## Lesson Checkpoint

You have completed this lesson when:

- all three processes complete successfully;
- the default report exists;
- the custom report exists;
- you explain the three process connections;
- you distinguish `path` from `val`;
- you explain `publishDir`;
- you change workflow behavior through parameters.

## Next Lesson

Continue with:

```text
lessons/06_git_and_github.md
```

The next lesson explains how to save meaningful project checkpoints with Git
and publish those commits to GitHub.
