ARG ALPINE_VERSION=3.18
FROM alpine:${ALPINE_VERSION}

# Update the system to integrate any security patches
RUN \
    apk update && \
    apk upgrade && \
    apk add \
        python3

# Set working directory to /app
WORKDIR /src

# Copy source files (excluding those listed in .dockerignore)
COPY ./python .

# Set executable permissions
#RUN chmod +x ./*/*.py
RUN ls -l /src

# Launch Crond using the custom crontab provided
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["echo", "Python"]
