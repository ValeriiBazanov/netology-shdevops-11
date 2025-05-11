[Манифест deployment исходной версии](./task.yaml)

1. Пытаемся выполнить манифест и получаем ошибку что отсутсвуют namespace web и data

```
kubectl apply -f task.yaml
```

<image src="task-1-1.png">

2. Создаем необходимые namespace

```
kubectl create namespace web
kubectl create namespace data
```

<image src="task-1-2.png">

3. Пытаемся повторно выполнить манифест и проверям созданные объекты

```
kubectl apply -f task.yaml
kubectl get pod -n web
kubectl get pod -n data
kubectl get service -n data
```

<image src="task-1-3.png">


4. Проверяем логи поды web-consumer и видим что не удается достучаться до auth-db. 
Проблема в том, что auth-db находится в namespace data, а web-consumer в web. 

```
kubectl logs web-consumer-5f5b45b976-74kfr -n web
```

<image src="task-1-4.png">

5. Дорабатываем манифест. К do curl auth-db добавляем namespace data. Выполняем его и проверяем созданную поду.

[Манифест deployment исправленой версии](./task_fix.yaml)

```
kubectl apply -f task_fix.yaml
kubectl get pod -n web
kubectl get pod -n data
kubectl logs web-consumer-6bfc7dcb7d-2bpkb -n web
kubectl logs auth-db-fb7c59b7f-85kzw -n data
```

<image src="task-1-5.png">

<image src="task-1-6.png">
