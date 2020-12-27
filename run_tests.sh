#!/usr/bin/env bash

set -u

echo "Running test suite..."

pushd test || exit 1

exit_code=""

for test_case in test-* ; do
    bash "$(basename "$test_case")"
    exit_code="${exit_code}$?"
done

popd || true

if [ -z "$(echo $exit_code | tr -d 0)" ] ; then
    echo "Test suite passed!"
    exit 0
else
    echo "Test suite failed!" >&2
    exit 1
fi
