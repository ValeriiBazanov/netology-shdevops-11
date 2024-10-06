#!/bin/bash
cd /opt
git clone git@github.com:ValeriiBazanov/shvirtd-example-python.git /opt/shvirtd-example-python --config core.sshCommand="ssh -i ~/.ssh/id_rsa"
cd shvirtd-example-python
docker compose up -d