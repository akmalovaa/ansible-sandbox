ARG PYTHON_VERSION=3.13.2
FROM python:$PYTHON_VERSION-slim

RUN apt update && \
    apt install -y --no-install-recommends \
    sshpass \
    jq \
    rsync \
    git \
    less \
    openssh-client

RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir ansible

# Install Ansible Collection for Docker
RUN ansible-galaxy collection install community.docker

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/cache/apt/archives/* /var/cache/apt/lists/* /tmp/* /root/cache/.

WORKDIR /srv

CMD ["ansible", "--version"]