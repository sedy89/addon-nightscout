ARG BUILD_FROM
# hadolint ignore=DL3006
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN mkdir -p /opt/app
COPY . /opt
WORKDIR /opt/app

ARG BUILD_ARCH=aarch64
ARG NIGHTSCOUT_VERSION=dev
# hadolint ignore=DL3008
RUN \
    curl -sL "https://deb.nodesource.com/setup_14.x" | bash - \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        wget \
        gnupg \
        nodejs \
        git   \
        webpack \
        vim  \
        build-essential \
        python2.7  \
        nginx-extras  \
	&& echo "deb https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" > /etc/apt/sources.list.d/mongodb-org-4.4.list \
	&& wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc |  apt-key add - \
	&& apt-get update \
    && apt-get install -y --no-install-recommends \
		mongodb-org \
		mongodb-org-server \
		mongodb-org-shell \
		mongodb-org-mongos \
		mongodb-org-tools \
	&& curl https://raw.githubusercontent.com/mongodb/mongo/master/debian/init.d > /etc/init.d/mongodb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --branch ${NIGHTSCOUT_VERSION} https://github.com/nightscout/cgm-remote-monitor.git /opt/app

RUN npm install -g npm@8.18.0 \
    && npm install husky --save-dev \
    && npm install webpack webpack-dev-server --save-dev \
    && npm run postinstall \
    && npm run env 

VOLUME ["/data/db"]

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Nightscout" \
    io.hass.description="Nightscout acts as a web-based CGM (Continuous Glucose Montinor) to allow multiple caregivers to remotely view a patients glucose data in realtime." \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Andreas Sedlmayer <badaboom.as@gmail.com>" \
    org.opencontainers.image.title="Nightscout" \
    org.opencontainers.image.description="Nightscout acts as a web-based CGM (Continuous Glucose Montinor) to allow multiple caregivers to remotely view a patients glucose data in realtime." \
    org.opencontainers.image.vendor="Andreas Sedlmayer" \
    org.opencontainers.image.authors="Andreas Sedlmayer" \
    org.opencontainers.image.licenses="GNUv3" \
    org.opencontainers.image.source="https://github.com/sedy89/addon-nightscout" \
    org.opencontainers.image.documentation="https://github.com/sedy89/addon-nightscout/blob/master/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
