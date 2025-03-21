FROM ghcr.io/navikt/dokgen/dokgen:d7c09e43c5c54b1c698a4265ebce0850ba720d5f
LABEL org.opencontainers.image.source=https://github.com/navikt/k9-dokgen
COPY content content
