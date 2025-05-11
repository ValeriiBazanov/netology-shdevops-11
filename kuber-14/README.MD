# Задание 1

Учитывая ограниченность ресурсов и невозможность масштабирования, оптимальным выбором становится стратегия Rolling Update. Вот почему:

- Меньшая нагрузка на ресурсы: Rolling Update требует лишь резервирование небольшого количества мощности (~20%), что соответствует имеющимся условиям.
- Нулевое влияние на доступность: Приложение продолжает обслуживать клиентов во время поэтапного обновления каждого узла.
- Простота реализации: Эта стратегия достаточно проста в исполнении и не требует значительных изменений в инфраструктуре.
- Откат назад возможен: Если возникают проблемы, можно остановить процесс обновления и вернуться к предыдущей рабочей версии.

Таким образом, используя стратегию Rolling Update, мы можем эффективно провести обновление, минимизируя риски и издержки.

# Задание 2

[Манифест deployment исходной версией](./src/deployment_19.yaml)

[Манифест service](./src/svc.yaml)

[Манифест deployment с версией, которая успешно обновится](./src/deployment_20.yaml)

[Манифест deployment с версией, которая упадет при установке](./src/deployment_28.yaml)


1. Выполним манифест с версией nginx 1.19, сервисом и проверим созданные объекты

```
kubectl apply -f deployment_19.yaml
kubectl apply -f svc.yaml
kubectl get pod
kubectl get service
```

<image src="task-2-1.png">

2. Выполним манифест с версией nginx 1.20 и проверим успешное обновление

```
kubectl apply -f deployment_20.yaml
kubectl get pod
kubectl describe deployment nginx
```

<image src="task-2-2.png">

[Вывод команды describe после успешного обновления](./describe_20.log)


3. Выполним манифест с версией nginx 1.30 (1.28 успешно устанавливается) и проверим что обновление неуспешное

```
kubectl apply -f deployment_28.yaml
kubectl get pod
kubectl describe deployment nginx
```

<image src="task-2-3.png">

[Вывод команды describe после ошибки обновления](./describe_30.log)


4. Откатимся к предыдущей версии

```
kubectl rollout undo deployment nginx
kubectl get pod
kubectl describe deployment nginx
```
<image src="task-2-4.png">

[Вывод команды describe после отката](./describe_rollout.log)