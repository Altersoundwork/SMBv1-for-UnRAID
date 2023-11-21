# Alpine v3
FROM alpine:3
LABEL maintainer "Altersoundwork"

# Installation of dependencies
RUN apk --no-cache add samba supervisor bash

# Creating directory
RUN mkdir /config /scanssmbv1 /startup

# Configuration (needs work)
COPY *.conf /config/
COPY entrypoint.sh /startup/

# Make the entrypoint script executable
RUN chmod +x /startup/entrypoint.sh

# Docker startup
EXPOSE 135/tcp 137/udp 138/udp 139/tcp 445/tcp
ENTRYPOINT ["supervisord", "-c", "/config/supervisord.conf"]
