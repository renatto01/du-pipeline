#!/bin/bash

# Installation
python3 -m venv ./venv
source ./venv/bin/activate
pip install -U pip
pip install kolla-ansible
pip install 'ansible-core>=2.13,<=2.14.2'
pip install 'ansible>=6,<8'

# To use the virtual environment
#source ./venv/bin/activate
#kolla-ansible --help

# To deactivate the environment when necessary
#deactivate