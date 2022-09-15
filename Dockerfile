FROM rundeck/rundeck:4.6.0 AS builder
FROM ubuntu:latest
USER root
RUN apt update && apt-get install wget software-properties-common lsb-core unzip git -y 
RUN apt update && curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"  && sudo apt-get install -y terraform && add-apt-repository ppa:deadsnakes/ppa -y && apt-get install -y python3.9 && apt clean --dry-run && apt autoremove -y
#RUN add-apt-repository --yes --update ppa:ansible/ansible && apt-get update && apt install ansible 
RUN python3 -m pip -V
RUN python3 -m pip install --user ansible
