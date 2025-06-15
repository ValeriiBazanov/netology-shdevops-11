# Шифрование объекта бакета ключом KMS

<image src="task-1-1.png">

<image src="task-1-2.png">

# Создание group virtual machine

1. Выпустить сертификат

```
openssl req -newkey rsa:2048 -nodes -keyout domain.key -x509 -days 365 -out domain.crt
```

2. В Certificate Manager создать сертификат:

<image src="task-2-1.png">

3. Создать бакет и настроить его как веб-сайт

<image src="task-2-2.png">

4. На вкладке HTTPS в группе Безопасность выбрать созданный сертификат

<image src="task-2-3.png">

5. Станица открывается по адресу 

```
https://vbazanov-homework-website.website.yandexcloud.net/
```

<image src="task-2-4.png">