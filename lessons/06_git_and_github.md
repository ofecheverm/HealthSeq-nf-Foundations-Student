# Lesson 6: Save Your Work with Git and GitHub

## Learning Objective

By the end of this lesson, you should be able to:

- explain the difference between Git and GitHub;
- inspect the current repository state;
- create a small personal progress file;
- stage an intentional change;
- create a meaningful commit;
- push the commit to GitHub;
- confirm that the commit appears online.

## Git and GitHub

Git and GitHub are related, but they are not the same.

### Git

Git records changes to files in a repository.

Git allows you to:

- inspect changed files;
- select changes to save;
- create named checkpoints;
- review project history;
- restore earlier versions.

### GitHub

GitHub stores a remote copy of the repository online.

GitHub allows you to:

- share work;
- collaborate;
- review commits;
- open pull requests;
- run GitHub Actions;
- present a research project.

A Git commit is created locally first. The commit becomes visible on GitHub
after it is pushed.

## The Basic Workflow

The usual sequence is:

```text
edit a file
→ inspect the change
→ stage the file
→ commit the change
→ push the commit
```

The corresponding commands are:

```bash
# Inspect the repository and its changes.
git status
git diff

# Select a file for the next checkpoint.
git add <file>

# Save the staged changes with a descriptive message.
git commit -m "Describe what the staged changes accomplish"

# Send the commit to GitHub.
git push
```

**Git key**

- `git status`: show the current branch and changed files;
- `git diff`: show changes that are not staged;
- `git add`: select changes for the next commit;
- `git commit`: save the staged changes as a checkpoint;
- `-m`: add a message describing what the checkpoint accomplishes;
- `git push`: send local commits to GitHub.

Git records which files are included. The commit message explains what the
staged changes accomplish.

## Step 1: Check the Current Branch

Run:

```bash
# Show the name of the current Git branch.
git branch --show-current
```

**Command key**

- `git branch`: work with Git branches;
- `--show-current`: display only the current branch name.

The branch identifies the current line of development.

Your instructor may provide a specific branch or ask you to work in the
default branch of your personal repository.

## Step 2: Check the Repository State

Run:

```bash
# Show the current branch and repository changes.
git status
```

A clean repository usually reports:

```text
nothing to commit, working tree clean
```

This means Git does not detect any unsaved source or documentation changes.

Generated outputs under `work/` and the Applied workflow output directories are
excluded from Git and should not normally appear.

## Step 3: Create a Personal Progress File

Create a file named:

```text
MY_PROGRESS.md
```

In the Explorer:

1. select the **New File** button;
2. enter `MY_PROGRESS.md`;
3. paste the template below;
4. replace the instructions with your own short answers.

```markdown
# My HealthSeq-NF Progress

## Background

Describe your academic or professional background in one or two sentences.

## What I Learned

- I ran a Nextflow process.
- I passed a file into a process.
- I connected two processes through a channel.
- I changed workflow behavior through a parameter.
- I ran a small three-process pipeline.

## One Concept I Can Explain

Describe one Nextflow concept in your own words.

## One Question I Still Have

Write one question you would like to discuss with the instructor.

## Applied Workshop Goal

Describe what you would like to understand when working with the complete
HealthSeq-NF sequencing pipeline.
```

Save the file.

Use your own words. The purpose is to document your learning, not to copy the
instructor's explanation.

## Step 4: Inspect the Change

Run:

```bash
# Show a short summary of changed and untracked files.
git status --short
```

**Command key**

- `--short`: display a compact status;
- `??`: identify an untracked file;
- `A`: identify a file staged as newly added.

You should see:

```text
?? MY_PROGRESS.md
```

The two question marks mean the file is untracked. Git can see the file, but it
has not yet been selected for a commit.

Display the file:

```bash
# Display the progress file in the terminal.
cat MY_PROGRESS.md
```

Review the content before saving it in Git history.

## Step 5: Stage the File

Run:

```bash
# Select MY_PROGRESS.md for the next commit.
git add MY_PROGRESS.md
```

Check the status:

```bash
# Confirm that the file is staged.
git status --short
```

You should now see:

```text
A  MY_PROGRESS.md
```

`A` means the file has been added to the staging area.

The staging area contains the changes selected for the next commit.

## Step 6: Review the Staged Change

Run:

```bash
# Display the changes selected for the next commit.
git diff --cached
```

**Command key**

- `git diff`: display differences;
- `--cached`: show changes currently in the staging area.

Read the displayed content.

Before committing, confirm that:

- the correct file is staged;
- the text is complete;
- no generated output is staged;
- no password, token, or private information is included.

## Step 7: Create a Commit

Run:

```bash
# Save the staged progress file as a Git checkpoint.
git commit -m "Document beginner Nextflow progress"
```

**Command key**

- `git commit`: save the staged changes;
- `-m`: provide the commit message;
- `"Document beginner Nextflow progress"`: describe what the checkpoint
  accomplishes.

Git already records that `MY_PROGRESS.md` is included. The message describes
the purpose of the staged change rather than repeating the filename.

Good commit messages include:

```text
Document beginner Nextflow progress
Add interpretation of alignment results
Update project limitations
Add custom output parameter example
```

Avoid vague messages such as:

```text
changes
update
stuff
final
```

## Step 8: Inspect the Commit

Run:

```bash
# Display the three most recent commits in a compact format.
git log -3 --oneline
```

**Command key**

- `git log`: display commit history;
- `-3`: show the three most recent commits;
- `--oneline`: show each commit on one line.

Your new commit should appear at the top.

Each line includes:

- a short commit identifier;
- the commit message.

## Step 9: Push to GitHub

Run:

```bash
# Send local commits to the connected GitHub branch.
git push
```

If Git reports that the branch has no upstream, use:

```bash
# Connect the current local branch to origin and push it.
git push -u origin "$(git branch --show-current)"
```

**Command key**

- `-u`: remember the connection between the local and remote branches;
- `origin`: the usual name of the remote GitHub repository;
- `$(...)`: run a command and use its result;
- `git branch --show-current`: provide the current branch name.

Pushing sends the local commit to the remote repository on GitHub.

## Step 10: Confirm the Commit Online

Return to the repository in the web browser.

Refresh the page and confirm that:

- `MY_PROGRESS.md` appears;
- the latest commit message is visible;
- the commit is associated with your GitHub account.

This creates evidence of your individual work.

## What Should Be Committed?

Commit:

- workflow source files;
- configuration files;
- lesson answers;
- documentation;
- result summaries;
- scientifically meaningful changes.

Do not commit:

- `work/`;
- the Applied workflow output directories;
- `.nextflow/`;
- Nextflow log files;
- passwords;
- API tokens;
- private credentials;
- large unapproved datasets.

The repository's `.gitignore` helps prevent generated files from being added
accidentally.

## Meaningful Commit History

A good course repository might include commits such as:

```text
Create personal course repository
Complete first Nextflow process
Complete channels and data-flow lesson
Complete parameter and small-pipeline lessons
Document sequencing results and limitations
```

A meaningful commit history shows how the project developed.

This is more informative than one large final commit containing every change.

## Common Git Messages

### Nothing to Commit

```text
nothing to commit, working tree clean
```

There are no new tracked changes to save.

### Untracked File

```text
?? MY_PROGRESS.md
```

The file exists but has not been staged.

### Added File

```text
A  MY_PROGRESS.md
```

The file is staged for the next commit.

### Branch Is Ahead

```text
Your branch is ahead of 'origin/main' by 1 commit.
```

The commit exists locally but has not been pushed.

### Everything Up to Date

```text
Everything up-to-date
```

The remote repository already contains the local commits.

## Safe Troubleshooting

Before using any destructive Git command, ask the instructor.

Do not use commands such as these unless the instructor explains their effect:

```text
git reset --hard
git clean -fd
git push --force
```

Start troubleshooting with:

```bash
# Show the branch and repository state before taking another action.
git status
```

The status output usually identifies the current branch and changed files.

## Check Your Understanding

1. What is the difference between Git and GitHub?
2. What does `git status` show?
3. What does `git add` do?
4. What does `git commit` do?
5. What does `git push` do?
6. What does `??` mean in short status output?
7. What does `A` mean?
8. Why should generated workflow outputs remain outside Git?
9. What makes a commit message meaningful?
10. Why is an individual commit history valuable?

## Lesson Checkpoint

You have completed this lesson when:

- `MY_PROGRESS.md` contains your own reflections;
- the file is committed;
- the commit has a meaningful message;
- the commit is pushed;
- the file appears in your GitHub repository;
- you can explain the difference between Git and GitHub.

## Next Lesson

Continue with:

```text
lessons/07_prepare_for_applied.md
```

The next lesson reviews the Nextflow foundations and prepares you for larger
scientific projects using the same Nextflow principles.
