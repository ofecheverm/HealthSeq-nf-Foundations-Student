nextflow.enable.dsl = 2

/*
 * Lesson 4 introduces parameters.
 *
 * A parameter allows a user to change workflow behavior from the command
 * line without editing the workflow source code.
 */

params.case_name = 'U13824'

process CREATE_PARAMETER_REPORT {
    tag "${case_name}"

    input:
    val case_name

    output:
    path "parameter_report.txt"

    script:
    """
    echo "HealthSeq-NF Parameter Report" > parameter_report.txt
    echo "=============================" >> parameter_report.txt
    echo "Teaching case: ${case_name}" >> parameter_report.txt
    echo "The case name was supplied through a Nextflow parameter." \
        >> parameter_report.txt
    """
}

workflow {
    /*
     * Channel.value creates a channel containing one value.
     *
     * The value comes from params.case_name.
     */
    case_name_ch = Channel.value(params.case_name)

    CREATE_PARAMETER_REPORT(case_name_ch)
}
