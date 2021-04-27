FROM selenium/node-chrome:latest

USER root

RUN apt-get update && apt-get install -y gnupg

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -

RUN apt-get update && apt-get install -y \
    nodejs openssh-client  && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

RUN npm install --global --ignore-scripts @axe-core/cli

CMD [axe]