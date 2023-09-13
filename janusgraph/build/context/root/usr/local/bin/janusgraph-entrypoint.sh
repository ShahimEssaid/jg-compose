#!/usr/bin/env bash
set -x
set -e
set -u
set -o pipefail
set -o noclobber

# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s nullglob

echo hello ============================
id -a
pwd
env | sort

touch test.txt

cd boot
if [[ ! -r bin/dist-setup.sh ]]; then
  mvn process-resources
fi

env | sort

exec bin/server.sh sonsole


