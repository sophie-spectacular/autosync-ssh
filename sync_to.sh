#!/bin/bash

# Variables
LOCAL_DIR="wlnfw-retraining/"          # Local directory to copy files from
REMOTE_USER="sdhalleweyn"        # Remote SSH username
REMOTE_HOST="txe1-login.mit.edu"        # Remote host (IP or hostname)
REMOTE_DIR="wlnfw-retraining/"         # Remote directory to copy files to


# Check if all arguments are provided
if [[ -z "$LOCAL_DIR" || -z "$REMOTE_USER" || -z "$REMOTE_HOST" || -z "$REMOTE_DIR" ]]; then
  echo "Usage: $0 <local_dir> <remote_user> <remote_host> <remote_dir>"
  exit 1
fi

LOCAL_DIR="${LOCAL_DIR%/}"
REMOTE_DIR="${REMOTE_DIR%/}"

# Use rsync for recursive copying of matching files
rsync -avz --include='*/' --include='*.py' --include='*.sh' --exclude='*' "$LOCAL_DIR/" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/"

# Check if rsync succeeded
if [[ $? -eq 0 ]]; then
  echo "Files successfully copied to $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
else
  echo "Error copying files. Check your paths and SSH connection."
fi