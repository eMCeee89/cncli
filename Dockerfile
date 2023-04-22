FROM alpine:3.17 as base

ARG cncli_version=5.3.2
ARG cncli_tar=/tmp/cncli.tar.gz

RUN wget -O "${cncli_tar}" "https://github.com/cardano-community/cncli/releases/download/v${cncli_version}/cncli-${cncli_version}-x86_64-unknown-linux-musl.tar.gz"; \
    tar xvzf "${cncli_tar}" -C /usr/local/bin; \
    rm -f "${cncli_tar}"

ENTRYPOINT [ "/usr/local/bin/cncli" ]


FROM base as test
RUN [ "/usr/local/bin/cncli", "--help" ]
