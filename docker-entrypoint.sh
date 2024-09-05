#!/bin/sh

for model in "$@"
do
    # Sanitize the model name
    sanitized_model=$(printf '%s' "$model" | sed 's/[^a-zA-Z0-9._-]/_/g')
    token=""
    # Add token if HF_TOKEN is defined
    if [ -n "$HF_TOKEN" ]; then
        token="--token ${HF_TOKEN}"
        echo "Found HF token, using it to download $model"
    fi
    target_dir_cmd="--local-dir /models/$sanitized_model"
    if [ -n "$USE_CACHE" ] && [ "$(echo "$USE_CACHE" | tr '[:upper:]' '[:lower:]')" = "true" ]; then
        target_dir_cmd="--cache-dir /models"
    fi
    # Use printf to safely pass arguments
    printf '%s\0' $target_dir_cmd "$model" | xargs -0 huggingface-cli download $token
done
