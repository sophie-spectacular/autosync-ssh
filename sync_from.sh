#!/bin/bash

REMOTE_USER="user"
REMOTE_HOST="host"
REMOTE_DIR="remote_dir/"
LOCAL_DIR="local_dir/"

ssh "${REMOTE_USER}@${REMOTE_HOST}" "find '${REMOTE_DIR}' -type f \( -name '*.csv' -o -name '*.txt' -o -name '*.out' \) -not -path '*/wandb/*'" | \
while read -r remote_file; do
    local_dir="${LOCAL_DIR}/$(dirname "${remote_file#${REMOTE_DIR}/}")"
    
    mkdir -p "${local_dir}"
    
    scp "${REMOTE_USER}@${REMOTE_HOST}:${remote_file}" "${local_dir}/"
done
