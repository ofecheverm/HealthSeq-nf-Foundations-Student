nextflow.enable.dsl = 2

// STUDENT TASK 1:
// Define params.case_name with U13824 as the default value.

process CREATE_PARAMETER_REPORT {
    tag "${case_name}"

    input:
    val case_name

    output:
    path "parameter_report.txt"

    script:
    """
    echo "Teaching case: ${case_name}" > parameter_report.txt
    """
}

workflow {
    // STUDENT TASK 2:
    // Create a value channel from params.case_name.

    // STUDENT TASK 3:
    // Pass the value channel to CREATE_PARAMETER_REPORT.
}
