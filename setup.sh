#!/bin/bash
#  v0.1
#    -  Vyrobeny skript
#
#  TODO
#  -  Aby po sobe skript uklidil
#  -  Aby tento skript nakonec nebyl potreba, ale vsechno delal ansible

#  Nastaveni promennych
WORKING_DIR=~/novy-virtual
mkdir -p $WORKING_DIR/srcfiles

apt-get update && apt-get upgrade -y

apt-get install curl -y

#  Moje dotfiles
#  Stahovat drive, nez zapocne snaha o Ansible, takze dotfiles budou, ikdyby neco selhalo.
curl -L https://raw.githubusercontent.com/MartusDortus/dotfiles/refs/heads/master/.bashrc -o $WORKING_DIR/srcfiles/.bashrc
curl -L https://raw.githubusercontent.com/MartusDortus/dotfiles/refs/heads/master/.vimrc -o $WORKING_DIR/srcfiles/.vimrc

#  Ansible
apt-get install ansible -y

##  Konfigurace pro Ansible
curl -L https://raw.githubusercontent.com/MartusDortus/dotfiles/refs/heads/master/inventory.yml -o $WOKRING_DIR/inventory.yml
curl -L https://raw.githubusercontent.com/MartusDortus/dotfiles/refs/heads/master/vim.yml -o $WORKING_DIR/vim.yml

##  Spusteni Ansible
cd $WORKING_DIR
ansible-playbook -i inventory.yml vim.yml
