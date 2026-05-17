### Настройка сетевых политик в кластере Kubernetes

Состоит из следующих шагов:

1. Запуск _minikube_ с _calico_ (без него сетевые политики в кластере работать не будут):
   `minikube start --cni=calico`

2. Создание нужных сервисов с нужными метками:
   `kubectl run front-end-app --image=nginx --labels role=front-end --expose --port 80`
   `kubectl run admin-front-end-app --image=nginx --labels role=admin-front-end --expose --port 80`
   `kubectl run back-end-api-app --image=nginx --labels role=back-end-api --expose --port 80`
   `kubectl run admin-back-end-api-app --image=nginx --labels role=admin-back-end-api --expose --port 80`

3. Применение сетевых политик:
   `kubectl apply -f allow-front-to-back.yaml`
   `kubectl apply -f allow-back-to-front.yaml`
   `kubectl apply -f allow-admin-front-to-admin-back.yaml`
   `kubectl apply -f allow-admin-back-to-admin-front.yaml`

4. Тестирование с помощью отправки запросов между подами. Пример выполнения запроса от пода с именем _front-end-app_ к поду _back-end-api-app_:
   `kubectl exec -it front-end-app -- curl 10.244.0.5:80`
   Информацию об ip-адресах подов для тестирования можно получить с помощью следующей команды:
   `kubectl get pods -o wide`
