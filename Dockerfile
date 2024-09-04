FROM python:alpine3.12

LABEL maintainer="trayan.azarov@amikos.tech"
LABEL description="HuggingFace Hub Model Downloader"
LABEL url="https://github.com/amikos-tech/hf-model-downloader"

COPY docker-entrypoint.sh /
RUN pip install 'huggingface_hub[cli]' && \
    chmod +x /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]