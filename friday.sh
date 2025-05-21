#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Target directory relative to script location
TARGET_DIR="$SCRIPT_DIR/bin"

# check for a rebuild request
REBUILD_REQUEST=false

if [ "$1" = "--rebuild" ]; then
  # shellcheck disable=SC2034
  REBUILD_REQUEST=true
  shift
fi

# If friday isn't built, or a rebuild has been requested, build from dockerfile
if $REBUILD_REQUEST || \
   [ ! -d "$TARGET_DIR" ] || \
   [ $(find "$TARGET_DIR" -mindepth 1 -maxdepth 1 -type d | wc -l) -eq 0 ] || \
   [ $(find "$TARGET_DIR" -mindepth 2 -type f | wc -l) -eq 0 ]; then
    echo "Asking Dum-E to build Friday, please wait..."
    docker build -f Dockerfile --target dum-e -o ./bin .
fi

# Get CPU architecture to call the correct Friday build
RUNTIME="$(uname -m)"
echo $RUNTIME
if [ -f "$TARGET_DIR/$RUNTIME/friday" ]; then
# Call Friday with all of the args that were passed to the shell wrapper
  if [ $# -gt 0 ]; then
    "$TARGET_DIR/$RUNTIME/friday" "$@"
  else
    "$TARGET_DIR/$RUNTIME/friday"
  fi
else
  echo "Sorry, Friday doesn't support your CPU architecture"
fi