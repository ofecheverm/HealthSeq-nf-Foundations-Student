# Start HealthSeq-NF Foundations

HealthSeq-NF Foundations is a runnable introduction to GitHub, Git, the
terminal, and Nextflow.

No previous programming or command-line experience is required.

You will begin with one process and progressively build a reusable
three-process Nextflow pipeline.

## What You Will Learn

You will learn how to:

- create a personal GitHub repository;
- open a GitHub Codespace;
- use essential terminal commands;
- run a Nextflow workflow;
- identify process inputs and outputs;
- connect processes through channels;
- change workflow behavior with parameters;
- publish selected outputs;
- save and share work with Git and GitHub.

## Step 1: Create a GitHub Account

If you already have a GitHub account, continue to Step 2.

Otherwise:

1. Open `https://github.com`.
2. Select **Sign up**.
3. Create and verify the account.
4. Sign in to GitHub.

Choose a professional username suitable for research and collaboration.

## Step 2: Create Your Repository

Open the HealthSeq-NF Foundations template provided by the instructor.

Select:

```text
Use this template
→ Create a new repository
```

Choose your GitHub account as the owner.

Use a name such as:

```text
my-nextflow-foundations
```

Select **Create repository**.

The new repository belongs to you. Your commits, explanations, and extensions
will be recorded in your repository.

## Step 3: Open a Codespace

Inside your new repository:

1. Select **Code**.
2. Select **Codespaces**.
3. Select **Create codespace on main**.
4. Wait for setup to finish.

The Codespace automatically prepares Java and Nextflow.

## Step 4: Find the Terminal

The Codespaces interface includes:

- **Explorer** for project files;
- **Editor** for file contents;
- **Terminal** for commands;
- **Source Control** for Git changes.

If the terminal is hidden, select:

```text
Terminal
→ New Terminal
```

Do not type the `$` prompt shown in terminal examples.

## Step 5: Try Essential Commands

Show the current directory:

```bash
pwd
```

List repository files:

```bash
ls
```

Display the lesson input:

```bash
cat lessons/upec_context.txt
```

Enter the lessons directory:

```bash
cd lessons
```

Return to the repository root:

```bash
cd ..
```

Check the Git repository:

```bash
git status
```

The initial repository should normally report:

```text
nothing to commit, working tree clean
```

## Step 6: Verify the Environment

Run:

```bash
./scripts/check_environment.sh
```

The final line should be:

```text
Environment validation passed.
```

If validation fails, stop and read the first error before continuing.

## Step 7: Run Your First Nextflow Workflow

Open:

```text
lessons/01_first_nextflow.md
```

Run:

```bash
nextflow -C lessons/lesson.config run \
  lessons/01_hello_nextflow.nf
```

The `SAY_HELLO` process should finish successfully.

Locate its output:

```bash
find work -name hello_nextflow.txt -type f
```

The workflow introduces this pattern:

```text
process
→ command
→ declared output
```

## Project Progression

Continue in this order:

1. `lessons/01_first_nextflow.md`
2. `lessons/02_process_inputs.md`
3. `lessons/03_channels_and_data_flow.md`
4. `lessons/04_parameters.md`
5. `lessons/05_small_pipeline.md`
6. `lessons/06_git_and_github.md`
7. `lessons/07_prepare_for_applied.md`

The examples progress from one process to a reusable three-process pipeline.

## Generated Files

Nextflow creates internal task files under:

```text
work/
```

The final example publishes selected outputs under:

```text
lessons/outputs/
```

These generated directories should not be committed to GitHub.

## Further Application

The same Nextflow concepts can support larger scientific workflows.

A complete sequencing QC and reference-alignment example is available at:

```text
https://github.com/ofecheverm/healthseq-nf-applied
```

HealthSeq-NF Foundations remains a complete and extensible project on its own.
