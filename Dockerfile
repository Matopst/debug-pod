# Dockerfile for Kubernetes Debug Pod
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    nc \
    curl \
    wget \
    iputils-ping \
    dnsutils \
    net-tools \
    iproute2 \
    vim \
    nano \
    less \
    jq \
    unzip \
    git \
    ca-certificates \
    gnupg \
    lsb-release \
    bash-completion \
    software-properties-common \
    telnet \
    netcat \
    tcpdump \
    traceroute \
    lsof \
    htop \
    strace \
    && rm -rf /var/lib/apt/lists/*

# Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# kubectl
RUN    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl

# ArgoCD CLI
RUN curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 && \
    chmod +x /usr/local/bin/argocd

# Helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Kustomize


CMD ["bash"]
