# Задание 1

1. Создаем манифест pod
[Манфест pod](./task-1/my-pod.yaml)

2. В директории с созданным манифестом выполняем команду apply

```
kubectl apply -f my-pod.yaml
```

<image src="task-1-1.png">

3. Проверим созданную pod

```
kubectl get pods
```

<image src="task-1-2.png">

4. Подключаемся к pod через port-forward 

```
kubectl port-forward pod/my-pod 9090:8080
```

<image src="task-1-3.png">

5. Обращаемся к pod при помощи curl

```
curl localhost:9090
```

<image src="task-1-4.png">


# Задание 2

1. Создаем манифест pod netology-web
[Манфест netology-web](./task-2/netology-web.yaml)

2. Создаем манифест service netology-svc
[Манфест netology-svc](./task-2/netology-svc.yaml)

3. Исполняем манифесты

```
kubectl apply -f netology-web.yaml
kubectl apply -f netology-svc.yaml
```

<image src="task-2-1.png">

4. Проверим созданную pod netology-web

```
kubectl get pods
```

<image src="task-2-2.png">

4. Проверим созданный service netology-svc

```
kubectl get services
```

<image src="task-2-3.png">

5. Подключимся к service netology-svc при помощи port-forward

```
kubectl port-forward service/netology-svc 9091:80
```

<image src="task-2-4.png">

6. Обращаемся к service netology-svc при помощи curl

```
curl localhost:9091
```

<image src="task-2-5.png">