ARG ALPINE_VERSION=3.18
FROM alpine:${ALPINE_VERSION} AS base

RUN apk update && \
    apk upgrade && \
    apk add \
        bash 
        #\tzdata \
        #rsync \
        #openssh-client-default

RUN mkdir /scripts
WORKDIR /scripts

# Set Entrypoint for image
ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "echo -e '\nAvailable Scripts:\n'; ls -l /scripts/*" ]

# Shell Image
FROM base AS shell
COPY ./shell/ /src
RUN mv /src/* ./; for dir in *; do chmod +x "${dir}"/*.sh; done

# Python Image
FROM base AS python
RUN apk add python3
COPY ./python/ .
RUN mv /src/* ./; for dir in *; do chmod +x "${dir}"/*.py; done

