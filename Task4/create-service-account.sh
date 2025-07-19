#!/bin/bash

SERVICE_ACCOUNT_NAME=$1

# Применяем манифест для создания сервисного аккаунта
kubectl apply -f "./manifests/service-account/${SERVICE_ACCOUNT_NAME}.yaml"

if [[ $? -eq 0 ]]; then
  echo "Сервисный аккаунт '${SERVICE_ACCOUNT_NAME}' успешно создан."
else
  echo "Ошибка при создании сервисного аккаунта."
fi
