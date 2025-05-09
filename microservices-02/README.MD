# Задание 1

Рассмотрим популярные решения для обеспечения реализации API Gateway:
- Nginx
- Kong
- TYK

AWS API Gateway и Yandex API Gateway не рассматриваем из-за ограничения использования в облаках определенных провайдеров.

| Метрика | Nginx | Kong | TYK |
|-|-|-|-|
| Маршрутизация запросов на основе конфигурации | + | + | + |
| Проверка аутентификации | Требует ручной настройки с дополнительными модулями | OAuth2, JWT, ключей API и другие плагинов | Встроенная поддержка OAuth2, JWT и др |
| Обеспечение терминации HTTPS | Полная поддержка SSL/TLS с настройкой через конфигурационные файлы | Поддержка SSL/TLS с возможностью управления сертификатами | Поддержка SSL/TLS и управление сертификатами |
| Лицензия | Open Source, коммерческие версии  | Open Source с платными Enterprise версиями | Open Source с платными версиями |

Выбор решения: Kong

- Kong предоставляет гибкую и мощную маршрутизацию запросов на основе конфигурации.
- Поддержка множества методов аутентификации, включая OAuth2, JWT и ключи API.
- Полностью поддерживает терминацию HTTPS с возможностью управления сертификатами SSL/TLS.
- Обладает высокой масштабируемостью благодаря кластеризации и обладает высокой производительностью.
- Широкий выбор плагинов и активное сообщество обеспечивают гибкость и возможность расширения.
- Интегрированные инструменты управления и мониторинга.
- Open Source версия Kong предоставляет все необходимые базовые функции без дополнительных затрат, а при необходимости можно перейти на Enterprise версию для получения расширенных возможностей и поддержки.

# Задание 2

Рассмотрим популярные брокеры сообщений:
- Apache Kafka
- RabbitMQ
- ActiveMQ

| Метрика | Kafka | RabbitMQ | ActiveMQ |
|-|-|-|-|
| Поддержка кластеризации | + | + | + |
| Хранение сообщений на диске | + | + | + |
| Высокая скорость работы | + | + | + |
| Поддержка различных форматов сообщений | + | + | + |
| Разделение прав доступа к различным потокам сообщений | + | + | + |
| Простота эксплуатации | - | + | + |

Выбор: Apache Kafka

- Имеет поддержку кластеризации.
- Хранит сообщения на диске и обеспечивает возможность восстановления сообщений.
- Спроектирован для обработки больших объемов данных с высокой производительностью.
- Поддерживает разнообразные форматы сообщений, включая JSON и Avro.
- Позволяет настраивать права доступа и разделение тем (topics) между пользователями, обеспечивая безопасность.

Хотя Kafka требует более сложную настройки по сравнению с другими брокерами, имеется множество ресурсов и документации по установке и настройке.

