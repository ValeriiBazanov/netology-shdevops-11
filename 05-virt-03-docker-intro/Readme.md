# Задача 1
https://hub.docker.com/valeriibazanov/custom-nginx/general
https://hub.docker.com/repository/docker/valeriibazanov/custom-nginx/general

# Задача 2
<image src="task2.jpg" alt="Задача 2">

# Задача 3
<image src="task3_1.jpg" alt="Задача 3">
<image src="task3_2.jpg" alt="Задача 3">
<image src="task3_3.jpg" alt="Задача 3">
<image src="task3_4.jpg" alt="Задача 3">

# Задача 4
<image src="task4.jpg" alt="Задача 4">

# Задача 5
<image src="task5_1.jpg" alt="Задача 5">
<image src="task5_2.jpg" alt="Задача 5">
<image src="task5_3.jpg" alt="Задача 5">
<image src="task5_4.jpg" alt="Задача 5">
<image src="task5_5.jpg" alt="Задача 5">
<image src="task5_6.jpg" alt="Задача 5">
<image src="task5_7.jpg" alt="Задача 5">

compose.yaml
```
version: "3"
include:
  - docker-compose.yaml
services:
  portainer:
    image: portainer/portainer-ce:latest
    network_mode: host
    ports:
      - "9000:9000"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```
