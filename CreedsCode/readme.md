put in files the ssh keys

'terraform apply -var-file /files/vars.txt -var "pvt_key=files/stream_rsa" -var "pub_key=files/stream_rsa.pub"
'

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '188.166.167.23' --private-key files/stream_rsa -e 'pub_key=fules/stream_rsa.pub' main.yml