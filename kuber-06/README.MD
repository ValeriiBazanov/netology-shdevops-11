# Задание 1

[Манифест deployment](./src/deployment.yaml)

1. Выполняем манифест и проверим созданный deployment.

```
kubectl apply -f deployment.yaml
kubectl get deployment
kubectl get replicaset
kubectl get pod
```

<image src="task-1-1.png">

2. Проверим содержимое файла из контейнера multitool

```
kubectl exec worker-55dfc77776-6wsh5 -c multitool  -- tail -n 10 /logs/app.log
```

<image src="task-1-2.png">

# Задание 2

[Манифест daemonset](./src/daemonset.yaml)

1. Выполняем манифест и проверим созданный daemonset.

```
kubectl apply -f daemonset.yaml
kubectl get daemonset
kubectl get pod
```

<image src="task-2-1.png">

2. Проверим содержимое файла /var/log/syslog

```
kubectl exec syslog-s2j52 -it -- tail -n 10 /var/log/syslog
```

<image src="task-2-2.png">