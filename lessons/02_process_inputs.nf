nextflow.enable.dsl = 2

process SUMMARIZE_CONTEXT {
    tag "UPEC teaching case"

    input:
    // STUDENT TASK 1:
    // Declare context_file as a path input.

    output:
    path "upec_context_summary.txt"

    script:
    """
    # STUDENT TASK 2:
    # Create upec_context_summary.txt.
    # Copy the contents of context_file into the output file.
    """
}

workflow {
    context_ch = Channel.fromPath(
        "${projectDir}/upec_context.txt",
        checkIfExists: true
    )

    SUMMARIZE_CONTEXT(context_ch)
}
