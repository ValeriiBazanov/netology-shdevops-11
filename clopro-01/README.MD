VPC

<image src="network.png">

Routing table

<image src="route-table.png">

Public subnet

<image src="public.png">

Private subnet

<image src="private.png">

NAT

<image src="nat.png">

Public VM

<image src="public-vm.png">

Private VM

<image src="private-vm.png">

Подключаемся к публичной машине и пингуем ya.ru

```
ssh -l ubuntu 158.160.59.31
ping ya.ru
```

<image src="ping-public.png">

Подключаемся к приватной машине и пингуем ya.ru

```
ssh ubuntu@192.168.20.5 -J ubuntu@158.160.59.31
ping ya.ru
```

<image src="ping-private.png">