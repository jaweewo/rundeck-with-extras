FROM rundeck/rundeck:4.16.0
USER root
RUN apt update && apt-get install wget gettext software-properties-common lsb-core unzip git -y &&  apt update && curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && add-apt-repository --yes --update ppa:ansible/ansible && apt-get update && sudo apt-get install -y terraform ansible && add-apt-repository ppa:deadsnakes/ppa -y && apt-get install -y python3.7 python3-pip && apt clean --dry-run &&  apt purge -y linux-libc-dev && apt autoremove -y
RUN ansible --version
