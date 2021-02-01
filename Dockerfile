FROM docker.pkg.github.com/navikt/dokgen/dokgen:1da1b34d611d75f2d051dd31c1b575a04046feb9
ENV ALLOW_ENCODED_SLASH=true
COPY content content
