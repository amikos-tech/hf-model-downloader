FROM python:alpine3.20

LABEL maintainer="trayan.azarov@amikos.tech"
LABEL description="HuggingFace Hub Model Downloader"
LABEL url="https://github.com/amikos-tech/hf-model-downloader"

RUN adduser -D appuser

COPY docker-entrypoint.sh /
RUN pip install 'huggingface_hub[cli]' && \
    chmod +x /docker-entrypoint.sh && \
    chown appuser:appuser /docker-entrypoint.sh

USER appuser


ENTRYPOINT [ "/docker-entrypoint.sh" ]