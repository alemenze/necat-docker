FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    tar \
    perl \
    python3 \
    python3-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt/necat

# Download and install NECAT binaries
RUN wget https://github.com/xiaochuanle/NECAT/releases/download/v0.0.1_update20200803/necat_20200803_Linux-amd64.tar.gz && \
    tar xzvf necat_20200803_Linux-amd64.tar.gz && \
    rm necat_20200803_Linux-amd64.tar.gz && \
    sed -i '2i use experimental "smartmatch";' /opt/necat/NECAT/Linux-amd64/bin/Plgd/Project.pm

# Set PATH to NECAT binaries
ENV PATH="/opt/necat/NECAT/Linux-amd64/bin:${PATH}"

# Default to bash
CMD ["/bin/bash"]