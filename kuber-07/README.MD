# Задание 1

[Манифест deployment](./task-1/deployment.yaml)

[Манифест pv](./task-1/pv.yaml)

[Манифест pvc](./task-1/pvc.yaml)

1. Выполняем манифест и проверим созданный deployment.

```
kubectl apply -f deployment.yaml
kubectl get deployment
kubectl get replicaset
kubectl get pod
```

<image src="task-1-1.png">

2. Выполняем манифест PersistentVolume и проверим созданный объект.

```
kubectl apply -f pv.yaml
kubectl get pv
```

<image src="task-1-2.png">

3. Выполняем манифест PersistentVolumeClaim и проверим созданный объект.

```
kubectl apply -f pvc.yaml
kubectl get pvc
```

<image src="task-1-3.png">

4. Из контейнера multitool проверим содержимое файла.

```
kubectl exec -it log-writer-6cd4d8d8cc-mr7m9 --container multitool -- tail -n 10 /input/output.txt
```

<image src="task-1-4.png">

5. Удалим deployment и pvc.

После удаления PVC статус PV изменяется на Released. Данный PV будет недоступен для новых PVC, так как содержит данные предыдущего PVC.

```
kubectl delete deployment log-writer
kubectl delete pvc pvc-1
kubectl get deployment
kubectl get pvc
kubectl get pv
```

<image src="task-1-5.png">


6. Перед удалением PV проверим наличие файла в директории /data1/pv1.

```
ls /data1/pv1
```

<image src="task-1-6.png">

7. Удалим ранее созданный PV.

```
kubectl delete pv pv-1
kubectl get pv
```

<image src="task-1-7.png">

8. После удаления PV проверим наличие файла в директории /data1/pv1.

Политика Reclaim Policy: Retain говорит, что после удаления PV ресурсы из внешних провайдеров автоматически не удаляются.

```
ls /data1/pv1
```

<image src="task-1-8.png">

# Задание 2

[Манифест deployment](./task-2/deployment.yaml)

[Манифест pvc](./task-2/pvc.yaml)

1. Включаем nfs

```
microk8s enable community
microk8s enable nfs
```

<image src="task-2-1.png">

2. Выполняем манифест deployment и PVC и проверяем созданные объекты.

```
kubectl apply -f deployment.yaml
kubectl apply -f pvc.yaml
kubectl get pvc
kubectl get deployment
kubectl get replicaset
kubectl get pod

```

<image src="task-2-2.png">

3. Подключаемся к контейнеру multitool, запишем и прочитаем файл.

```
kubectl exec -it deployment-nfs-59f6bfcdc-79887 --container multitool -- bash
echo "$(date +'%T %F')" >> /input/input.log
cat /input/input.log
```

<image src="task-2-3.png">