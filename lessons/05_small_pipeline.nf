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
    echo "" >> case_summary.txt
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
    echo "Sequencing QC and alignment do not independently confirm" \
        >> bounded_case_summary.txt
    echo "antimicrobial susceptibility or treatment recommendations." \
        >> bounded_case_summary.txt
    """
}

process FINALIZE_LESSON_REPORT {
    tag "final report"

    publishDir params.lesson_outdir, mode: 'copy'

    input:
    path bounded_report

    output:
    path "lesson5_final_report.txt"

    script:
    """
    echo "HealthSeq-NF Beginner Pipeline" > lesson5_final_report.txt
    echo "==============================" >> lesson5_final_report.txt
    echo "" >> lesson5_final_report.txt
    cat ${bounded_report} >> lesson5_final_report.txt
    echo "" >> lesson5_final_report.txt
    echo "Generated reproducibly with Nextflow." \
        >> lesson5_final_report.txt
    """
}

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

    FINALIZE_LESSON_REPORT(
        ADD_EVIDENCE_BOUNDARY.out.bounded_report
    )
}
