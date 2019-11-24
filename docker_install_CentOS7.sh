#!/bin/bash
#
# Script Install Docker-ce e Compose no CentOS7
# Autor: Janduy Euclides
# Data: 26/10/2019
#
#
echo ""
echo "INSTALL PACKAGES"
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sleep 1
echo ""
echo "INSTALL DOCKER-CE"
yum install -y docker-ce
usermod -aG docker $(whoami)
echo "ATIVANDO SERVICO ON BOOT"
systemctl enable docker.service
systemctl start docker.service
echo "STATUS DO SERVICO"
systemctl status docker.service
sleep 2
echo "INSTALL DOCKER-COMPOSE"
yum install -y epel-release
yum install -y python-pip
pip install docker-compose
pip install --upgrade pip
yum -y upgrade python*
echo "DOCKER-COMPOSE VERSION"
docker-compose version
echo "DOCKER-CE VERSION"
docker version
echo "Instalacao Finalizada!"