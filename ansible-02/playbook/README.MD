# Ansible Playbook for Installing Clickhouse and Vector

## Описание

Этот Ansible playbook предназначен для установки и настройки Clickhouse и Vector. 

## Инструкции по установке

1. **Подготовьте инвентори файл:**

Укажите целевые хосты для clickhouse и vector, добавив их в файл инвентори, `inventory/prod.yml`:
```yml
clickhouse:
  hosts:
    clickhouse:
      ansible_connection: 197.128.1.5
vector:
  hosts:
    vector:
      ansible_connection: 197.128.1.6
```


1. **Запуск playbook:**

   Выполните команду для запуска playbook:

```shell
   ansible-playbook -i inventory/prod.yml site.yml
```
   
## tasks

- **Установка Clickhouse:**
  - Скачивает необходимые пакеты.
  - Устанавливает их с помощью `yum`.
  - Создаёт базу данных `logs`.

- **Установка Vector:**
  - Загружает и запускает скрипт для добавления репозитория.
  - Устанавливает Vector из репозитория.
  - Создаёт и активирует systemd сервис для Vector.