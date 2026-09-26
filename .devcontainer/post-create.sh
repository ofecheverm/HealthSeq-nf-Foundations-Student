#!/usr/bin/env bash

set -euo pipefail

NEXTFLOW_VERSION="${NXF_VER:-26.04.6}"

echo "Installing HealthSeq-NF Foundations dependencies..."

sudo apt-get update

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    git \
    gzip \
    shellcheck

sudo rm -rf /var/lib/apt/lists/*

if command -v nextflow >/dev/null 2>&1; then
    echo "Nextflow is already installed:"
    nextflow -version
else
    echo "Installing Nextflow ${NEXTFLOW_VERSION}..."

    temporary_directory="$(mktemp -d)"
    trap 'rm -rf "${temporary_directory}"' EXIT

    (
        cd "${temporary_directory}"
        export NXF_VER="${NEXTFLOW_VERSION}"
        curl -fsSL https://get.nextflow.io | bash
        sudo install -m 0755 nextflow /usr/local/bin/nextflow
    )
fi

mkdir -p "${NXF_HOME:-/workspaces/.nextflow}"

echo
echo "Installed versions:"
echo "-------------------"

java -version
git --version
nextflow -version

echo
echo "HealthSeq-NF Foundations environment is ready."
