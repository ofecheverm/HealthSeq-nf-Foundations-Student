nextflow.enable.dsl = 2  // Use the current Nextflow DSL2 syntax.

/*
 * This is the first course workflow.
 *
 * A Nextflow process describes one reproducible task.
 * This process creates a small text file.
 */
process SAY_HELLO {  // Define a process named SAY_HELLO.

    output:
    path "hello_nextflow.txt"  // Declare the file the process must create.

    script:
    """
    echo "Hello from Nextflow" > hello_nextflow.txt  # Write the message to the file.
    """
}

/*
 * The workflow block tells Nextflow which process to execute.
 */
workflow {

    SAY_HELLO()  // Run the SAY_HELLO process.
}
