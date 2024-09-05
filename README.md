# HuggingFace Hub Model Downloader

The purpose of this docker image is to provide a convenient way to download models from the HuggingFace Hub using HF's CLI.

## Usage

### Basic

```bash
docker run -it --rm -v $(PWD):/models amikos/hf-model-downloader  sentence-transformers/all-MiniLM-L6-v2
```

### With cache:

You can use the image to download models to a existing HF cache (`~/.cache/torch/sentence_transformers`) by setting `USE_CACHE=true` and mounting the cache directory.

```bash
docker run -it --rm -e USE_CACHE=true -v ~/.cache/torch/sentence_transformers:/models amikos/hf-model-downloader  sentence-transformers/all-MiniLM-L6-v2
```

> Note: An alternative location for HF models is `~/.cache/huggingface/hub/`

> Note: You can use a different cache directory by mounting a different directory.

Using HF sentence-transformers with custom cache dir:

```py
from sentence_transformers import SentenceTransformer
model = SentenceTransformer("sentence-transformers/all-MiniLM-L6-v2", cache_folder="/models")
```

### With HF Token:

Using HF token can be useful if your model is private.

```bash
export HF_TOKEN="your_huggingface_token"
docker run -it --rm -e HF_TOKEN="$HF_TOKEN" -v $(PWD):/models amikos/hf-model-downloader  sentence-transformers/all-MiniLM-L6-v2
```

### Using in Docker Compose:

```yaml
version: '3.8'
services:
  hf-model-downloader:
    image: amikos/hf-model-downloader
    command: sentence-transformers/all-MiniLM-L6-v2
    volumes:
      - ./models:/models
    environment:
      - HF_TOKEN=your_huggingface_token
```

## Building

```bash
docker build -t <tag> .
```
