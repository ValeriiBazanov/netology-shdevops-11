# Задание 1

[Манифест deployment](./task-1/deployment.yaml)

[Манифест service](./task-1/service.yaml)

1. Выполняем манифест и проверим созданный deployment.

```
kubectl apply -f deployment.yaml
kubectl get deployment
kubectl get replicaset
kubectl get pod
```

<image src="task-1-1.png">

2. Создаем service и проверяем корректность создания.

```
kubectl apply -f service.yaml
kubectl get service
```

<image src="task-1-2.png">

3. Создаем отдельную pod с multitool и проверяем наличие доступа к service nginx и multitool

```
kubectl run multitool --image=wbitt/network-multitool --restart=Never
kubectl get pod
kubectl exec -it multitool -- curl nginx-svc:9001
kubectl exec -it multitool -- curl nginx-svc:9002
```

<image src="task-1-3.png">

# Задание 2

[Манифест service](./task-2/nodeport_service.yaml)

1. Создаем service и проверяем корректность создания.

```
kubectl apply -f nodeport_service.yaml
kubectl get service
```

<image src="task-2-1.png">

2. Обращаемся из браузера к сервису

```
http://51.250.39.78:30510/
```

<image src="task-2-2.png">