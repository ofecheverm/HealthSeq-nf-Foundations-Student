# Lesson 3: Channels and Data Flow

## Learning Objective

By the end of this lesson, you should be able to:

- explain what a Nextflow channel carries;
- identify the output of one process;
- connect that output to another process;
- explain why one process waits for another;
- follow data through a two-process workflow.

## The Main Idea

Nextflow connects processes through data.

One process creates an output. Another process receives that output as an
input.

Lesson 3 follows this path:

```text
upec_context.txt
→ CREATE_CASE_REPORT
→ upec_case_report.txt
→ ADD_REPRODUCIBILITY_NOTE
→ upec_final_report.txt
```

## Open the Workflow

Open:

```text
lessons/03_channels_and_data_flow.nf
```

The workflow contains two processes:

1. `CREATE_CASE_REPORT`
2. `ADD_REPRODUCIBILITY_NOTE`

The first process is complete.

The workflow connection contains one `STUDENT TASK`.

## Process 1: Create the Case Report

`CREATE_CASE_REPORT` receives:

```groovy
path context_file
```

It creates:

```groovy
path "upec_case_report.txt", emit: report
```

**Nextflow key**

- `path context_file`: receive a file;
- `path "upec_case_report.txt"`: declare the output file;
- `emit: report`: name the output channel `report`.

The named output is available through:

```groovy
CREATE_CASE_REPORT.out.report
```

## Process 2: Add a Reproducibility Note

`ADD_REPRODUCIBILITY_NOTE` receives:

```groovy
path case_report
```

It creates:

```text
upec_final_report.txt
```

The second process cannot start until the first process creates
`upec_case_report.txt`.

This is called **data-driven execution**.

## Complete the Student Task

Find this section in the workflow block:

```groovy
// STUDENT TASK:
// Connect CREATE_CASE_REPORT.out.report
// to ADD_REPRODUCIBILITY_NOTE.
```

Use the named output from the first process as the input to the second process.

The connection uses this pattern:

```groovy
PROCESS_NAME(
    UPSTREAM_PROCESS.out.OUTPUT_NAME
)
```

Use the names already present in the workflow.

## Run Lesson 3

From the repository root, run:

```bash
# Run Lesson 3 with the course configuration.
nextflow -C lessons/lesson.config run \
  lessons/03_channels_and_data_flow.nf
```

**Command key**

- `-C`: load the course configuration;
- `run`: execute the workflow;
- `\`: continue the command on the next line.

Both processes should complete:

```text
CREATE_CASE_REPORT (U13824)
ADD_REPRODUCIBILITY_NOTE (final report)
```

The exact task identifiers may differ.

## Locate the Final Report

```bash
# Find the final report under work/.
find work \
  -name upec_final_report.txt \
  -type f
```

## Display the Final Report

```bash
# Display the first matching final report.
cat "$(find work -name upec_final_report.txt -type f | head -n 1)"
```

**Command key**

- `find`: search for a file;
- `cat`: display the file;
- `$(...)`: run the enclosed command and use its result;
- `|`: pass results to the next command;
- `head -n 1`: keep the first result.

The report should include:

```text
UPEC Teaching Case
```

It should also contain the teaching-case context and this final line:

```text
Generated with Nextflow.
```

## What Nextflow Did

Nextflow:

1. placed `upec_context.txt` in a channel;
2. passed the file to `CREATE_CASE_REPORT`;
3. created `upec_case_report.txt`;
4. passed that output to `ADD_REPRODUCIBILITY_NOTE`;
5. created `upec_final_report.txt`.

Nextflow did not need a separate instruction saying which process should run
first.

The data connection established the execution order.

## Data-Flow Pattern

The lesson demonstrates:

```text
process output
→ channel
→ next process input
```

In this workflow:

```text
CREATE_CASE_REPORT
→ report channel
→ ADD_REPRODUCIBILITY_NOTE
```

## Connection to HealthSeq-NF Applied

HealthSeq-NF Applied uses the same pattern repeatedly:

```text
raw paired FASTQ
→ fastp
→ processed paired FASTQ
```

```text
processed paired FASTQ
→ BWA-MEM2
→ alignment
```

```text
alignment
→ SAMtools
→ sorted BAM and statistics
```

```text
quality and alignment reports
→ MultiQC
→ consolidated report
```

The scientific files are larger, but the channel concept is the same.

## Check Your Understanding

Answer these questions:

1. Which process runs first?
2. What file does the first process create?
3. What does `emit: report` do?
4. How does the second process receive the first output?
5. Why must the second process wait?
6. What file does the second process create?
7. What does data-driven execution mean?

Record your answers in:

```text
exercises/FOUNDATIONS_EXERCISES.md
```

## Controlled Connection Error

Temporarily change the output name in the workflow connection from:

```groovy
report
```

to:

```groovy
missing_report
```

Run the lesson:

```bash
# Run the workflow with the incorrect output-channel name.
nextflow -C lessons/lesson.config run \
  lessons/03_channels_and_data_flow.nf
```

Read the first clear error message.

Restore the correct output name:

```groovy
report
```

Run the workflow again:

```bash
# Confirm that the corrected process connection works.
nextflow -C lessons/lesson.config run \
  lessons/03_channels_and_data_flow.nf
```

## Troubleshooting Key

When a process connection fails, check:

1. the upstream process name;
2. the emitted output name;
3. the receiving process input;
4. spelling and capitalization;
5. whether the upstream process created its output.

## Lesson Checkpoint

You have completed this lesson when:

- the `STUDENT TASK` is complete;
- both processes finish successfully;
- you locate `upec_final_report.txt`;
- you explain how the channel connects the processes;
- you reproduce and correct the controlled error;
- you can describe the complete data flow.

## Save a Git Checkpoint

Inspect your work:

```bash
# Show the changed files.
git status

# Show the Lesson 3 workflow changes.
git diff -- lessons/03_channels_and_data_flow.nf
```

Stage the workflow:

```bash
# Select the completed Lesson 3 workflow for the next checkpoint.
git add lessons/03_channels_and_data_flow.nf
```

Save the checkpoint:

```bash
# Save the staged change with a message describing the completed work.
git commit -m "Connect processes through a channel"
```

Push the commit:

```bash
# Send the new commit to GitHub.
git push
```

**Git key**

- `git status`: show changed files;
- `git diff`: show the exact changes;
- `git add`: select a change for the next checkpoint;
- `git commit`: save the staged change;
- `-m`: add a message describing what the checkpoint accomplishes;
- `git push`: send local commits to GitHub.

## Next Lesson

Continue with:

```text
lessons/04_parameters.md
```

The next lesson introduces parameters so a workflow can use different values
without rewriting its process logic.
