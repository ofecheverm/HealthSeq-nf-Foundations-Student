# Lesson 1: Your First Nextflow Workflow

## Learning Objective

By the end of this lesson, you should be able to:

- identify a Nextflow process;
- identify the command executed by a process;
- identify a process output;
- run a small Nextflow workflow;
- locate the generated output;
- explain why Nextflow uses a work directory.

## The First Workflow

Open:

    lessons/01_hello_nextflow.nf

The file contains one process named:

    SAY_HELLO

A process represents one reproducible task.

The process executes this shell command:

    echo "Hello from Nextflow" > hello_nextflow.txt

The command creates a text file named:

    hello_nextflow.txt

The workflow block tells Nextflow to run the process.

## Run the Workflow

From the repository root, run:

    nextflow run lessons/01_hello_nextflow.nf

You should see a process named `SAY_HELLO` complete successfully.

A typical process line looks similar to:

    SAY_HELLO | 1 of 1 ✔

The exact task identifier and run name may differ.

## Understand the Command

The command has three principal parts:

    nextflow run lessons/01_hello_nextflow.nf

- `nextflow` starts the Nextflow program.
- `run` means execute a workflow.
- `lessons/01_hello_nextflow.nf` identifies the workflow file.

This is the same pattern used later for HealthSeq-NF:

    the validated command documented in the applied repository

## Find the Output

Nextflow executes each process inside a task directory under:

    work/

After the workflow finishes, Nextflow displays a task identifier such as:

    [a1/b2c3d4]

The first two characters identify the first part of the work-directory path.

To locate the lesson output automatically, run:

    find work -name hello_nextflow.txt -type f

Display the file:

    cat "$(find work -name hello_nextflow.txt -type f | head -n 1)"

Expected content:

    Hello from Nextflow

## Why Is the File Under `work/`?

Nextflow uses the `work/` directory to isolate tasks and preserve execution
history.

This supports:

- reproducibility;
- parallel execution;
- task recovery;
- workflow resumption;
- inspection of commands and logs.

The `work/` directory contains generated files and should not be committed to
GitHub.

## The Four Important Parts

### Process Name

    process SAY_HELLO

The process name identifies the task in the Nextflow execution display.

### Output

    path "hello_nextflow.txt"

The output declaration tells Nextflow which generated file belongs to the
process output.

### Script

    echo "Hello from Nextflow" > hello_nextflow.txt

The script contains the command executed by the process.

### Workflow

    workflow {
        SAY_HELLO()
    }

The workflow block calls the process.

## Connection to HealthSeq-NF

HealthSeq-NF uses the same basic pattern.

For example:

- FastQC receives sequencing reads and produces quality reports.
- fastp receives paired reads and produces trimmed reads and reports.
- BWA-MEM2 receives reads and a reference index and produces an alignment.
- SAMtools receives an alignment and produces a sorted BAM and statistics.
- MultiQC receives reports and produces one consolidated report.

The full pipeline has more inputs and outputs, but every stage remains a
defined process.

## Check Your Understanding

Answer these questions before continuing:

1. What is the process name?
2. What command does the process execute?
3. What file does the process create?
4. Where did Nextflow execute the process?
5. Why should the `work/` directory remain outside Git?

## Optional Experiment

Open:

    lessons/01_hello_nextflow.nf

Change:

    Hello from Nextflow

to a short professional message, for example:

    My first reproducible Nextflow process

Run the workflow again:

    nextflow run lessons/01_hello_nextflow.nf

Locate and display the newest output:

    find work -name hello_nextflow.txt -type f

This small edit demonstrates that changing the process script changes the
generated output.

## Restore the Course Version

Before continuing, restore the original sentence:

    Hello from Nextflow

Save the file.

## Lesson Checkpoint

You have completed this lesson when:

- the `SAY_HELLO` process finishes successfully;
- you locate `hello_nextflow.txt`;
- the file contains `Hello from Nextflow`;
- you can identify the process, script, output, and workflow block.

## Next Lesson

Continue with:

    lessons/02_process_inputs.md

The next lesson introduces an input file and shows how Nextflow stages that
file for a process.
