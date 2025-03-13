#!/usr/bin/env bash
set -e

# run this script from the MsaServer folder
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "${SCRIPT_DIR}"

wget -q https://github.com/soedinglab/MMseqs2/releases/download/17-b804f/mmseqs-linux-avx2.tar.gz
tar -xzf mmseqs-linux-avx2.tar.gz mmseqs/bin/mmseqs
rm  mmseqs-linux-avx2.tar.gz

# mmseqs needs to be in PATH for the setup_databases script to work
PATH="${SCRIPT_DIR}/mmseqs/bin:$PATH"

# make sure the API server is checked out
wget -q https://github.com/soedinglab/MMseqs2-App/archive/refs/tags/v8-c4b9644.tar.gz
tar -xzf v8-c4b9644.tar.gz 
rm  v8-c4b9644.tar.gz
mv MMseqs2-App-8-c4b9644 mmseqs-server

# compile the api server
pushd mmseqs-server/backend
go build -o ../../msa-server
popd

