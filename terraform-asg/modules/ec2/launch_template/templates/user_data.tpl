#!/bin/bash

until ping -c1 www.google.com &>/dev/null; do :; done

sudo apt update -y

sudo apt-get install -y software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible

