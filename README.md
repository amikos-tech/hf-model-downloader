# HuggingFace Hub Model Downloader

The purpose of this docker image is to provide a convenient way to download models from the HuggingFace Hub using HF's CLI.

## Usage

```bash
docker run -it --rm -v $(PWD):/models amikos/hf-model-downloader  sentence-transformers/all-MiniLM-L6-v2
```

With HF Token:

```bash
export HF_TOKEN="your_huggingface_token"
docker run -it --rm -e HF_TOKEN="$HF_TOKEN" -v $(PWD):/models amikos/hf-model-downloader  sentence-transformers/all-MiniLM-L6-v2
```

## Building

```bash
docker build -t <tag> .
```
