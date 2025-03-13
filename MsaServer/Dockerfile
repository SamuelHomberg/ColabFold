# get base image
FROM ubuntu:latest

# install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    tar \
    git \ 
    vim \ 
    && rm -rf /var/lib/apt/lists/*

# install go
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.24.1.linux-amd64.tar.gz 
ENV PATH="$PATH:/usr/local/go/bin"

# download colabfold fork
RUN git clone https://github.com/SamuelHomberg/ColabFold.git \
    && mv /ColabFold/MsaServer /MsaServer \
    && rm -rf /ColabFold

WORKDIR /MsaServer

# build the msa-server
RUN ./setup-no-databases.sh

# entrypoint?
ENTRYPOINT ["start-local.sh", "config.json"]

