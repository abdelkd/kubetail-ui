#!/usr/bin/env bash
set -euo pipefail

run_and_measure() {
  local cmd="$1"
  echo "> Running: $cmd"
  echo "-------------------"

  { time bash -c "$cmd" > /dev/null 2>&1; } 2>&1
  echo "-------------------"
  if [ -d "./dist" ]; then
    du -sh ./dist
  else
    echo "Warning: ./dist directory not found"
  fi
  echo
}

echo "Starting build & measure sequence..."
echo

run_and_measure "pnpm build"
run_and_measure "pnpm tsup"

echo "All done."
