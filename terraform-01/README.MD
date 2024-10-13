Версия terraform

<image src="terr-version.png" alt="Версия terraform">

# Задание 1
Random password

<image src="random-pass.png" alt="Random password">

## Пункты 4 и 5

```
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.result}"

  ports {
    internal = 80
    external = 9090
  }
}
```
<image src="docker-ps-1.png" alt="docker ps">

## Пункт 6
Вывод docker ps после замены имени контейнера
```
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "hello_world" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.result}"

  ports {
    internal = 80
    external = 9090
  }
}
```
<image src="docker-ps-2.png" alt="docker ps">

## Пункт 7

terraform.tfstate после выполнения команды terraform destroy
```
{
  "version": 4,
  "terraform_version": "1.8.5",
  "serial": 13,
  "lineage": "a20fb8f0-ce46-7fcd-1d1e-c9fbeae7040e",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```

## Пункт 8
Docker образ не был удален так как в блоке объявления ресурса параметр keep_locally=true.
<image src="keep-locally.png" alt="Keep locally">
https://docs.comcloud.xyz/providers/kreuzwerker/docker/latest/docs/resources/image#keep_locally
<image src="documentation.png" alt="Documentation">

# Задание 2

```
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  required_version = "~>1.8.4" /*Многострочный комментарий.
 Требуемая версия terraform */
}
provider "docker" {
  host     = "ssh://admin@51.250.34.240:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

#однострочный комментарий

resource "random_password" "random_string" {
  length      = 16
  special     = false
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
}


resource "docker_image" "mysql" {
  name         = "mysql:8"
  keep_locally = false
}

resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "example_mysql"
  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.random_string.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.random_string.result}",
    "MYSQL_ROOT_HOST=\"%\""
  ]
  ports {
    internal = 80
    external = 3306
    ip = "127.0.0.1"
  }
}
```
<image src="task-2.png" alt="Task 2">

