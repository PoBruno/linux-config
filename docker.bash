#!/bin/bash

# Atualizar o Ubuntu
sudo apt update
sudo apt upgrade -y

# Criar o diretório ~/.oh-my-posh se ainda não existir
mkdir -p ~/.oh-my-posh

# Instalar unzip (necessário para a instalação do oh-my-posh)
sudo apt install -y unzip

# Instalar oh-my-posh
sudo apt install -y fonts-powerline
sudo curl -fsSL https://ohmyposh.dev/install.sh | bash -s -- -d ~/.oh-my-posh

# Instalar Docker Server
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Verificar se a instalação do Docker foi bem-sucedida
if ! [ -x "$(command -v docker)" ]; then
  echo 'Erro: Docker não foi instalado corretamente.' >&2
  exit 1
fi

# Instalar Docker Compose
sudo apt install -y docker-compose

# Instalar lsd via snap
sudo snap install lsd --classic


# Alias
echo 'alias l="lsd"' >> ~/.profile
echo 'alias ld="lsd"' >> ~/.profile
echo 'alias ls="lsd"' >> ~/.profile
echo 'alias docker-ps="docker ps --format '\''table {{.Names}}\t{{.Ports}}\t{{.Status}}'\''"' >> ~/.profile
echo 'alias docker-ps-command="docker ps --format '\''table {{.Names}}\t{{.Command}}'\'' --no-trunc"' >> ~/.profile

# Recarregar o shell para aplicar as configurações
source ~/.bashrc
echo 'eval "$(oh-my-posh init bash --config ~/.oh-my-posh/config.json)"' >> ~/.profile
echo "Script de configuração concluído."

# Wiki
eval "$(oh-my-posh init bash --config ~/amro.omp.json)"
eval "$(oh-my-posh init bash --config ~/.oh-my-posh/config.json)"
~/.bashrc
. ~/.profile
