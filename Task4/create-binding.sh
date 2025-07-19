#!/bin/bash

BINDING_NAME=$1

# Применяем манифест для создания привязки
kubectl apply -f "./manifests/binding/${BINDING_NAME)}.yaml"

if [[ $? -eq 0 ]]; then
  echo "Привязка '${BINDING_NAME}' успешно создана."
else
  echo "Ошибка при создании привязки."
fi
