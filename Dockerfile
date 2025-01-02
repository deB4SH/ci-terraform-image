FROM debian:bookworm-slim
MAINTAINER deb4sh @ github
#install required packages
RUN apt update \
    && apt install -y curl wget unzip gpg git

#install terraform
RUN wget -O terraform_1.7.2_linux_amd64.zip https://releases.hashicorp.com/terraform/1.7.2/terraform_1.7.2_linux_amd64.zip \
    && unzip terraform_1.7.2_linux_amd64.zip \
    && mv terraform /usr/local/bin \
    && terraform --version

#install bitwarden cli
RUN wget -O bw-linux-2024.1.0.zip https://github.com/bitwarden/clients/releases/download/cli-v2024.1.0/bw-linux-2024.1.0.zip \
    && unzip bw-linux-2024.1.0.zip \
    && mv bw /usr/local/bin

#clean up leftovers
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*