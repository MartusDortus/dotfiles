#  v0.1
#    -  Vyrobeny skript
#
#  TODO
#  -  Aby po sobe skript uklidil

#!/bin/bash

apt install ansible curl -y

WORKING_DIR=~/novy-virtual

curl -L martus.cz/soubory/ansible/inventory.yml -o $WOKRING_DIR/inventory.yml
curl -L martus.cz/soubory/ansible/vim.yml -o $WORKING_DIR/vim.yml
curl -L martus.cz/soubory/ansible/vimrc.txt -o $WORKING_DIR/srcfiles/.vimrc
curl -L martus.cz/soubory/ansible/bashrc.txt -o $WORKING_DIR/srcfiles/.bashrc

cd $WORKING_DIR
ansible-playbook -i inventory.yml vim.yml
