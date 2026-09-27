nextflow.enable.dsl = 2  // Use the current Nextflow DSL2 syntax.

process CREATE_CASE_REPORT {  // Define the first process.

    tag "U13824"  // Show a readable case label in the task log.

    input:
    path context_file  // Receive the UPEC context file.

    output:
    path "upec_case_report.txt", emit: report  // Create and name the output.

    script:
    """
    echo "UPEC Teaching Case" > upec_case_report.txt  # Create the report.
    cat ${context_file} >> upec_case_report.txt  # Add the context-file contents.
    """
}

process ADD_REPRODUCIBILITY_NOTE {  // Define the second process.

    tag "final report"  // Show a readable label in the task log.

    input:
    path case_report  // Receive the report created by the first process.

    output:
    path "upec_final_report.txt"  // Declare the final output file.

    script:
    """
    cat ${case_report} > upec_final_report.txt  # Copy the first report.
    echo "Generated with Nextflow." >> upec_final_report.txt  # Add a final note.
    """
}

workflow {  // Define the workflow data flow.

    context_ch = Channel.fromPath(  // Create a channel containing the input file.
        "${projectDir}/upec_context.txt",  // Locate the file beside this workflow.
        checkIfExists: true  // Stop if the input file does not exist.
    )

    CREATE_CASE_REPORT(context_ch)  // Send the input file to the first process.

    // STUDENT TASK:
    // Connect CREATE_CASE_REPORT.out.report
    // to ADD_REPRODUCIBILITY_NOTE.
    //
    // Key:
    // CREATE_CASE_REPORT.out.report is the named output from the first process.
    // ADD_REPRODUCIBILITY_NOTE needs that output as its input.
}
