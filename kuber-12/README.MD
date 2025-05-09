# Задание 1

Способ установки - kubeadm

1. Создаем 5 виртуальных машин

<image src="task-1-1.png">

2. На каждом хосте устанавливаем необходимые компоненты

```
sudo apt-get update
```
```
sudo apt-get install -y apt-transport-https ca-certificates curl gpg
```
```
sudo mkdir -p -m 755 /etc/apt/keyrings
```
```
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
```
```
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
```
```
sudo apt-get update
```
```
sudo apt-get install -y kubelet kubeadm kubectl containerd
```
```
sudo apt-mark hold kubelet kubeadm kubectl containerd
```
```
sudo systemctl enable --now kubelet
```
```
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF
```
```
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF
```
```
sudo modprobe overlay
```
```
sudo modprobe br_netfilter
```
```
sudo swapoff -a
```
```
sudo sed -i 's|^/swap.img|#/swap.img|g' /etc/fstab
```
```
sudo sysctl --system
```

3. На master-ноде выполняем kubeadm init

```
sudo kubeadm init \
--control-plane-endpoint=10.0.1.29 \
--apiserver-advertise-address=10.0.1.29 \
--pod-network-cidr 10.244.0.0/16 \
--apiserver-cert-extra-sans=51.250.10.88
```
```
mkdir -p $HOME/.kube
```
```
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
```
```
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

<image src="task-1-2.png">

4. На каждой worker-ноде выполняем kubeadm join

```
sudo kubeadm join 10.0.1.29:6443 --token h7mo2d.zgjsg7osvd8gh8fi --discovery-token-ca-cert-hash sha256:c5bcbe2ebc96f6186786e77e294b3f2fe23d42914653bf1513d6fe4511101ba0
```

<image src="task-1-3.png">

<image src="task-1-4.png">

<image src="task-1-5.png">

<image src="task-1-6.png">

6. Устанавливаем сетевой плагин на master-ноде
   
```
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```

<image src="task-1-7.png">

7. Проверяем готовность кластера

```
kubectl get nodes
```

<image src="task-1-8.png">