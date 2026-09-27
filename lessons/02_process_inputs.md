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

In HealthSeq-NF Applied, the inputs are larger scientific files, including
paired FASTQ reads and a reference FASTA. The same underlying Nextflow concept
applies.

## The Process

Open:

```text
lessons/02_process_inputs.nf
```

The process is named:

```text
SUMMARIZE_CONTEXT
```

The process contains two `STUDENT TASK` sections.

Complete those sections before running the workflow.

### File Input

The process must receive:

```groovy
path context_file
```

**Input key**

- `path`: declare a file input;
- `context_file`: the name used for the file inside the process.

The `path` declaration tells Nextflow that the process requires a file.

Nextflow stages the input file inside the process task directory before
executing the script.

### Declared Output

The process must create:

```text
upec_context_summary.txt
```

The output declaration tells Nextflow which file to expect after the command
finishes.

## The Input Channel

The workflow creates a channel with:

```groovy
Channel.fromPath(...)
```

A channel transports data into a process or between processes.

In this lesson, the channel carries one text-file path.

In larger workflows, channels can carry:

- paired FASTQ files;
- sample information;
- reference genomes;
- alignment files;
- quality-control reports;
- parameter values.

The lesson follows this data flow:

```text
upec_context.txt
→ input channel
→ SUMMARIZE_CONTEXT
→ upec_context_summary.txt
```

## Complete the Student Tasks

In `lessons/02_process_inputs.nf`:

1. declare `context_file` as a `path` input;
2. add shell commands that create `upec_context_summary.txt`;
3. copy the contents of `context_file` into the output.

The output filename must match the declared output exactly.

## Run Lesson 2

From the repository root, run:

```bash
# Run Lesson 2 with the course configuration.
nextflow -C lessons/lesson.config run \
  lessons/02_process_inputs.nf
```

**Command key**

- `-C`: load a configuration file;
- `lessons/lesson.config`: the course configuration;
- `run`: execute a workflow;
- `\`: continue the command on the next line.

You should see a process similar to:

```text
SUMMARIZE_CONTEXT (UPEC teaching case) | 1 of 1 ✔
```

The task identifier and run name may differ.

## Locate the Output

```bash
# Find the generated summary file under work/.
find work \
  -name upec_context_summary.txt \
  -type f
```

**Command key**

- `find`: search for files;
- `work`: search inside the `work/` directory;
- `-name`: search by filename;
- `-type f`: return regular files only.

## Display the Output

```bash
# Display the first matching summary file.
cat "$(find work -name upec_context_summary.txt -type f | head -n 1)"
```

**Command key**

- `cat`: display a file;
- `$(...)`: run the command inside and use its result;
- `|`: pass one command's result to the next;
- `head -n 1`: keep only the first result.

The output should contain the information from:

```text
lessons/upec_context.txt
```

## What Nextflow Did

Nextflow:

1. read the input-file path;
2. created a task directory under `work/`;
3. staged the input file in that directory;
4. executed the process script;
5. identified the declared output;
6. recorded the successful task.

## Input and Output Pattern

This lesson follows:

```text
upec_context.txt
→ SUMMARIZE_CONTEXT
→ upec_context_summary.txt
```

HealthSeq-NF Applied uses the same pattern with larger scientific files:

```text
paired FASTQ
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
→ sorted BAM and BAM index
```

## Check Your Understanding

Answer these questions:

1. What file enters the process?
2. What channel carries the file?
3. What does `path context_file` mean?
4. Where does Nextflow execute the process?
5. What output file is declared?
6. Why must the command create the exact declared output name?
7. How is this pattern similar to the Applied sequencing workflow?

Record your answers in:

```text
exercises/FOUNDATIONS_EXERCISES.md
```

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
# Run the workflow with the incorrect input path.
nextflow -C lessons/lesson.config run \
  lessons/02_process_inputs.nf
```

Nextflow should report that the input file does not exist.

Read the first clear error message.

Then restore:

```text
upec_context.txt
```

Run the lesson again:

```bash
# Confirm that the corrected workflow succeeds.
nextflow -C lessons/lesson.config run \
  lessons/02_process_inputs.nf
```

This demonstrates an important troubleshooting principle:

> Start with the first clear error message and verify the required inputs.

## Lesson Checkpoint

You have completed this lesson when:

- both `STUDENT TASK` sections are complete;
- the process succeeds with the correct input;
- you locate `upec_context_summary.txt`;
- you observe one controlled missing-input error;
- you correct the input path;
- the process succeeds again;
- you can explain the input, channel, process, script, and output.

## Save a Git Checkpoint

Inspect your work:

```bash
# Show the changed files.
git status

# Show the exact changes made to the Lesson 2 workflow.
git diff -- lessons/02_process_inputs.nf
```

Stage the completed workflow:

```bash
# Select the Lesson 2 workflow for the next Git checkpoint.
git add lessons/02_process_inputs.nf
```

Save the staged change:

```bash
# Save the staged work with a message describing what was completed.
git commit -m "Complete process input lesson"
```

Push the commit:

```bash
# Send the new commit to GitHub.
git push
```

**Git key**

- `git status`: show changed files;
- `git diff`: show the exact changes;
- `git add`: select changes for the next commit;
- `git commit`: save the staged changes as a checkpoint;
- `-m`: add a message explaining what the checkpoint accomplishes;
- `git push`: send local commits to GitHub.

Git records the filename. The commit message explains what the staged change
accomplishes.

## Next Lesson

Continue with:

```text
lessons/03_channels_and_data_flow.md
```

The next lesson connects two processes so that the output of the first becomes
the input of the second.
