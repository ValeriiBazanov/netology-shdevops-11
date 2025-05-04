# Задание 1


1. Проверяем версию helm

```
helm version
```

<image src="task-1-1.png">

2. Создаем чарт

```
helm create nginx-chart
```

<image src="task-1-2.png">

3. Проверяем корректность описания шаблона

```
helm template nginx-chart .
```

<image src="task-1-3.png">

4. Накатываем чарт

```
helm install nginx-v1 .
```

<image src="task-1-4.png">


# Задание 2


1. Создаем неймспейсы

```
kubectl create namespace app1
kubectl create namespace app2
```

<image src="task-2-1.png">

2. Накатываем чатры в разные неймспейсы и проверяем поды

```
helm install nginx-task2-v1 . --namespace app1 --set image.tag=1.21.0
helm install nginx-task2-v2 . --namespace app1 --set image.tag=1.21.1
helm install nginx-task2-v3 . --namespace app2 --set image.tag=1.21.0
kubectl get pods -n app1
kubectl get pods -n app2
```

<image src="task-2-2.png">

