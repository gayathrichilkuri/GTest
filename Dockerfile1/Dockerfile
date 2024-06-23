FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apache2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY index.html /var/www/html
CMD ["apachectl", "-D", "FOREGROUND"]