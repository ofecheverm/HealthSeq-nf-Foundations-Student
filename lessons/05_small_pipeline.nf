nextflow.enable.dsl = 2  // Use the current Nextflow DSL2 syntax.

params.case_name = 'U13824'  // Set the default teaching-case name.
params.lesson_outdir = "${projectDir}/outputs"  // Set the default output directory.

process CREATE_CASE_SUMMARY {  // Define the first process.

    tag "${case_name}"  // Show the case name in the task log.

    input:
    path context_file  // Receive the teaching-case file.
    val case_name  // Receive the teaching-case name as a value.

    output:
    path "case_summary.txt", emit: summary  // Create and name the summary output.

    script:
    """
    echo "Teaching case: ${case_name}" > case_summary.txt  # Create the summary.
    cat ${context_file} >> case_summary.txt  # Add the context-file contents.
    """
}

process ADD_EVIDENCE_BOUNDARY {  // Define the second process.

    tag "evidence boundary"  // Show a readable label in the task log.

    input:
    path case_summary  // Receive the summary from the first process.

    output:
    path "bounded_case_summary.txt", emit: bounded_report  // Create and name the output.

    script:
    """
    cat ${case_summary} > bounded_case_summary.txt  # Copy the case summary.
    echo "" >> bounded_case_summary.txt  # Add an empty line.
    echo "Evidence boundary:" >> bounded_case_summary.txt  # Add a heading.
    echo "Computational output requires scientific interpretation." \
        >> bounded_case_summary.txt  # Add the evidence statement.
    """
}

// STUDENT TASK 1:
// Add a process named FINALIZE_LESSON_REPORT.
//
// The process must:
// - receive the bounded report as a path input;
// - create lesson5_final_report.txt;
// - publish the final report to params.lesson_outdir.
//
// Key:
// path declares a file input or output.
// publishDir copies a declared output to a selected directory.

workflow {  // Define the workflow data flow.

    context_ch = Channel.fromPath(  // Create a channel containing the context file.
        "${projectDir}/upec_context.txt",  // Locate the file beside the workflow.
        checkIfExists: true  // Stop if the input file does not exist.
    )

    case_name_ch = Channel.value(params.case_name)  // Create a channel for the case name.

    CREATE_CASE_SUMMARY(
        context_ch,  // Send the context-file channel to the first process.
        case_name_ch  // Send the case-name channel to the first process.
    )

    ADD_EVIDENCE_BOUNDARY(
        CREATE_CASE_SUMMARY.out.summary  // Send the named summary output to Process 2.
    )

    // STUDENT TASK 2:
    // Connect ADD_EVIDENCE_BOUNDARY.out.bounded_report
    // to FINALIZE_LESSON_REPORT.
    //
    // Key:
    // .out.bounded_report accesses the named output from Process 2.
    // PROCESS_NAME(channel) sends a channel into a process.
}
