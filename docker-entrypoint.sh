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
    # Use printf to safely pass arguments
    printf '%s\0' "--local-dir" "/models/$sanitized_model" "$model" | xargs -0 huggingface-cli download $token
done
