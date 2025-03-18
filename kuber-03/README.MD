# Задание 1

[Манифест deployment](./task-1/deployment.yaml)

[Манифест service](./task-1/service.yaml)

1. Выполняем манифест и проверим созданный deployment и pod.

```
kubectl apply -f deployment.yaml
kubectl get deployment
kubectl get pods
```

<image src="task-1-1.png">

2. Увеличиваем в deployment replicas до 2, выполняем изменения и проверяем количество pod после изменения.

```
kubectl apply -f deployment.yaml
kubectl get pods
```

<image src="task-1-2.png">

3. Создаем service и проверяем корректность создания.

```
kubectl apply -f service.yaml
kubectl get services
```

<image src="task-1-3.png">

4. Создаем отдельную pod с multitool и проверяем наличие доступа к service nginx-svc

```
kubectl run multitool --image=wbitt/network-multitool --restart=Never
kubectl get pods
kubectl exec -it multitool -- curl nginx-svc
```

<image src="task-1-4.png">

# Задание 2

[Манифест deployment](./task-2/deployment.yaml)

[Манифест service](./task-2/service.yaml)

1. Выполняем манифест deployment и проверяем что pod в статусе Init

```
kubectl apply -f deployment.yaml
kubectl get deployments
kubectl get replicaset
kubectl get pods
```

<image src="task-2-1.png">

2. Выполняем манифест service и проверяем что pod в статусе Running

```
kubectl apply -f service.yaml
kubectl get service
kubectl get deployment
kubectl get replicaset
kubectl get pods
```

<image src="task-2-2.png">