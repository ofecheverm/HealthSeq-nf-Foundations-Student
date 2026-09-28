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

```text
lessons/01_hello_nextflow.nf
```

The file contains one process named:

```text
SAY_HELLO
```

A process represents one reproducible task.

The process executes this shell command:

```bash
# Write the message into hello_nextflow.txt.
echo "Hello from Nextflow" > hello_nextflow.txt
```

**Command key**

- `echo`: produce text;
- `>`: write the text into a file;
- `hello_nextflow.txt`: the file created by the command.

The command creates a text file named:

```text
hello_nextflow.txt
```

The workflow block tells Nextflow to run the process.

## Run the Workflow

From the repository root, run:

```bash
# Run the Lesson 1 workflow.
nextflow run lessons/01_hello_nextflow.nf
```

You should see a process named `SAY_HELLO` complete successfully.

A typical process line looks similar to:

```text
SAY_HELLO | 1 of 1 ✔
```

The exact task identifier and run name may differ.

## Understand the Command

The command has three principal parts:

```bash
# Run the workflow stored in lessons/01_hello_nextflow.nf.
nextflow run lessons/01_hello_nextflow.nf
```

**Command key**

- `nextflow`: start the Nextflow program;
- `run`: execute a workflow;
- `lessons/01_hello_nextflow.nf`: identify the workflow file.

This is the same pattern used later for HealthSeq-NF Applied:

```text
nextflow run main.nf -profile test
```

That command belongs to the separate Applied repository.

## Find the Output

Nextflow executes each process inside a task directory under:

```text
work/
```

After the workflow finishes, Nextflow displays a task identifier such as:

```text
[a1/b2c3d4]
```

The first two characters identify the first part of the work-directory path.

To locate the lesson output automatically, run:

```bash
# Search under work/ for hello_nextflow.txt.
find work -name hello_nextflow.txt -type f
```

**Command key**

- `find`: search for files;
- `work`: the directory to search;
- `-name`: search by filename;
- `hello_nextflow.txt`: the filename to find;
- `-type f`: return regular files only.

Display the file:

```bash
# Display the first matching output file.
cat "$(find work -name hello_nextflow.txt -type f | head -n 1)"
```

**Command key**

- `cat`: display a file;
- `$(...)`: run the command inside and use its result;
- `|`: pass the result to the next command;
- `head -n 1`: keep only the first result.

Expected content:

```text
Hello from Nextflow
```

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

```groovy
process SAY_HELLO
```

The process name identifies the task in the Nextflow execution display.

### Output

```groovy
path "hello_nextflow.txt"
```

The output declaration tells Nextflow which generated file belongs to the
process output.

### Script

```bash
# Write the message into the declared output file.
echo "Hello from Nextflow" > hello_nextflow.txt
```

The script contains the command executed by the process.

### Workflow

```groovy
workflow {
    SAY_HELLO()
}
```

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

```text
lessons/01_hello_nextflow.nf
```

Change:

```text
Hello from Nextflow
```

to a short professional message, for example:

```text
My first reproducible Nextflow process
```

Run the workflow again:

```bash
# Run the workflow after changing the message.
nextflow run lessons/01_hello_nextflow.nf
```

Locate and display the newest output:

```bash
# Find the generated output files.
find work -name hello_nextflow.txt -type f
```

This small edit demonstrates that changing the process script changes the
generated output.

## Restore the Course Version

Before continuing, restore the original sentence:

```text
Hello from Nextflow
```

Save the file.

## Lesson Checkpoint

You have completed this lesson when:

- the `SAY_HELLO` process finishes successfully;
- you locate `hello_nextflow.txt`;
- the file contains `Hello from Nextflow`;
- you can identify the process, script, output, and workflow block.

## Next Lesson

Continue with:

```text
lessons/02_process_inputs.md
```

The next lesson introduces an input file and shows how Nextflow stages that
file for a process.
