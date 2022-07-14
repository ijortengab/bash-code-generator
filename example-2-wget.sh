#!/bin/bash

# By default, the `Generated Code` will interprets a double hyphen as the end of
# options.

# Assume that we are going to create a shell script like the `wget` command.

parse-options.sh \
    --compact \
    --no-error-invalid-options \
    --no-error-require-arguments \
    --no-hash-bang \
    --no-original-arguments \
    --no-rebuild-arguments \
    --clean << EOF
FLAG=(
    '--version|-V'
    '--help|-h'
    '--background|-b'
    '--debug|-d'
    '--quiet|-q'
    '--no-host-directories|-nH'
)
VALUE=(
    '--output-file|-o'
    '--output-document|-O'
    '--append-output|-a'
)
MULTIVALUE=(
    '--execute|-e'
)
EOF
