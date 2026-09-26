nextflow.enable.dsl = 2

/*
 * Lesson 2 introduces a process input.
 *
 * The process receives a text file, stages the file in a task directory,
 * and creates a new output containing a short summary.
 */

process SUMMARIZE_CONTEXT {
    tag "UPEC teaching case"

    input:
    path context_file

    output:
    path "upec_context_summary.txt"

    script:
    """
    echo "HealthSeq-NF teaching-case summary" > upec_context_summary.txt
    echo "==================================" >> upec_context_summary.txt
    cat ${context_file} >> upec_context_summary.txt
    echo "Input filename: ${context_file}" >> upec_context_summary.txt
    """
}

workflow {
    context_ch = Channel.fromPath(
        "${projectDir}/upec_context.txt",
        checkIfExists: true
    )

    SUMMARIZE_CONTEXT(context_ch)
}
