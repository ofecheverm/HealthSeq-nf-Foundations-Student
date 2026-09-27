# Lesson 4: Parameters and Reusable Workflows

## Learning Objective

By the end of this lesson, you should be able to:

- explain what a Nextflow parameter is;
- identify a parameter default;
- pass a parameter through a value channel;
- override a parameter from the command line;
- explain why parameters make workflows reusable.

## Why Parameters Matter

Parameters let users change selected values without rewriting workflow code.

Examples include:

- an input file;
- a case label;
- a reference genome;
- an output directory.

In this lesson, the parameter controls the teaching-case name.

## Open the Workflow

Open:

```text
lessons/04_parameters.nf
```

The workflow contains three `STUDENT TASK` sections:

1. define the parameter;
2. create a value channel;
3. pass the channel to the process.

## Student Task 1: Define the Parameter

Define a parameter named:

```text
case_name
```

Give it this default value:

```text
U13824
```

Use this pattern:

```groovy
params.parameter_name = 'default value'
```

**Parameter key**

- `params`: Nextflow's collection of workflow parameters;
- `parameter_name`: the name used to access the parameter;
- `'default value'`: the value used when the user provides no replacement.

## The Process Input

The process already contains:

```groovy
input:
val case_name
```

**Input key**

- `val`: receive a value;
- `case_name`: the name used for that value inside the process.

Earlier lessons used `path` for files:

```groovy
path context_file
```

This lesson uses `val` because `case_name` is text, not a file.

## Student Task 2: Create a Value Channel

Create a channel from:

```text
params.case_name
```

Use this pattern:

```groovy
channel_name = Channel.value(value)
```

**Channel key**

- `Channel.value(...)`: create a channel containing one value;
- `params.case_name`: retrieve the current parameter value;
- `channel_name`: store the channel for use in the workflow.

## Student Task 3: Call the Process

Pass the value channel to:

```text
CREATE_PARAMETER_REPORT
```

Use this pattern:

```groovy
PROCESS_NAME(channel_name)
```

The completed data flow should be:

```text
case_name parameter
→ value channel
→ CREATE_PARAMETER_REPORT
→ parameter_report.txt
```

## Run with the Default Value

After completing all three student tasks, run:

```bash
# Run Lesson 4 with the default parameter value.
nextflow -C lessons/lesson.config run \
  lessons/04_parameters.nf
```

The process should complete with a label similar to:

```text
CREATE_PARAMETER_REPORT (U13824)
```

## Locate the Output

```bash
# Find the generated parameter report.
find work \
  -name parameter_report.txt \
  -type f
```

## Display the Output

```bash
# Display the first matching parameter report.
cat "$(find work -name parameter_report.txt -type f | head -n 1)"
```

Expected content:

```text
Teaching case: U13824
```

## Run with a Different Value

Override the default parameter:

```bash
# Run the same workflow with a different case-name value.
nextflow -C lessons/lesson.config run \
  lessons/04_parameters.nf \
  --case_name "Published UPEC case"
```

**Command key**

- `--case_name`: select the parameter to change;
- `"Published UPEC case"`: provide the new value;
- `--`: Nextflow parameters begin with two hyphens;
- quotation marks keep the words together as one value.

The workflow code remains unchanged. Only the parameter value changes.

## Display the Custom Result

Because several reports may now exist under `work/`, find the report containing
the custom value:

```bash
# Search generated reports for the custom case name.
grep -R -l \
  "Teaching case: Published UPEC case" \
  work
```

**Command key**

- `grep`: search inside files;
- `-R`: search through directories and subdirectories;
- `-l`: display only matching filenames;
- `"..."`: the text to search for;
- `work`: the directory to search.

Save the first matching path and display the file:

```bash
# Save the first matching report path.
parameter_report="$(
  grep -R -l \
    "Teaching case: Published UPEC case" \
    work |
  head -n 1
)"

# Display the selected report.
cat "$parameter_report"
```

Expected content:

```text
Teaching case: Published UPEC case
```

## Parameter Versus Code Change

Use a parameter when changing a value that the workflow is designed to accept.

Examples include:

- a case label;
- an input sample sheet;
- a reference file;
- an output directory.

Edit the workflow code when changing the workflow's logic or structure.

For beginners, changing a documented parameter is usually safer than changing
a process command.

## Connection to HealthSeq-NF Applied

HealthSeq-NF Applied uses parameters such as:

```text
--input
--reference
--outdir
--help
```

For example:

```bash
# Run the Applied workflow with a custom output directory.
nextflow run main.nf \
  -profile test \
  --outdir student_results
```

This command belongs to the separate HealthSeq-NF Applied repository.

**Applied command key**

- `-profile test`: select the validated teaching profile;
- `--outdir`: select the output-directory parameter;
- `student_results`: provide the new output-directory name.

Parameters make workflows easier to:

- reuse;
- test;
- share;
- document;
- automate;
- adapt safely.

## Check Your Understanding

Answer these questions:

1. What is the parameter name?
2. What is its default value?
3. What type of process input receives the value?
4. What channel carries the parameter?
5. How do you override the default from the command line?
6. Did changing the parameter require editing the process?
7. Why do parameters improve reproducibility?

Record your answers in:

```text
exercises/FOUNDATIONS_EXERCISES.md
```

## Controlled Parameter Experiment

Run the workflow with your own label:

```bash
# Override case_name with a new value.
nextflow -C lessons/lesson.config run \
  lessons/04_parameters.nf \
  --case_name "My reproducible workflow"
```

Search for the result:

```bash
# Find the report containing your custom value.
grep -R -l \
  "Teaching case: My reproducible workflow" \
  work
```

Run the workflow again without `--case_name`:

```bash
# Run the workflow with its default parameter value.
nextflow -C lessons/lesson.config run \
  lessons/04_parameters.nf
```

The default remains:

```text
U13824
```

## Lesson Checkpoint

You have completed this lesson when:

- all three `STUDENT TASK` sections are complete;
- the default workflow succeeds;
- the default report contains `U13824`;
- the custom-parameter workflow succeeds;
- the custom report contains the new value;
- you can explain the difference between `path` and `val`;
- you can explain why parameters make workflows reusable.

## Save a Git Checkpoint

Inspect your work:

```bash
# Show the changed files.
git status

# Show the Lesson 4 workflow changes.
git diff -- lessons/04_parameters.nf
```

Stage the completed workflow:

```bash
# Select the Lesson 4 workflow for the next checkpoint.
git add lessons/04_parameters.nf
```

Save the checkpoint:

```bash
# Save the staged work with a message describing what was completed.
git commit -m "Add configurable workflow parameter"
```

Push the commit:

```bash
# Send the new commit to GitHub.
git push
```

**Git key**

- `git add`: select the workflow change for the checkpoint;
- `git commit`: save the staged change;
- `-m`: add a message describing what the checkpoint accomplishes;
- `git push`: send the commit to GitHub.

Git records the filename. The commit message explains what the staged change
accomplishes.

## Next Lesson

Continue with:

```text
lessons/05_small_pipeline.md
```

The next lesson combines file inputs, parameters, channels, and multiple
processes in one reusable pipeline.
