nextflow.enable.dsl = 2

params.case_name = 'U13824'
params.lesson_outdir = "${projectDir}/outputs"

process CREATE_CASE_SUMMARY {
    tag "${case_name}"

    input:
    path context_file
    val case_name

    output:
    path "case_summary.txt", emit: summary

    script:
    """
    echo "Teaching case: ${case_name}" > case_summary.txt
    cat ${context_file} >> case_summary.txt
    """
}

process ADD_EVIDENCE_BOUNDARY {
    tag "evidence boundary"

    input:
    path case_summary

    output:
    path "bounded_case_summary.txt", emit: bounded_report

    script:
    """
    cat ${case_summary} > bounded_case_summary.txt
    echo "" >> bounded_case_summary.txt
    echo "Evidence boundary:" >> bounded_case_summary.txt
    echo "Computational output requires scientific interpretation." \
        >> bounded_case_summary.txt
    """
}

// STUDENT TASK 1:
// Add a process named FINALIZE_LESSON_REPORT.
//
// The process must:
// - receive the bounded report as a path input;
// - create lesson5_final_report.txt;
// - publish the final report to params.lesson_outdir.

workflow {
    context_ch = Channel.fromPath(
        "${projectDir}/upec_context.txt",
        checkIfExists: true
    )

    case_name_ch = Channel.value(params.case_name)

    CREATE_CASE_SUMMARY(
        context_ch,
        case_name_ch
    )

    ADD_EVIDENCE_BOUNDARY(
        CREATE_CASE_SUMMARY.out.summary
    )

    // STUDENT TASK 2:
    // Connect ADD_EVIDENCE_BOUNDARY.out.bounded_report
    // to FINALIZE_LESSON_REPORT.
}
