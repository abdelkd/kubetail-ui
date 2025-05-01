#!/usr/bin/env bash
set -euo pipefail

run_and_measure() {
  local cmd="$1"
  local dir_to_check="$2"
  
  echo "> Running: $cmd"
  echo "-------------------"

  # Running the command and measuring its time
  { time bash -c "$cmd" > /dev/null 2>&1; } 2>&1
  echo "-------------------"

  if [ -d "$dir_to_check" ]; then
    du -sh "$dir_to_check"
  else
    echo "Warning: $dir_to_check directory not found"
  fi

  # Clean up both potential directories
  rm -rf ./dist ./dist-tsup
  echo
}

echo "Starting build & measure sequence..."
echo

# Run pnpm build and check for the dist directory
run_and_measure "pnpm build" "./dist"

# Run pnpm tsup and check for the dist-tsup directory
run_and_measure "pnpm tsup" "./dist-tsup"

echo "All done."

