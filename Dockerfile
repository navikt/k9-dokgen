FROM docker.pkg.github.com/navikt/dokgen/dokgen:60faed8a6685937ac56e99e2303239838f78d052
ENV ALLOW_ENCODED_SLASH=true
COPY content content
