nextflow.enable.dsl = 2  // Use the current Nextflow DSL2 syntax.

// STUDENT TASK 1:
// Define params.case_name with U13824 as the default value.
// Key: params.case_name stores a value that users can override.

process CREATE_PARAMETER_REPORT {  // Define the report-creation process.

    tag "${case_name}"  // Show the current case name in the task log.

    input:
    val case_name  // Receive the case name as a value, not as a file.

    output:
    path "parameter_report.txt"  // Declare the file the process must create.

    script:
    """
    echo "Teaching case: ${case_name}" > parameter_report.txt  # Write the value to the report.
    """
}

workflow {  // Define the workflow data flow.

    // STUDENT TASK 2:
    // Create a value channel from params.case_name.
    // Key: Channel.value(...) creates a channel containing one value.

    // STUDENT TASK 3:
    // Pass the value channel to CREATE_PARAMETER_REPORT.
    // Key: PROCESS_NAME(channel_name) sends the channel to the process.
}
