#!/bin/bash
# 1. Запускаем Terraform для создания инфраструктуры
echo "Running Terraform..."
cd terraform || exit
terraform init
terraform apply -auto-approve || { echo "Terraform apply failed"; exit 1; }
# 2. Получаем IP-адрес из Terraform
INSTANCE_IP=$(terraform output -json | jq -r '.instance_public_ip.value')
echo "Instance IP: ${INSTANCE_IP}"
cd ..
# 3. Делаем паузу 10 секунд 
sleep 10
# 4. Запускаем Ansible
cd ansible || exit
echo "Running Ansible..."
ansible-playbook restream.yml \
  -i "${INSTANCE_IP}," \
  -e "@ansible_vars.yml"
echo "Done! Go to http://${INSTANCE_IP}:8080/ui to the stream"
exit 0