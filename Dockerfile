FROM ghcr.io/navikt/dokgen/dokgen:a90cbbcff8c5e49899b2077c0d79d90e68e34871
LABEL org.opencontainers.image.source=https://github.com/navikt/k9-dokgen
ENV ALLOW_ENCODED_SLASH=true
COPY content content
