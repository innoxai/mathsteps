FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install -y git curl sudo python3 python3-pip graphviz-dev

# install node18
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
RUN apt install -y nodejs

RUN pip install sympy numpy scipy

RUN adduser --disabled-password --gecos '' developer && mkdir -p /etc/sudoers.d \
    && echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer \
    && chmod 0440 /etc/sudoers.d/developer
USER developer
COPY gitconfig /home/developer/.gitconfig
WORKDIR /home/developer/app

CMD ['/bin/bash']
