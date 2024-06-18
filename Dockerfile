ARG ALPINE_VERSION=3.18
FROM alpine:${ALPINE_VERSION} AS base

RUN apk update && \
    apk upgrade && \
    apk add \
        bash 
        #\tzdata \
        #rsync \
        #openssh-client-default

# Define working directory
ENV WDIR=/scripts
RUN mkdir ${WDIR}
WORKDIR ${WDIR}

# Set default entrypoint for images
ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "echo -e '\nAvailable Scripts:\n'; ls -l ${WDIR}/*" ]

# Build the Shell Image variant
FROM base AS shell
COPY ./shell .
RUN find ${WDIR} -name "*.sh" -exec chmod +x {} \;

# Build the Python Image variant
FROM base AS python
RUN apk add python3
COPY ./python .
RUN find ${WDIR} -name "*.py" -exec chmod +x {} \;

