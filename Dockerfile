FROM rundeck/rundeck:4.1.0
USER root
RUN apt update && apt-get install wget software-properties-common lsb-core unzip git -y &&  apt update
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN add-apt-repository --yes --update ppa:ansible/ansible
RUN apt-get update && sudo apt-get install -y terraform ansible
RUN apt clean --dry-run && apt autoremove -y