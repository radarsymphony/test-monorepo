ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION}

RUN set -x \
    && apk update \
    && apk upgrade 

# Set Entrypoint for image
ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "echo -e Base Image Built" ]
