#!/bin/bash
#  v0.1
#    -  Vyrobeny skript
#  v0.2
#    - Neni to uz zavisle pouze na debianu
#    - Je potreba balicky curl, ansible
#
#  TODO
#  -  Aby po sobe skript uklidil
#  -  Aby tento skript nakonec nebyl potreba, ale vsechno delal ansible

#  Nastaveni promennych
WORKING_DIR=./
mkdir -p ${WORKING_DIR}srcfiles

#  Moje dotfiles
#  Stahovat drive, nez zapocne snaha o Ansible, takze dotfiles budou, ikdyby neco selhalo.
curl -L https://raw.githubusercontent.com/MartusDortus/dotfiles/refs/heads/master/.bashrc -o $WORKING_DIR/srcfiles/.bashrc
curl -L https://raw.githubusercontent.com/MartusDortus/dotfiles/refs/heads/master/.vimrc -o $WORKING_DIR/srcfiles/.vimrc

##  Konfigurace pro Ansible
curl -L https://raw.githubusercontent.com/MartusDortus/dotfiles/refs/heads/master/inventory.yml -o $WOKRING_DIR/inventory.yml
curl -L https://raw.githubusercontent.com/MartusDortus/dotfiles/refs/heads/master/vim.yml -o $WORKING_DIR/vim.yml

##  Spusteni Ansible
cd $WORKING_DIR
ansible-playbook -i inventory.yml vim.yml
