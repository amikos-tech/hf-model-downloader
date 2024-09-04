FROM python:alpine3.12

LABEL maintainer="trayan.azarov@amikos.tech"


COPY docker-entrypoint.sh /
RUN pip install 'huggingface_hub[cli]' && \
    chmod +x /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]