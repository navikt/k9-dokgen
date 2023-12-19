FROM ghcr.io/navikt/dokgen/dokgen:0e38d3300821bc1585130107951921c44b03eeac
LABEL org.opencontainers.image.source=https://github.com/navikt/k9-dokgen
ENV ALLOW_ENCODED_SLASH=true
COPY content content
