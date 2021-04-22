#!/bin/sh
rm -rf ./tmp
mkdir -p ./tmp
echo '[⚙️] STARTING TERRAFORM'
terraform apply -var-file files/vars.txt
echo '[✅] TERRAFORM DONE'
terraform output -raw droplet_ip >> ./tmp/ip_address

echo '[🔥] STARTING ANSIBLE'
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i ./tmp/ip_address --private-key ./files/stream_rsa main.yml
echo '[✨] ANSIBLE DONE DONE'

echo '[🚀] FINISHED'
rm -rf ./tmp