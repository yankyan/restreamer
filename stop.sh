#!/bin/bash
# 1. Запускаем Terraform для создания инфраструктуры
echo "Running Terraform..."
cd terraform || exit
terraform init
terraform destroy -auto-approve || { echo "Terraform destroy failed"; exit 1; }