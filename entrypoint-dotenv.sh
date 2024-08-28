#!/bin/sh
set -e

# Set default environment path
DEFAULT_ENV_PATH="$HOME/.env:/etc/.env"

# Use ENV_PATH environment variable if set, otherwise use default paths
ENV_PATH="${ENV_PATH:-$DEFAULT_ENV_PATH}"

# Enable automatic export of all variables
set -a

# Function to process a single .env file
process_env_file() {
  local filepath="$1"
  if [ -f "$filepath" ]; then
    . "$filepath"
  fi
}

# Function to read all .env files in the specified paths
read_env_files() {
  IFS=':' read -r -a paths <<< "$1"
  for path in "${paths[@]}"; do
    if [ -d "$path" ]; then
      for filepath in "$path"/*.env; do
        [ -e "$filepath" ] || continue
        process_env_file "$filepath"
      done
    elif [ -f "$path" ]; then
      process_env_file "$path"
    fi
  done
}

# Read environment variables from .env files in the environment paths
read_env_files "$ENV_PATH"

# Disable automatic export of all variables
set +a

# Execute the given command
exec "$@"

