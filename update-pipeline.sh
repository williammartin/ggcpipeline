#!/usr/bin/env bash
set -euo pipefail

if [ -z "${1:-}" ]; then
  echo "No target passed, using 'wings'"
  FLYRC_TARGET="wings"
else
  FLYRC_TARGET=$1
fi

if ! grep "${FLYRC_TARGET}" ~/.flyrc > /dev/null 2>&1 ; then
  echo "Please ensure ${FLYRC_TARGET} exists in ~/.flyrc and that you have run fly login"
  exit 1
fi

echo "setting main pipeline"
fly -t="${FLYRC_TARGET}" set-pipeline --pipeline=main --config="main.yml"

echo "exposing main pipeline"
fly -t="${FLYRC_TARGET}" expose-pipeline --pipeline=main

