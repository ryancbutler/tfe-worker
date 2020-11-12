# This Dockerfile builds the image used for the worker containers.
FROM ubuntu:xenial

# Install software used by Terraform Enterprise.
RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo unzip daemontools git-core awscli ssh wget curl psmisc iproute2 openssh-client redis-tools netcat-openbsd ca-certificates

# Install extra software used by Terraform Enterprise.
RUN apt-get install -y --no-install-recommends \
    jq python3-pip python3-setuptools

#Install Ansible Tower CLI
RUN pip3 install ansible-tower-cli

# Update the CA certificates bundle to include newly added CA certificates.
#RUN update-ca-certificates

# Install latest Azure CLI
RUN curl -skL https://aka.ms/InstallAzureCLIDeb | bash

#Install AZCopy
RUN wget https://aka.ms/downloadazcopy-v10-linux && \
    tar -xvf downloadazcopy-v10-linux && \
    mv ./azcopy_linux_amd64_*/azcopy /usr/bin/ && \
    rm downloadazcopy-v10-linux && \
    rm -rf ./azcopy_linux_amd64_*
