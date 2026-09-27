# Lesson 1: Your First Nextflow Workflow

## Learning Objective

By the end of this lesson, you should be able to:

- identify a Nextflow process;
- identify the command executed by a process;
- identify a declared output;
- run a small Nextflow workflow;
- locate and display the generated output;
- explain why Nextflow uses a `work/` directory.

## Open the Workflow

Open:

```text
lessons/01_hello_nextflow.nf
```

The file contains one process named:

```text
SAY_HELLO
```

A process represents one reproducible task.

The process executes:

```bash
# Write a message into hello_nextflow.txt.
echo "Hello from Nextflow" > hello_nextflow.txt
```

**Command key**

- `echo`: produce text;
- `>`: write the text into a file;
- `hello_nextflow.txt`: the file created by the command.

## Four Important Workflow Parts

### Process Name

```groovy
process SAY_HELLO {
```

This defines a process named `SAY_HELLO`.

### Output

```groovy
output:
path "hello_nextflow.txt"
```

This tells Nextflow that the process must create:

```text
hello_nextflow.txt
```

### Script

```groovy
script:
"""
echo "Hello from Nextflow" > hello_nextflow.txt
"""
```

The `script` block contains the command executed by the process.

### Workflow

```groovy
workflow {
    SAY_HELLO()
}
```

The `workflow` block calls the process.

## Run the Workflow

From the repository root, run:

```bash
# Run Lesson 1 with the course configuration.
nextflow -C lessons/lesson.config run \
  lessons/01_hello_nextflow.nf
```

**Command key**

- `nextflow`: start Nextflow;
- `-C`: load a configuration file;
- `lessons/lesson.config`: the course configuration;
- `run`: execute a workflow;
- `lessons/01_hello_nextflow.nf`: the workflow file;
- `\`: continue the command on the next line.

The `SAY_HELLO` process should complete successfully.

A typical process line looks similar to:

```text
SAY_HELLO | 1 of 1 ✔
```

The task identifier and run name may differ.

## Find the Output

Nextflow executes each process inside a task directory under:

```text
work/
```

Locate the generated file:

```bash
# Search for the generated output file under work/.
find work -name hello_nextflow.txt -type f
```

**Command key**

- `find`: search for files;
- `work`: search inside the `work/` directory;
- `-name`: search by filename;
- `-type f`: return regular files only.

The result will look similar to:

```text
work/a1/b2c3d4/hello_nextflow.txt
```

The exact path will be different for each run.

## Display the Output

```bash
# Display the first matching output file.
cat "$(find work -name hello_nextflow.txt -type f | head -n 1)"
```

**Command key**

- `cat`: display a file;
- `$(...)`: run the command inside and use its result;
- `|`: pass the result from one command to the next;
- `head -n 1`: keep only the first result.

Expected content:

```text
Hello from Nextflow
```

## Why Is the File Under `work/`?

Nextflow uses `work/` to keep the files and information created during each
process execution.

This supports:

- reproducibility;
- parallel execution;
- workflow resumption;
- error investigation;
- inspection of commands and logs.

The `work/` directory contains generated files. These files can be recreated by
running the workflow again, so `work/` should not be committed to GitHub.

## The Complete Pattern

Lesson 1 demonstrates:

```text
process
→ command
→ declared output
```

For this workflow:

```text
SAY_HELLO
→ echo command
→ hello_nextflow.txt
```

## Connection to HealthSeq-NF Applied

HealthSeq-NF Applied uses the same pattern for larger scientific tasks:

- FastQC receives sequencing reads and creates quality reports;
- fastp receives paired reads and creates processed reads and reports;
- BWA-MEM2 receives reads and a reference and creates an alignment;
- SAMtools receives alignment data and creates BAM files and statistics;
- MultiQC receives reports and creates a consolidated report.

The Applied workflow contains more inputs, outputs, and processes, but each
stage remains one defined computational task.

## Check Your Understanding

Answer these questions before continuing:

1. What is the process name?
2. What command does the process execute?
3. What file does the process create?
4. What does the output declaration tell Nextflow?
5. Where does Nextflow execute the process?
6. Why should `work/` remain outside Git?

Record your answers in:

```text
exercises/FOUNDATIONS_EXERCISES.md
```

## Optional Experiment

Open:

```text
lessons/01_hello_nextflow.nf
```

Change:

```text
Hello from Nextflow
```

to:

```text
My first reproducible Nextflow process
```

The edited command should be:

```groovy
echo "My first reproducible Nextflow process" > hello_nextflow.txt
```

Save the file and run the workflow again:

```bash
# Run the edited workflow.
nextflow -C lessons/lesson.config run \
  lessons/01_hello_nextflow.nf
```

Locate the generated files:

```bash
# Find all Lesson 1 output files.
find work -name hello_nextflow.txt -type f
```

Display one result:

```bash
# Display the first matching output file.
cat "$(find work -name hello_nextflow.txt -type f | head -n 1)"
```

This experiment demonstrates that changing the process command changes the
generated output.

## Restore the Course Version

Before continuing, restore:

```text
Hello from Nextflow
```

The command should again be:

```groovy
echo "Hello from Nextflow" > hello_nextflow.txt
```

Save the file.

Check whether Git still detects a change:

```bash
# Show changed files.
git status

# Show the exact change, if one remains.
git diff -- lessons/01_hello_nextflow.nf
```

**Git key**

- `git status`: show changed files;
- `git diff`: show the exact changes;
- `--`: separate the Git options from the filename.

If the original text was restored exactly, Git should not report a remaining
change to `lessons/01_hello_nextflow.nf`.

## Lesson Checkpoint

You have completed this lesson when:

- the `SAY_HELLO` process finishes successfully;
- you locate `hello_nextflow.txt`;
- the file contains `Hello from Nextflow`;
- you can identify the process, script, output, and workflow block;
- you can explain why Nextflow uses `work/`.

## Next Lesson

Continue with:

```text
lessons/02_process_inputs.md
```

The next lesson introduces a file input and shows how Nextflow makes that file
available to a process.
