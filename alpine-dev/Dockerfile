FROM alpine:edge
RUN apk update && apk add zsh alpine-sdk
RUN mkdir -p /var/cache/distfiles && \
    chmod a+w /var/cache/distfiles
ENTRYPOINT ["zsh"]
