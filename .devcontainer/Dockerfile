# Base image with common Linux tools
FROM ubuntu:22.04

# Install base dependencies
RUN apt-get update && \
    apt-get install -y \
      unzip \
      curl \
      sudo \
      python3 \
      python3-pip \
      git \
      zip \
      gnupg \
      lsb-release && \
    rm -rf /var/lib/apt/lists/*

# -------- Install AWS CLI v2 --------
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && sudo ./aws/install && \
    rm -rf awscliv2.zip aws

# -------- Install AWS SAM CLI --------
RUN pip3 install aws-sam-cli

# -------- Install Terraform --------
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && apt-get install -y terraform && \
    rm -rf /var/lib/apt/lists/*
