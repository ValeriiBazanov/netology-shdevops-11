# Задание 1

[Манифест deployment](./src/deployment.yaml)

[Манифест policy](./src/policy.yaml)

1. Устанавливаем сетевой плагин calico

<image src="task-1-1.png">

<image src="task-1-2.png">

2. Создаем namespace app

```
kubectl create namespace app
```

<image src="task-1-3.png">

3. Выполняем манифест deployment.yaml и проверяем созданные объекты

```
kubectl apply -f deployment.yaml
kubectl get pod -n app
kubectl get services -n app
```

<image src="task-1-4.png">


4. Выполняем манифест с сетевыми политиками policy.yaml

```
kubectl apply -f policy.yaml -n app
kubectl get networkpolicy -n app
```

<image src="task-1-5.png">

5. Проверяем доступы согласно установленным политикам

Доступ есть:
```
kubectl exec frontend-8649fc8f66-xnc8f -n app -- curl backend
kubectl exec backend-558b46b666-2rgtd -n app -- curl cache
```

<image src="task-1-6.png">

Доступа нет:
```
kubectl exec frontend-8649fc8f66-xnc8f -n app -- curl -m 10 cache
kubectl exec backend-558b46b666-2rgtd -n app -- curl -m 10 frontend
kubectl exec cache-854d4c7556-gjlcv -n app -- curl -m 10 frontend
kubectl exec cache-854d4c7556-gjlcv -n app -- curl -m 10 backend
```

<image src="task-1-7.png">