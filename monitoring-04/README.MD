# Задание 1

При обращении к https://sentry.io получаю 403 ошибку. 

<image src="task-1-1.png">

Так как VPN использовать не хочу решил установить sentry на виртуальную машину по инструкции https://develop.sentry.dev/self-hosted/ .
Единственное добавил настройку system.url-prefix: "http://${ip сервера}:9000" так как без нее не получалось подключиться к web интерфейсу.

Sentry self-hosted

<image src="task-1-2.png">


# Задание 2

Сгенерированное событие

<image src="task-2-1.png">

Событие в списке

<image src="task-2-2.png">

Событие в статусе Resolved

<image src="task-2-3.png">


# Задание 3

Alert настроен

<image src="task-3-1.png">

<image src="task-3-2.png">

Email указан в настройках

<image src="task-3-3.png">

Но письма не отправляются так как не настроен smtp сервер

<image src="task-3-4.png">