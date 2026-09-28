# Lesson 4: Parameters and Reusable Workflows

## Learning Objective

By the end of this lesson, you should be able to:

- explain what a Nextflow parameter is;
- identify a parameter default;
- pass a parameter from the command line;
- explain why parameters make workflows reusable;
- distinguish changing a parameter from editing workflow code.

## Why Parameters Matter

A workflow should not require users to rewrite its source code every time an
input, label, output directory, or configuration changes.

Parameters allow users to control selected workflow values from the command
line.

The same workflow can therefore be reused in different situations.

## Open the Workflow

Open:

```text
lessons/04_parameters.nf
```

Locate:

```groovy
params.case_name = 'U13824'
```

This line defines a parameter named:

```text
case_name
```

Its default value is:

```text
U13824
```

**Parameter key**

- `params`: Nextflow's collection of workflow parameters;
- `case_name`: the parameter name;
- `'U13824'`: the default value.

## The Process Input

The process receives:

```groovy
val case_name
```

The `val` input declaration means the process receives a value rather than a
file.

Earlier lessons used:

```groovy
path context_file
```

for a file input.

Lesson 4 uses:

```groovy
val case_name
```

for a text value.

**Input key**

- `path`: receive a file;
- `val`: receive a value;
- `case_name`: the name used for the value inside the process.

## The Value Channel

The workflow creates a value channel:

```groovy
case_name_ch = Channel.value(params.case_name)
```

The channel carries the current value of the `case_name` parameter.

The channel is passed into the process:

```groovy
CREATE_PARAMETER_REPORT(case_name_ch)
```

**Channel key**

- `Channel.value(...)`: create a channel containing one value;
- `params.case_name`: retrieve the current parameter value;
- `case_name_ch`: the variable storing the value channel;
- `CREATE_PARAMETER_REPORT(...)`: send the channel to the process.

The data flow is:

```text
case_name parameter
→ value channel
→ CREATE_PARAMETER_REPORT
→ parameter_report.txt
```

## Run with the Default Value

From the repository root, run:

```bash
# Run Lesson 4 with the default parameter value.
nextflow -C lessons/lesson.config run lessons/04_parameters.nf
```

The process should complete successfully:

```text
CREATE_PARAMETER_REPORT (U13824)
```

Locate the newest output:

```bash
# Find the newest parameter report and save its path.
parameter_report="$(
  find work \
    -name parameter_report.txt \
    -type f \
    -printf '%T@ %p\n' |
  sort -rn |
  head -n 1 |
  cut -d' ' -f2-
)"
```

Display the report:

```bash
# Display the report stored in parameter_report.
cat "$parameter_report"
```

**Output command key**

- `parameter_report=`: create a shell variable;
- `$(...)`: run the enclosed commands and store the result;
- `find`: search for files;
- `-printf '%T@ %p\n'`: print the modification time and path;
- `|`: pass one command's result to the next;
- `sort -rn`: place the newest result first;
- `head -n 1`: keep the first result;
- `cut -d' ' -f2-`: remove the timestamp and keep the path;
- `cat`: display the selected file.

Expected content includes:

```text
Teaching case: U13824
```

## Run with a Different Value

Run the same workflow with a command-line parameter:

```bash
# Run Lesson 4 with a custom case_name value.
nextflow -C lessons/lesson.config run \
  lessons/04_parameters.nf \
  --case_name "Published UPEC case"
```

Locate the newest output again:

```bash
# Find the newest parameter report and save its path.
parameter_report="$(
  find work \
    -name parameter_report.txt \
    -type f \
    -printf '%T@ %p\n' |
  sort -rn |
  head -n 1 |
  cut -d' ' -f2-
)"
```

Display it:

```bash
# Display the custom parameter report.
cat "$parameter_report"
```

The report should now include:

```text
Teaching case: Published UPEC case
```

The workflow source code did not change.

Only the parameter value changed.

## Command Structure

The command is:

```bash
# Run the workflow with a custom parameter value.
nextflow -C lessons/lesson.config run \
  lessons/04_parameters.nf \
  --case_name "Published UPEC case"
```

The parts are:

- `nextflow`: start Nextflow;
- `-C lessons/lesson.config`: use the lesson configuration;
- `run`: execute a workflow;
- `lessons/04_parameters.nf`: identify the workflow file;
- `--case_name`: select the parameter;
- `"Published UPEC case"`: provide the parameter value;
- `\`: continue the command on the next line.

Nextflow parameters use two hyphens:

```text
--case_name
```

## Connection to HealthSeq-NF

The complete HealthSeq-NF Applied workflow uses parameters such as:

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

**Applied command key**

- `main.nf`: the Applied workflow file;
- `-profile test`: use the validated teaching profile;
- `--outdir`: select the output-directory parameter;
- `student_results`: provide the custom directory name.

This command changes the output location without editing the Applied workflow
file.

This command belongs to the separate HealthSeq-NF Applied repository.

Parameters make workflows easier to:

- reuse;
- test;
- share;
- document;
- automate;
- adapt safely.

## Parameter Versus Source-Code Change

Use a parameter when the workflow already exposes a value that users are
expected to change.

Examples include:

- an input sample sheet;
- a reference FASTA;
- an output directory;
- a case label.

Edit workflow source code only when changing the workflow's analytical logic
or structure.

For beginners, changing a documented parameter is usually safer than changing
a process command.

## Check Your Understanding

Answer these questions:

1. What is the parameter name?
2. What is its default value?
3. What type of process input receives the value?
4. What channel carries the parameter?
5. How do you override the default from the command line?
6. Did changing the parameter require editing the workflow file?
7. Which HealthSeq-NF parameter controls the output directory?
8. Why do parameters improve reproducibility?

## Controlled Parameter Experiment

Run:

```bash
# Run Lesson 4 with another custom case_name value.
nextflow -C lessons/lesson.config run \
  lessons/04_parameters.nf \
  --case_name "My reproducible workflow"
```

Locate and display the newest report.

Confirm that the report includes the new value.

Then run the default workflow again:

```bash
# Run Lesson 4 without overriding the default value.
nextflow -C lessons/lesson.config run lessons/04_parameters.nf
```

Confirm that the default value remains:

```text
U13824
```

## Lesson Checkpoint

You have completed this lesson when:

- the default workflow run succeeds;
- the report contains `U13824`;
- the custom-parameter run succeeds;
- the report contains the custom value;
- the workflow file remains unchanged;
- you can explain the difference between `path` and `val`;
- you can explain why parameters make workflows reusable.

## Suggested Personal Commit

After completing the experiment, participants may record the checkpoint with:

```bash
# Show the changed files.
git status

# Select the intentional lesson changes for the checkpoint.
git add lessons/

# Save the staged changes with a message describing the completed work.
git commit -m "Complete parameter lesson"

# Send the commit to GitHub.
git push
```

**Git key**

- `git status`: show changed files;
- `git add`: select changes for the next checkpoint;
- `git commit`: save the staged changes;
- `-m`: add a message explaining what the checkpoint accomplishes;
- `git push`: send the commit to GitHub.

Only commit intentional source or documentation changes. Do not commit files
under `work/`.

## Next Lesson

Continue with:

```text
lessons/05_small_pipeline.md
```

The next lesson combines file inputs, parameters, channels, and multiple
processes into one small reusable pipeline.
