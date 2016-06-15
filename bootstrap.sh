#!/usr/bin/env bash

echo "Instalando dependências"
yum update
yum install -y curl
yum install -y wget
yum install -y git
yum install -y openssh
yum install -y java-1.8.0-openjdk-devel

echo "Criando aliases"
alias ll=`ls -la`

echo "export PATH=$PATH:/usr/bin/openshift-client" >> /home/vagrant/.bashrc

echo "Instalando docker"
curl -fsSL https://get.docker.com/ | sh
systemctl enable docker.service
systemctl start docker.service
sudo docker run hello-world

echo "Instalando docker-compose"
curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose
chmod +x /usr/bin/docker-compose

echo "Adicionando usuário vagrant ao grupo docker"
sudo usermod -aG docker vagrant

echo "Criando diretório para servir como repositório do maven"
mkdir /maven_repository
