FROM rundeck/rundeck:4.6.0 AS builder
FROM ubuntu:latest
USER root

RUN apt update && apt-get install curl wget software-properties-common lsb-core unzip git -y 
RUN DEBIAN_FRONTEND=noninteractive TZ=Europe/Madrid apt-get -y install tzdata
RUN apt update && curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"  && apt-get install -y terraform && add-apt-repository ppa:deadsnakes/ppa -y && apt-get install -y python3.9 && apt clean --dry-run && apt autoremove -y
#RUN add-apt-repository --yes --update ppa:ansible/ansible && apt-get update && apt install ansible
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN  python3 get-pip.py --user
RUN python3 -m pip -V
RUN python3 -m pip install --user ansible
WORKDIR /root
RUN ansible --version
