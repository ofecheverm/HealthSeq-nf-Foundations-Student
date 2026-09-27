#!/usr/bin/env bash

set -euo pipefail

errors=0

check_command() {
    local command_name="$1"

    if command -v "${command_name}" >/dev/null 2>&1; then
        printf "OK      %-10s %s\n" \
            "${command_name}" \
            "$(command -v "${command_name}")"
    else
        printf "MISSING %-10s\n" "${command_name}" >&2
        errors=$((errors + 1))
    fi
}

check_file() {
    local file_path="$1"

    if [[ -s "${file_path}" ]]; then
        echo "OK      ${file_path}"
    else
        echo "ERROR   Missing or empty: ${file_path}" >&2
        errors=$((errors + 1))
    fi
}

echo "HealthSeq-NF Foundations environment check"
echo "=========================================="
echo

check_command bash
check_command git
check_command java
check_command nextflow
check_command curl
check_command gzip

echo

if command -v nextflow >/dev/null 2>&1; then
    nextflow -version
fi

echo

check_file COURSE_START.md
check_file COURSE_PATH.md
check_file lessons/lesson.config
check_file lessons/upec_context.txt
check_file lessons/01_hello_nextflow.nf
check_file lessons/02_process_inputs.nf
check_file lessons/03_channels_and_data_flow.nf
check_file lessons/04_parameters.nf
check_file lessons/05_small_pipeline.nf
check_file exercises/FOUNDATIONS_EXERCISES.md
check_file exercises/PAPER_CONNECTION.md

echo

if [[ "${errors}" -ne 0 ]]; then
    echo "Environment validation failed with ${errors} error(s)." >&2
    exit 1
fi

echo "Environment validation passed."
