nextflow.enable.dsl = 2

/*
 * This is the first course workflow.
 *
 * A Nextflow process describes one reproducible task.
 * This process creates a small text file.
 */
process SAY_HELLO {
    output:
    path "hello_nextflow.txt"

    script:
    """
    echo "Hello from Nextflow" > hello_nextflow.txt
    """
}

/*
 * The workflow block tells Nextflow which process to execute.
 */
workflow {
    SAY_HELLO()
}
