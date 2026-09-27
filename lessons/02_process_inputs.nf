nextflow.enable.dsl = 2  // Use the current Nextflow DSL2 syntax.

process SUMMARIZE_CONTEXT {  // Define a process named SUMMARIZE_CONTEXT.

    tag "UPEC teaching case"  // Add a readable label to the task log.

    input:
    // STUDENT TASK 1:
    // Declare context_file as a path input.
    // Key: path means that the process receives a file.

    output:
    path "upec_context_summary.txt"  // Declare the file the process must create.

    script:
    """
    # STUDENT TASK 2:
    # Create upec_context_summary.txt.
    # Copy the contents of context_file into the output file.
    # Key: commands inside this block run in the process task directory.
    """
}

workflow {  // Define the workflow and connect its data.

    context_ch = Channel.fromPath(  // Create a channel containing the input file.
        "${projectDir}/upec_context.txt",  // projectDir is the lessons/ directory.
        checkIfExists: true  // Stop with an error if the input file is missing.
    )

    SUMMARIZE_CONTEXT(context_ch)  // Send the file channel to the process.
}
