# Lesson 2: Proces* Inputs and Outputs

## Learning O*jective

By the end of this lesson* you should be able to:

- explain*why a process needs an input decla*ation;
- identify a file channel;
* explain how Nextflow stages an in*ut file;
- identify the relationsh*p between an input and an output;
* locate the task directory and gen*rated file.

## The Input File

Op*n:

    lessons/upec_context.txt

*his small text file contains infor*ation about the published UPEC tea*hing
case.

The file represents da*a that must enter a process.

In t*e complete HealthSeq-NF workflow, *he inputs are larger scientific fi*es,
including paired FASTQ reads a*d a reference FASTA. The same unde*lying
Nextflow concept applies.

#* The Process

Open:

    lessons/0*_process_inputs.nf

The process is*named:

    SUMMARIZE_CONTEXT

The*process receives:

    path contex*_file

The `path` input declaratio* tells Nextflow that the process r*quires a file.

Nextflow stages th* input file inside the process tas* directory before
executing the sc*ipt.

## The Input Channel

The wo*kflow creates a channel with:

   *Channel.fromPath(...)

A channel t*ansports data between the workflow*and a process.

In this lesson, th* channel carries one text filepath*

In HealthSeq-NF, channels carry:*
- paired FASTQ files;
- sample me*adata;
- a reference genome;
- ali*nment files;
- quality-control rep*rts.

## Run Lesson 2

From the re*ository root, run:

    nextflow -C lessons/lesson.config run lessons/02_process_inputs.nf

The lesson-s*ecific configuration disables the *omplete pipeline's trace,
timeline* report, and workflow-diagram outp*ts. This keeps the lesson run
smal* and avoids overwriting reports fr*m the main workflow.

You should s*e:

    SUMMARIZE_CONTEXT (UPEC te*ching case) | 1 of 1 ✔

## Locate *he Output

Run:

    find work -na*e upec_context_summary.txt -type f*
Display the newest matching outpu*:

    summary_file="$(find work -*ame upec_context_summary.txt -type*f -printf '%T@ %p\n' | sort -rn | *ead -n 1 | cut -d' ' -f2-)"

    c*t "$summary_file"

The output shou*d contain:

- a heading;
- the con*ents of `upec_context.txt`;
- the *ame of the staged input file.

## *hat Nextflow Did

Nextflow:

1. re*d the input filepath;
2. created a*task directory under `work/`;
3. s*aged the input file in that direct*ry;
4. executed the process script*
5. identified the declared output*
6. recorded the successful task.
*## Input and Output Pattern

The l*sson follows this pattern:

    up*c_context.txt
    → SUMMARIZE_CONT*XT
    → upec_context_summary.txt
*The complete HealthSeq-NF pipeline*uses the same pattern repeatedly:
*    paired FASTQ
    → FASTP
    →*trimmed paired FASTQ

    trimmed *aired FASTQ
    → BWA_MEM2_MEM
   *→ SAM alignment

    SAM alignment*    → SAMTOOLS_SORT_INDEX
    → so*ted BAM and BAM index

## Check Yo*r Understanding

Answer these ques*ions:

1. What file enters the pro*ess?
2. What channel carries the f*le?
3. What does `path context_fil*` mean?
4. Where does Nextflow exe*ute the process?
5. What output fi*e is declared?
6. How is this patt*rn similar to the FASTQ-processing*workflow?

## Controlled Input Err*r

This activity demonstrates a si*ple and informative failure.

Temp*rarily change:

    upec_context.t*t

to:

    missing_context.txt

R*n the lesson again:

    nextflow -C lessons/lesson.config run lessons/02_process_inputs.nf

Nextflow sh*uld report that the input file doe* not exist.

Read the error carefu*ly, then restore:

    upec_contex*.txt

Run the lesson again and con*irm that it succeeds.

This demons*rates an important troubleshooting*principle:

> Start with the first*clear error message and verify the*required inputs.

## Lesson Checkp*int

You have completed this lesso* when:

- the process succeeds wit* the correct input;
- you locate `*pec_context_summary.txt`;
- you ob*erve one controlled missing-input *rror;
- you correct the path;
- th* process succeeds again;
- you can*explain input, channel, process, s*ript, and output.

## Suggested Co*mit

After restoring the correct f*le, save the checkpoint with:

   *git add lessons/
    git commit -m*"Complete process input lesson"

#* Next Lesson

Continue with:

    lessons/03_channels_and_data_flow.md

The next lesson connects two pro*esses so that the output of the fi*st becomes
the input of the second*
