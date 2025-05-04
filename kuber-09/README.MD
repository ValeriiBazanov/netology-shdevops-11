# Задание 1

[Манифест role](./role.yaml)

[Манифест rolebinding](./rolebinding.yaml)

1. Создаем и подписываем сертификат

```
openssl genrsa -out vbazanov.key 2048
openssl req -new -key vbazanov.key -out vbazanov.csr -subj "/CN=vbazanov/O=group1"
openssl x509 -req -in vbazanov.csr -CA /var/snap/microk8s/current/certs/ca.crt -CAkey /var/snap/microk8s/current/certs/ca.key -CAcreateserial -out vbazanov.crt -days 500
```

<image src="task-1-1.png">

2. Настраиваем конфигурационный файл

```
kubectl config set-context vbazanov-context --cluster=microk8s-cluster --user=vbazanov
kubectl config view
```

<image src="task-1-2.png">

3. Создаем роль

```
kubectl apply -f role.yaml
kubectl apply -f rolebinding.yaml
```

<image src="task-1-3.png">