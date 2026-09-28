# Start HealthSeq-NF Foundations

HealthSeq-NF Foundations is a guided introduction to GitHub, Git, the terminal,
and Nextflow.

No previous programming, command-line, GitHub, or Nextflow experience is
required.

You will begin with one working process and progressively complete a reusable
multi-process Nextflow pipeline.

## What You Will Build

```text
one process
→ one declared output
→ one file input
→ two connected processes
→ one parameterized workflow
→ one reusable multi-process pipeline
→ one personal Git history
```

Lesson 1 is complete so you can run Nextflow immediately.

Lessons 2 through 5 contain `STUDENT TASK` sections that you will complete,
test, troubleshoot, and commit.

## What You Will Learn

You will learn how to:

- create and manage a personal GitHub repository;
- open a GitHub Codespace;
- use essential terminal commands;
- run a Nextflow workflow;
- identify process inputs and outputs;
- pass files and values through channels;
- connect dependent processes;
- change workflow behavior with parameters;
- publish selected outputs;
- diagnose simple workflow errors;
- create meaningful Git commits;
- push your work to GitHub;
- explain the limits of computational results.

## Step 1: Create a GitHub Account

If you already have a GitHub account, continue to Step 2.

Otherwise:

1. Open `https://github.com`.
2. Select **Sign up**.
3. Enter your email address.
4. Create a password and username.
5. Complete the verification steps.
6. Verify your email address.
7. Sign in to GitHub.

Choose a professional username suitable for research, applications, and
collaboration.

## Step 2: Create Your Personal Repository

Open the HealthSeq-NF Foundations student template provided by the instructor.

On the repository page, select:

```text
Use this template
→ Create a new repository
```

Choose your GitHub account as the owner.

Use a repository name such as:

```text
my-nextflow-foundations
```

Add an optional description:

```text
My reproducible Nextflow workflow project
```

Choose the visibility requested by the instructor.

Select **Create repository**.

Confirm that the new repository URL contains your GitHub username.

Your new repository is independent from the original template. Your workflow
changes, explanations, and commits will belong to your personal repository.

If you are reviewing or developing the original student template, skip this
step and continue to Step 3.

## Step 3: Open a GitHub Codespace

Inside your personal repository:

1. Select the green **Code** button.
2. Select the **Codespaces** tab.
3. Select **Create codespace on main**.
4. Wait for setup to finish.

Codespace creation may take several minutes.

The repository automatically prepares Java and Nextflow. You do not need to
install them on your computer.

## Step 4: Identify the Codespaces Interface

The Codespaces interface includes:

- **Explorer**, which displays project files;
- **Editor**, which displays and changes file contents;
- **Terminal**, where commands are executed;
- **Source Control**, which displays Git changes.

If the terminal is hidden, select:

```text
Terminal
→ New Terminal
```

A terminal line ending with `$` is waiting for a command.

Do not type the `$` symbol shown in terminal examples.

## How to Read Terminal Commands

Lines beginning with `#` are short explanations. Bash ignores these comment
lines, so you can copy and paste the complete command block.

For example:

```bash
# Show the directory currently used by the terminal.
pwd
```

The terminal ignores the comment and runs `pwd`.

## Step 5: Practice Essential Terminal Commands

Show your current location:

```bash
# Show the directory currently used by the terminal.
pwd
```

List repository files:

```bash
# List files and directories in the current location.
ls
```

You should see files and directories including:

```text
README.md
COURSE_START.md
COURSE_PATH.md
lessons
exercises
scripts
```

Display the lesson input:

```bash
# Display the contents of the teaching-case input file.
cat lessons/upec_context.txt
```

Enter the lessons directory:

```bash
# Move into the lessons directory.
cd lessons
```

List its contents:

```bash
# List files inside the lessons directory.
ls
```

Return to the repository root:

```bash
# Return to the directory one level above lessons/.
cd ..
```

Check the Git repository:

```bash
# Show the current branch and any changed files.
git status
```

### Terminal Command Key

- `pwd`: show the current directory;
- `ls`: list files and directories;
- `cat`: display the contents of a file;
- `cd`: move to another directory;
- `..`: refer to the directory one level above;
- `git status`: show the current branch and changed files.

The initial repository should normally report:

```text
nothing to commit, working tree clean
```

This means Git does not detect any uncommitted changes.

## Step 6: Verify the Environment

Run:

```bash
# Check that the required tools and course files are available.
./scripts/check_environment.sh
```

The script checks that Git, Java, Nextflow, and the required project files are
available.

### Script Key

- `./`: use a file from the current directory;
- `scripts/check_environment.sh`: the environment-checking script.

The final line should be:

```text
Environment validation passed.
```

If the check fails, stop and read the first reported error before continuing.

## Step 7: Run Your First Nextflow Workflow

Open:

```text
lessons/01_first_nextflow.md
```

Run:

```bash
# Run Lesson 1 with the course configuration.
nextflow -C lessons/lesson.config run \
  lessons/01_hello_nextflow.nf
```

### Nextflow Command Key

- `nextflow`: start the Nextflow program;
- `-C`: load a configuration file;
- `lessons/lesson.config`: the course configuration;
- `run`: execute a workflow;
- `lessons/01_hello_nextflow.nf`: the workflow file;
- `\`: continue the same command on the next line.

The `SAY_HELLO` process should finish successfully.

Locate its output:

```bash
# Find the generated Lesson 1 output file.
find work -name hello_nextflow.txt -type f
```

### Find Command Key

- `find`: search for files;
- `work`: the directory to search;
- `-name`: search for a specific filename;
- `hello_nextflow.txt`: the filename to find;
- `-type f`: return regular files only.

Display the output:

```bash
# Save the first matching output path in hello_file.
hello_file="$(
  find work \
    -name hello_nextflow.txt \
    -type f |
  head -n 1
)"

# Display the file stored in hello_file.
cat "$hello_file"
```

### Output Command Key

- `hello_file=`: create a shell variable named `hello_file`;
- `$(...)`: run the commands inside and store the result;
- `|`: pass one command's result to the next command;
- `head -n 1`: keep only the first result;
- `$hello_file`: retrieve the value stored in the variable;
- `cat`: display the contents of a file.

Expected result:

```text
Hello from Nextflow
```

The first workflow introduces this pattern:

```text
process
→ command
→ declared output
```

## Step 8: Continue Through the Lessons

Complete the project in this order:

1. `lessons/01_first_nextflow.md`
2. `lessons/02_process_inputs.md`
3. `lessons/03_channels_and_data_flow.md`
4. `lessons/04_parameters.md`
5. `lessons/05_small_pipeline.md`
6. `lessons/06_git_and_github.md`
7. `lessons/07_prepare_for_applied.md`

### Lesson 1

Run one complete process and inspect its output.

### Lesson 2

Complete a process input and output command.

### Lesson 3

Connect two processes through a named output channel.

### Lesson 4

Define and use a configurable workflow parameter.

### Lesson 5

Complete the final process and publish the pipeline report.

### Lesson 6

Document your progress and create meaningful Git commits.

### Lesson 7

Review the project, explain its data flow, and propose an extension.

## Step 9: Use the Exercises

Open:

```text
exercises/FOUNDATIONS_EXERCISES.md
```

Complete the exercises after the corresponding lessons.

Write explanations in your own words.

The instructor guide and answer key are intentionally not included in the
student repository.

## Step 10: Document Your Progress

Create:

```text
MY_PROGRESS.md
```

Use this structure:

```markdown
# My HealthSeq-NF Foundations Progress

## My Background

Describe your academic or professional background.

## Concepts I Can Explain

List the Nextflow concepts you understand.

## Errors I Corrected

Describe errors you encountered and how you corrected them.

## My Workflow Changes

Describe the sections you completed or modified.

## My Extension Idea

Describe one way you could extend the project.
```

## Step 11: Save Meaningful Checkpoints

Before committing, inspect your work:

```bash
# Show changed files.
git status

# Show the exact unstaged changes.
git diff
```

Stage only the files you intentionally changed:

```bash
# Replace <file> with the path of the file you want to stage.
git add <file>
```

For example:

```bash
# Select the completed Lesson 2 workflow for the next checkpoint.
git add lessons/02_process_inputs.nf
```

Review the staged changes:

```bash
# Show the changes selected for the next checkpoint.
git diff --cached
```

Commit:

```bash
# Save the staged changes as a Git checkpoint.
git commit -m "Complete process input lesson"
```

The words inside quotation marks are the **commit message**.

Git already records the filenames. The commit message explains what the staged
changes accomplish.

Push:

```bash
# Send the new commit to GitHub.
git push
```

### Git Command Key

- `git status`: show changed files;
- `git diff`: show unstaged changes;
- `git add`: select changes for the next checkpoint;
- `git diff --cached`: show staged changes;
- `git commit`: save the staged changes as a checkpoint;
- `-m`: add a message describing what the checkpoint accomplishes;
- `git push`: send commits to GitHub.

Suggested project commits include:

```text
Run first Nextflow process
Add file input and summary output
Connect processes through a channel
Add configurable workflow parameter
Complete reusable multi-process pipeline
Document Nextflow learning progress
```

## Generated Files

Nextflow creates internal task files under:

```text
work/
```

The completed pipeline publishes selected outputs under:

```text
lessons/outputs/
```

These directories are excluded from Git.

Do not commit generated task directories.

## Scientific Context

The examples use a short text file connected to a published case involving
uropathogenic *Escherichia coli* strain U13824.

The Foundations project uses text files so you can concentrate on workflow
concepts before introducing sequencing formats and bioinformatics software.

The project teaches reproducible workflow design. It does not independently
confirm antimicrobial resistance, antimicrobial susceptibility, treatment
suitability, dosing, or clinical conclusions.

## Further Application

The same Nextflow concepts can support larger scientific workflows.

A complete sequencing quality-control and reference-alignment project is
available at:

```text
https://github.com/ofecheverm/healthseq-nf-applied
```

HealthSeq-NF Foundations remains independently useful and can be extended to
other scientific workflows.

## Completion Checklist

Your project is complete when:

- [ ] Lesson 1 runs successfully;
- [ ] Lessons 2 through 5 are completed;
- [ ] the final pipeline publishes its report;
- [ ] the exercises are completed;
- [ ] `MY_PROGRESS.md` documents your learning;
- [ ] your repository contains meaningful commits;
- [ ] your work is pushed to GitHub;
- [ ] you can explain the workflow data flow;
- [ ] you can describe one realistic extension;
- [ ] you can distinguish computational output from unsupported conclusions.

## Next Step

Open:

```text
lessons/01_first_nextflow.md
```

Then run the first workflow.
