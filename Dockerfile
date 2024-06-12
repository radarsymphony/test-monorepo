ARG ALPINE_VERSION=3.18
FROM alpine:${ALPINE_VERSION} AS base

RUN apk update && \
    apk upgrade && \
    apk add \
        bash 
        #\tzdata \
        #rsync \
        #openssh-client-default

RUN mkdir /src
WORKDIR /src

# Set Entrypoint for image
ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "ls -al /src/*" ]

FROM base AS shell
COPY ./shell/ .
RUN for dir in ./*; do chmod +x "${dir}"/*.sh; done

FROM base AS python
RUN apk add python3
COPY ./python/ .
RUN for dir in ./*; do chmod +x "${dir}"/*.py; done
