Запуск  `molecule test -s ubuntu_xenial`

<image src="m-1.png">

`molecule init scenario --driver-name docker`

<image src="m-2.png">

[Лог запуска molecule](./molecule.log)

Ссылка на тег с добавлением тестов - https://github.com/ValeriiBazanov/vector-role/releases/tag/1.0.1

docker run --privileged=True -v /home/t1/learning/vector-role:/opt/vector-role -w /opt/vector-role -it aragast/netology:latest /bin/bash

[Лог запуска tox](./tox.log)

Ссылка на тег с добавлением tox - https://github.com/ValeriiBazanov/vector-role/tree/1.0.2
