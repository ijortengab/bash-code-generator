# Code Generator for Parsing Options in Command Line Arguments

Attention:

The generated code just for parsing only, not include validation.

## Install

Download then put command in `$PATH`.

```
wget https://raw.githubusercontent.com/ijortengab/bash-code-generator/master/parse-options.sh
chmod a+x parse-options.sh
mv parse-options.sh -t /usr/local/bin
```

... or ...

```
curl -O https://raw.githubusercontent.com/ijortengab/bash-code-generator/master/parse-options.sh
chmod a+x parse-options.sh
mv parse-options.sh -t /usr/local/bin
```

## Getting Started

Just execute it.

```
parse-options.sh << EOF
FLAG=(
    '--quiet|-q'
)
VALUE=(
    --output-file
)
EOF
```

The Generated Code established as STDOUT.

```
#!/bin/bash

# Original arguments.
ORIGINAL_ARGUMENTS=("$@")

# Temporary variable.
_new_arguments=()

# Processing standalone options.
while [[ $# -gt 0 ]]; do
    case "$1" in
        # value
        --output-file=*)
            output_file="${1#*=}"
            shift
            ;;
        --output-file)
            if [[ ! $2 == "" && ! $2 =~ ^-[^-] ]];then
                output_file="$2"
                shift
            else
                echo "Option $1 requires an argument." >&2
            fi
            shift
            ;;
        # flag
        --quiet|-q)
            quiet=1
            shift
            ;;
        --)
            shift
            while [[ $# -gt 0 ]]; do
                case "$1" in
                    *)
                        _new_arguments+=("$1")
                        shift
                        ;;
                esac
            done
            ;;
        --[^-]*)
            echo "Invalid option: $1" >&2
            shift
            ;;
        *)
            _new_arguments+=("$1")
            shift
            ;;
    esac
done

set -- "${_new_arguments[@]}"

unset _new_arguments
# End of generated code by CodeGeneratorParseOptions().
```

Add your own value in the FLAG or VALUE array, pass other variant of OPTIONS, and execute again. The generated code will be updated.

```
parse-options.sh \
    --without-end-options-double-dash \
    --compact \
    --clean \
    --no-rebuild-arguments \
    --no-original-arguments \
    --no-error-invalid-options \
    --no-error-require-arguments << EOF
FLAG=(
    '--quiet|-q'
)
VALUE=(
    --output-file
)
EOF
```

Generated code changed:

```
#!/bin/bash

while [[ $# -gt 0 ]]; do
    case "$1" in
        --output-file=*) output_file="${1#*=}"; shift ;;
        --output-file) if [[ ! $2 == "" && ! $2 =~ ^-[^-] ]]; then output_file="$2"; shift; fi; shift ;;
        --quiet|-q) quiet=1; shift ;;
        *) shift ;;
    esac
done

```

**You can embed that generated code into your shell script at the beginning**.

Navigate to `example-2-wget.sh` and `example-3-ssh.sh` file to learn more deeply.

See the `DOCUMENTATION.md` file for a complete guide.
