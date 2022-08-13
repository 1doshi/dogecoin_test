export DOCKER_BUILDKIT=1
# syntax=docker/dockerfile:1.0.0-experimental

FROM Linux Ubuntu

RUN apr-get update
RUN apt-get install -y git

RUN mkdir -m 700 /root/.ssh
    touch -m 600 /root/.ssh/known_hosts
    ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN --mount=type=ssh,id=github git clone git@github.com:dogecoin/dogecoin.git
