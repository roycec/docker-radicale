FROM alpine:latest

# Version of Radicale (e.g. 2.0.0)
ARG VERSION=2.1.11
ARG UID=3999
ARG GID=3999
ENV TZ Europe/Berlin

# Install dependencies
RUN apk add --no-cache \
      git \
      curl \
      tzdata \
      python3 \
      python3-dev \
      build-base \
      libffi-dev \
      ca-certificates \
      openssl
# Install Radicale
RUN wget --quiet https://github.com/Kozea/Radicale/archive/${VERSION}.tar.gz --output-document=radicale.tar.gz && \
    tar xzf radicale.tar.gz && \
    pip3 install ./Radicale-${VERSION}[md5,bcrypt] && \
    rm -r radicale.tar.gz Radicale-${VERSION}
# Install dependencies for Radicale<2.1.9
RUN pip3 install passlib[bcrypt]
# Remove build dependencies
RUN apk del \
      python3-dev \
      build-base \
      libffi-dev \
      && addgroup -g $GID radicale \
      && adduser -D -s /bin/false -H -u $UID -G radicale radicale

#
HEALTHCHECK --interval=120s --retries=3 CMD curl --fail http://127.0.0.1:5232 || exit 1
# Persistent storage for data (Mount it somewhere on the host!)
VOLUME /var/lib/radicale
# Configuration data (Put the "config" file here!)
VOLUME /etc/radicale
# TCP port of Radicale (Publish it on a host interface!)
EXPOSE 5232
# Run Radicale (Configure it here or provide a "config" file!)
CMD ["radicale", "--hosts", "0.0.0.0:5232"]
