FROM ghcr.io/navikt/dokgen/dokgen:latest
LABEL org.opencontainers.image.source=https://github.com/navikt/k9-dokgen
ENV ALLOW_ENCODED_SLASH=true
COPY content content
