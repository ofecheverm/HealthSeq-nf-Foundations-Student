# Lesson 2: Process Inputs and Outputs

## Learning Objective

By the end of this lesson, you should be able to:

- explain why a process needs an input declaration;
- identify a file channel;
- explain how Nextflow stages an input file;
- identify the relationship between an input and an output;
- locate the task directory and generated file.

## The Input File

Open:

```text
lessons/upec_context.txt
```

This small text file contains information about the published UPEC teaching
case.

The file represents data that must enter a process.

In the complete HealthSeq-NF workflow, the inputs are larger scientific files,
including paired FASTQ reads and a reference FASTA. The same underlying
Nextflow concept applies.

## The Process

Open:

```text
lessons/02_process_inputs.nf
```

The process is named:

```text
SUMMARIZE_CONTEXT
```

The process receives:

```groovy
path context_file
```

The `path` input declaration tells Nextflow that the process requires a file.

Nextflow stages the input file inside the process task directory before
executing the script.

## The Input Channel

The workflow creates a channel with:

```groovy
Channel.fromPath(...)
```

A channel transports data between the workflow and a process.

In this lesson, the channel carries one text-file path.

In HealthSeq-NF, channels carry:

- paired FASTQ files;
- sample metadata;
- a reference genome;
- alignment files;
- quality-control reports.

## Run Lesson 2

From the repository root, run:

```bash
# Run Lesson 2 with the course configuration.
nextflow -C lessons/lesson.config run lessons/02_process_inputs.nf
```

**Command key**

- `nextflow`: start Nextflow;
- `-C`: load a configuration file;
- `lessons/lesson.config`: the course configuration;
- `run`: execute the workflow;
- `lessons/02_process_inputs.nf`: the workflow file.

The lesson-specific configuration disables the complete pipeline's trace,
timeline, report, and workflow-diagram outputs. This keeps the lesson run small
and avoids overwriting reports from the main workflow.

You should see:

```text
SUMMARIZE_CONTEXT (UPEC teaching case) | 1 of 1 ✔
```

## Locate the Output

Run:

```bash
# Find the generated summary file under work/.
find work -name upec_context_summary.txt -type f
```

**Command key**

- `find`: search for files;
- `work`: the directory to search;
- `-name`: search by filename;
- `upec_context_summary.txt`: the filename to find;
- `-type f`: return regular files only.

Display the newest matching output:

```bash
# Find the newest summary file and save its path in summary_file.
summary_file="$(find work -name upec_context_summary.txt -type f -printf '%T@ %p\n' | sort -rn | head -n 1 | cut -d' ' -f2-)"

# Display the file stored in summary_file.
cat "$summary_file"
```

**Output command key**

- `summary_file=`: create a shell variable;
- `$(...)`: run the enclosed commands and store the result;
- `-printf '%T@ %p\n'`: print the modification time and file path;
- `|`: pass one command's result to the next command;
- `sort -rn`: sort numerically in reverse order, newest first;
- `head -n 1`: keep the first result;
- `cut -d' ' -f2-`: remove the timestamp and keep the file path;
- `cat`: display the selected file.

The output should contain:

- a heading;
- the contents of `upec_context.txt`;
- the name of the staged input file.

## What Nextflow Did

Nextflow:

1. read the input file path;
2. created a task directory under `work/`;
3. staged the input file in that directory;
4. executed the process script;
5. identified the declared output;
6. recorded the successful task.

## Input and Output Pattern

The lesson follows this pattern:

```text
upec_context.txt
→ SUMMARIZE_CONTEXT
→ upec_context_summary.txt
```

The complete HealthSeq-NF pipeline uses the same pattern repeatedly:

```text
paired FASTQ
→ FASTP
→ trimmed paired FASTQ
```

```text
trimmed paired FASTQ
→ BWA_MEM2_MEM
→ SAM alignment
```

```text
SAM alignment
→ SAMTOOLS_SORT_INDEX
→ sorted BAM and BAM index
```

## Check Your Understanding

Answer these questions:

1. What file enters the process?
2. What channel carries the file?
3. What does `path context_file` mean?
4. Where does Nextflow execute the process?
5. What output file is declared?
6. How is this pattern similar to the FASTQ-processing workflow?

## Controlled Input Error

This activity demonstrates a simple and informative failure.

Temporarily change:

```text
upec_context.txt
```

to:

```text
missing_context.txt
```

Run the lesson again:

```bash
# Run Lesson 2 with the incorrect input filename.
nextflow -C lessons/lesson.config run lessons/02_process_inputs.nf
```

Nextflow should report that the input file does not exist.

Read the error carefully, then restore:

```text
upec_context.txt
```

Run the lesson again and confirm that it succeeds:

```bash
# Run Lesson 2 again after restoring the correct filename.
nextflow -C lessons/lesson.config run lessons/02_process_inputs.nf
```

This demonstrates an important troubleshooting principle:

> Start with the first clear error message and verify the required inputs.

## Lesson Checkpoint

You have completed this lesson when:

- the process succeeds with the correct input;
- you locate `upec_context_summary.txt`;
- you observe one controlled missing-input error;
- you correct the path;
- the process succeeds again;
- you can explain the input, channel, process, script, and output.

## Suggested Commit

After restoring the correct file, inspect the change:

```bash
# Show changed files and the exact Lesson 2 changes.
git status
git diff -- lessons/02_process_inputs.nf
```

Save the checkpoint:

```bash
# Select the Lesson 2 workflow for the checkpoint.
git add lessons/02_process_inputs.nf

# Save the staged change with a message describing the completed work.
git commit -m "Complete process input lesson"
```

Push the commit:

```bash
# Send the commit to GitHub.
git push
```

**Git key**

- `git status`: show changed files;
- `git diff`: show the exact changes;
- `git add`: select changes for the checkpoint;
- `git commit`: save the staged changes;
- `-m`: add a message explaining what the checkpoint accomplishes;
- `git push`: send the commit to GitHub.

Git records the filename. The commit message explains what the staged change
accomplishes.

## Next Lesson

Continue with:

```text
lessons/03_channels_and_data_flow.md
```

The next lesson connects two processes so that the output of the first becomes
the input of the second.
