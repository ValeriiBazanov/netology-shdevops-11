# Задание 1

[Манифест frontend](./src/frontend.yaml)

[Манифест backend](./src/backend.yaml)

[Манифест service frontend](./src/frontend-svc.yaml)

[Манифест service backend](./src/backend-svc.yaml)

1. Выполнить манифесты и проверить созданные объекты.

```
kubectl apply -f frontend.yaml
kubectl apply -f backend.yaml
kubectl apply -f frontend-svc.yaml
kubectl apply -f backend-svc.yaml
kubectl get deployment
kubectl get replicaset
kubectl get pod
kubectl get service
```

<image src="task-1-1.png">

2. Подключимся к одной из pod frontend и выполним curl к service backend-svc

```
kubectl exec frontend-dc559fcc4-6nzcp -- curl backend-svc:8080
```

<image src="task-1-2.png">

3. Подключимся к pod backend и выполним curl к service frontend-svc

```
kubectl exec backend-9bb96bd8d-j7dwg -- curl frontend-svc:80
```

<image src="task-1-3.png">

# Задание 2

[Манифест ingress](./src/ingress.yaml)

1. Включить Ingress контроллер в microk8s

```
microk8s enable ingress
```

<image src="task-2-1.png">

2. Выполнить манифест ingress

```
kubectl apply -f ingress.yaml
kubectl describe ingress
```

<image src="task-2-2.png">

3. В браузере зайти по адресу http://158.160.175.240

<image src="task-2-3.png">


4. В браузере зайти по адресу http://158.160.175.240/api

<image src="task-2-4.png">