#!/bin/sh

SCRIPT=$0

usage() {
    echo "Usage: $SCRIPT <corpus_path>

	Outputs cleaned corpus to standard output." 1>&2
    exit 1
}

if [ -z "${1}" ]; then
    usage
fi

# 1. Normalize all numeric expressions
# 2. Remove punctuation
# 3. Remove final punctuation
# 4. Lowercase first letter of sentence
sed -e 's/[0-9][0-9.,]*/0/g' \
    -e "s/ [-.,?\!\"':;/()@#\$%^&*_=+{}|\\] / /g" \
    -e "s/ [-.,?\!\"':;/()@#\$%^&*_=+{}|\\]$//g" \
    -e "s/^[A-Z]/\L&/g" \
    "${1}"
