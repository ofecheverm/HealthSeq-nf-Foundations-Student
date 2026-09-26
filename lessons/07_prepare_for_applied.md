# Lesson 7: Review and Extend the Project

## Learning Objective

By the end of this lesson, you should be able to:

- explain the main Nextflow concepts used in the project;
- verify that the reusable pipeline works;
- describe your personal contributions;
- identify an appropriate project extension;
- state the scientific limits of the workflow.

## Review the Foundations Pipeline

Open:

```text
lessons/05_small_pipeline.nf
```

Identify:

- the input file;
- the parameter;
- the three processes;
- the named output channels;
- the process dependencies;
- `publishDir`;
- the final report.

Run the pipeline:

```bash
nextflow -C lessons/lesson.config run \
  lessons/05_small_pipeline.nf
```

Display the published report:

```bash
cat lessons/outputs/lesson5_final_report.txt
```

## Explain the Data Flow

Complete this description in your own words:

```text
The workflow begins with ______________________________.

The first process receives ____________________________.

The first process produces ____________________________.

The second process adds _______________________________.

The final process publishes ___________________________.

The execution order is determined by _________________.
```

## Foundations Checklist

Confirm that you can:

- [ ] open and navigate a GitHub Codespace;
- [ ] use `pwd`, `ls`, `cd`, `cat`, and `find`;
- [ ] run a Nextflow workflow;
- [ ] identify a process input and output;
- [ ] distinguish `path` from `val`;
- [ ] explain what a channel carries;
- [ ] explain why a downstream process waits;
- [ ] override a parameter;
- [ ] explain `publishDir`;
- [ ] create and push a meaningful Git commit.

## Scientific Boundary

The project demonstrates reproducible workflow design.

The foundations examples do not independently:

- identify antimicrobial-resistance genes;
- confirm ESBL production;
- predict antimicrobial susceptibility;
- recommend treatment;
- provide clinical decision support.

The U13824 case provides scientific context. The foundations workflows operate
on small text files rather than sequencing data.

## Choose an Extension

Select one possible extension:

- change the report content;
- add another parameter;
- add a fourth process;
- publish another output;
- use a different text input;
- add a new automated check;
- adapt the workflow to another scientific topic.

Describe the extension:

```text
My extension:
```

Explain why it would be useful:

```text
Purpose:
```

Identify the expected input and output:

```text
Input:

Output:
```

## Document Your Progress

Update `MY_PROGRESS.md` with:

```markdown
## Project Reflection

### A Nextflow Concept I Can Explain

Write two or three sentences.

### A Problem I Corrected

Describe one error and how you resolved it.

### My Extension Idea

Describe one realistic next step for the project.
```

## Save the Final Checkpoint

Review your changes:

```bash
git status
git diff
```

Stage only the files you intentionally changed:

```bash
git add MY_PROGRESS.md
```

Review the staged change:

```bash
git diff --cached
```

Commit:

```bash
git commit -m "Complete Nextflow foundations project"
```

Push:

```bash
git push
```

## Further Application

The patterns learned here can support larger workflows involving scientific
data, containers, multiple tools, and automated reporting.

One applied example is available at:

```text
https://github.com/ofecheverm/healthseq-nf-applied
```

HealthSeq-NF Foundations remains independently useful and can be extended for
other computational projects.

## Completion Checkpoint

You have completed the project when:

- the five executable workflows run successfully;
- the reusable pipeline publishes its report;
- your repository contains meaningful commits;
- `MY_PROGRESS.md` documents your learning;
- you can explain the workflow data flow;
- you can describe one appropriate extension;
- you can distinguish computational results from unsupported conclusions.
