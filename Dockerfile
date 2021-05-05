ARG PARENT_VERSION=1.2.5-node14.16.1
ARG AXE_VERSION=4.1.1

FROM defradigital/node-development:${PARENT_VERSION}

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

USER root

RUN apk update && apk upgrade && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories && \
    echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories && \
    apk add --no-cache \
        chromium \
        chromium-chromedriver \
        nss@edge \
        freetype@edge \
        harfbuzz@edge \
        ttf-freefont@edge  

RUN npm install --global @axe-core/cli@${AXE_VERSION} --unsafe-perm=true --allow-root

CMD axe
