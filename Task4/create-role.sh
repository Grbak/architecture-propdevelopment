#!/bin/bash

ROLE_NAME=$1

# Применяем манифест для создания роли
kubectl apply -f "./manifests/role/${ROLE_NAME}.yaml"

if [[ $? -eq 0 ]]; then
  echo "Роль '${ROLE_NAME}' успешно создана."
else
  echo "Ошибка при создании роли."
fi
