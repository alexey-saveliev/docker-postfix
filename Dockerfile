From ubuntu:jammy
LABEL org.opencontainers.image.authors="saveliev@vectorinfo.ru"

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Start editing
# Install package here for cache
RUN apt-get update && apt-get -y install \
    supervisor \
    postfix \
    sasl2-bin \
    opendkim \
    opendkim-tools \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add files
COPY assets/install.sh /opt/install.sh

# Run
CMD /opt/install.sh;/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
