# HealthSeq-NF Foundations Exercises

## Instructions

Also complete `exercises/PAPER_CONNECTION.md` to connect the workflow exercises
to the published U13824 case.

Complete these exercises after the corresponding lessons.

Write answers in your personal repository using your own words.

Do not copy the instructor explanations without understanding them.

Generated files under `work/` and lesson output directories should not be
committed.

## Exercise 1: GitHub, Codespaces, and the Terminal

### Task 1.1

Run:

```bash
# Show the directory currently used by the terminal.
pwd
```

Write the final directory name:

```text
Answer:
```

### Task 1.2

Run:

```bash
# List files and directories in the current location.
ls
```

Name three files or directories visible in the repository:

```text
1.
2.
3.
```

### Task 1.3

Run:

```bash
# Show the current branch and changed files.
git status
```

Record:

```text
Current branch:

Is the working tree clean?
```

### Task 1.4

In one sentence, explain the purpose of GitHub Codespaces:

```text
Answer:
```

## Exercise 2: Your First Process

Open:

```text
lessons/01_hello_nextflow.nf
```

Run:

```bash
# Run the complete Lesson 1 workflow.
nextflow -C lessons/lesson.config run lessons/01_hello_nextflow.nf
```

### Questions

1. What is the process name?

```text
Answer:
```

2. What command does the process execute?

```text
Answer:
```

3. What file does the process create?

```text
Answer:
```

4. Where does Nextflow execute the process?

```text
Answer:
```

5. Why should the `work/` directory remain outside Git?

```text
Answer:
```

## Exercise 3: Process Inputs and Outputs

Open:

```text
lessons/02_process_inputs.nf
```

Run:

```bash
# Run Lesson 2 after completing its STUDENT TASK sections.
nextflow -C lessons/lesson.config run lessons/02_process_inputs.nf
```

### Questions

1. What file enters the process?

```text
Answer:
```

2. Which input declaration represents the file?

```text
Answer:
```

3. What output file is created?

```text
Answer:
```

4. What does Nextflow do with the input file before running the process?

```text
Answer:
```

### Controlled Error

Temporarily replace:

```text
upec_context.txt
```

with:

```text
missing_context.txt
```

Run the workflow again.

Record the first clear error message in your own words:

```text
Answer:
```

Restore the correct filename and confirm that the workflow succeeds.

## Exercise 4: Channels and Dependencies

Open:

```text
lessons/03_channels_and_data_flow.nf
```

Run:

```bash
# Run Lesson 3 after completing the process connection.
nextflow -C lessons/lesson.config run \
  lessons/03_channels_and_data_flow.nf
```

### Complete the Data Flow

```text
upec_context.txt
→ ______________________
→ upec_case_report.txt
→ ______________________
→ upec_final_report.txt
```

### Questions

1. Which process runs first?

```text
Answer:
```

2. What does `emit: report` do?

```text
Answer:
```

3. How does the second process receive the first process output?

```text
Answer:
```

4. Why must the second process wait?

```text
Answer:
```

5. Define data-driven execution in one or two sentences:

```text
Answer:
```

## Exercise 5: Parameters

Open:

```text
lessons/04_parameters.nf
```

Run the default workflow:

```bash
# Run Lesson 4 with the default parameter value.
nextflow -C lessons/lesson.config run lessons/04_parameters.nf
```

Run it again with:

```bash
# Run Lesson 4 with a custom case_name value.
nextflow -C lessons/lesson.config run \
  lessons/04_parameters.nf \
  --case_name "My reproducible case"
```

### Questions

1. What is the default parameter value?

```text
Answer:
```

2. What command-line option changes the value?

```text
Answer:
```

3. What is the difference between `path` and `val`?

```text
Answer:
```

4. Did the process code need to change?

```text
Answer:
```

5. Why do parameters make workflows reusable?

```text
Answer:
```

## Exercise 6: Small Reusable Pipeline

Open:

```text
lessons/05_small_pipeline.nf
```

Run:

```bash
# Run Lesson 5 after completing its STUDENT TASK sections.
nextflow -C lessons/lesson.config run lessons/05_small_pipeline.nf
```

### Complete the Pipeline Map

```text
upec_context.txt
+ ______________________
→ CREATE_CASE_SUMMARY
→ ______________________
→ ADD_EVIDENCE_BOUNDARY
→ ______________________
→ FINALIZE_LESSON_REPORT
→ lesson5_final_report.txt
```

### Questions

1. What two inputs does the first process receive?

```text
Answer:
```

2. What evidence boundary does the second process add?

```text
Answer:
```

3. What does `publishDir` do?

```text
Answer:
```

4. Where is the default final report published?

```text
Answer:
```

5. Why does the final process run last?

```text
Answer:
```

### Custom Run

Run:

```bash
# Run Lesson 5 with a custom case name and output directory.
nextflow -C lessons/lesson.config run \
  lessons/05_small_pipeline.nf \
  --case_name "My course pipeline" \
  --lesson_outdir lessons/experiment_outputs
```

Record the custom case name and output path:

```text
Case name:

Output path:
```

## Exercise 7: Evidence Boundaries

Classify each statement as **supported** or **unsupported** by the beginner
pipeline.

### Statement 1

The workflow executed all three processes successfully.

```text
Answer:
```

### Statement 2

The workflow independently confirmed that U13824 produces an ESBL.

```text
Answer:
```

### Statement 3

The report was generated reproducibly with Nextflow.

```text
Answer:
```

### Statement 4

The workflow identified the most appropriate antimicrobial treatment.

```text
Answer:
```

### Statement 5

The source publication provides the UTI and antimicrobial-resistance context.

```text
Answer:
```

Explain why technical workflow execution and clinical interpretation are
different:

```text
Answer:
```

## Exercise 8: Git and GitHub

Create and complete:

```text
MY_PROGRESS.md
```

Then run:

```bash
# Show the progress-file changes.
git status
git diff -- MY_PROGRESS.md

# Select MY_PROGRESS.md for the next checkpoint.
git add MY_PROGRESS.md

# Review the changes selected for the checkpoint.
git diff --cached

# Save the staged work with a descriptive commit message.
git commit -m "Document beginner Nextflow progress"

# Send the commit to GitHub.
git push
```

**Git key**

- `git status`: show changed files;
- `git diff`: show unstaged changes;
- `git add`: select changes for the next commit;
- `git diff --cached`: review staged changes;
- `git commit`: save the staged changes;
- `-m`: add a message describing what the commit accomplishes;
- `git push`: send local commits to GitHub.

Git records that `MY_PROGRESS.md` is included. The commit message describes
what the staged work accomplishes.

### Questions

1. What does `git status` show?

```text
Answer:
```

2. What does `git add` do?

```text
Answer:
```

3. What does `git commit` do?

```text
Answer:
```

4. What does `git push` do?

```text
Answer:
```

5. Why is a meaningful commit history useful?

```text
Answer:
```

## Exercise 9: Project Reflection

Complete these statements:

```text
A Nextflow process is:
```

```text
A channel is:
```

```text
A parameter is:
```

```text
A reproducible workflow is valuable because:
```

```text
One skill I can now demonstrate is:
```

```text
One question I have for the applied workshop is:
```

## Final Readiness Check

Confirm each item:

- [ ] I can open a GitHub Codespace.
- [ ] I can use basic terminal commands.
- [ ] I can run a Nextflow workflow.
- [ ] I can identify process inputs and outputs.
- [ ] I can explain how a channel connects processes.
- [ ] I can change a parameter.
- [ ] I can run a three-process workflow.
- [ ] I can explain `publishDir`.
- [ ] I can create and push a Git commit.
- [ ] I can distinguish technical results from clinical conclusions.

If any item remains unclear, discuss it with the instructor before beginning
the applied workshop.
