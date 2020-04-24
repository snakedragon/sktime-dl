#!/bin/bash

# adapted from https://github.com/scikit-learn/scikit-learn/blob/master/build_tools/travis/test_script.sh

# exit the script if any statement returns a non-true return value
set -e

# print test environment
conda list -n testenv

# Get into a temp directory to run test from the installed scikit-learn and
# check if we do not leave artifacts
mkdir -p "$TEST_DIR"

# We need to copy the setup.cfg for the pytest settings
cp setup.cfg "$TEST_DIR"
cd "$TEST_DIR"

set -x  # print executed commands to the terminal

pytest -m="not slow" --verbose --showlocals --durations=20 --cov=sktime_dl --pyargs sktime_dl

set +e