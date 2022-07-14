#!/bin/bash

# By default, the `Generated Code` will interprets a double hyphen as the end of
# options.
#
# Assume that we are going to create a shell script like the `ssh` command.
#
# The `ssh` command has a unique argument format, which every argument after
# first operand interpreted as an operand.
#
# It means the first operand is mark as the end of options.
#
# From manual of `ssh`:
#
# ```
# SYNOPSIS
#    ssh [all short options starting with single hyphen, are placed here] [user@]hostname [command]
# ```
#
# We have to use `--with-end-options-first-operand` option, so the generated
# code behaves like the `ssh` command.

parse-options.sh \
    --compact \
    --no-error-invalid-options \
    --no-error-require-arguments \
    --no-hash-bang \
    --no-original-arguments \
    --no-rebuild-arguments \
    --with-end-options-first-operand \
    --clean << EOF
FLAG=(
    '-4'
)
VALUE=(
    '-l'
)
MULTIVALUE=(
    '-o'
)
INCREMENT=(
    '-v'
)
EOF
