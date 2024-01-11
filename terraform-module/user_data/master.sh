#!/bin/bash
sudo apt-get update -y

sudo apt-get install -y \
 apt-transport-https \
 ca-certificates \
 curl \
 gnupg-agent \
 software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
 "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

sudo apt-get update -y

sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo mkdir -p /etc/systemd/system/docker.service.d
sudo cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ]
}
EOF

sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo swapoff -a
sudo apt-get update -y 
sudo service docker start

sudo apt-get update -y 
sudo service docker start
sudo swapoff –a


sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update -y
sudo apt-get install -y  kubeadm=1.23.5-00 --allow-downgrades --allow-change-held-packages
sudo apt-mark hold kubeadm
sudo apt-get update -y
sudo apt-get install -y kubelet=1.23.5-00  kubectl=1.23.5-00 --allow-downgrades --allow-change-held-packages
sudo apt-mark hold kubelet kubectl
sudo apt-get update -y
sudo systemctl daemon-reload
sudo systemctl enable docker
sudo systemctl restart docker
sudo rm -rf /etc/docker/key.json
sudo systemctl enable kubelet
sudo systemctl restart kubelet
sudo hostnamectl set-hostname master
sudo apt-get update -y
sudo kubeadm init 
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml 

sudo su 
sudo curl -s https://falco.org/repo/falcosecurity-3672BA8F.asc | apt-key add -
sudo echo "deb https://download.falco.org/packages/deb stable main" | tee -a /etc/apt/sources.list.d/falcosecurity.list
sudo apt-get update -y
sudo apt-get -y install linux-headers-$(uname -r)
sudo apt-get install -y falco



# ##### THIS BELOW IS FOR KUBERNETES CLUSTER ON-PREM

# sudo apt-get update -y

# sudo apt-get install -y \
#  apt-transport-https \
#  ca-certificates \
#  curl \
#  gnupg-agent \
#  software-properties-common

# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# sudo add-apt-repository \
#  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) \
#   stable"

# sudo apt-get update -y

# sudo apt-get install docker-ce docker-ce-cli containerd.io -y
# sudo mkdir -p /etc/systemd/system/docker.service.d
# sudo cat <<EOF | sudo tee /etc/docker/daemon.json
# {
#   "exec-opts": ["native.cgroupdriver=systemd"],
#   "log-driver": "json-file",
#   "log-opts": {
#     "max-size": "100m"
#   },
#   "storage-driver": "overlay2",
#   "storage-opts": [
#     "overlay2.override_kernel_check=true"
#   ]
# }
# EOF

# sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
# sudo swapoff -a
# sudo apt-get update -y 
# sudo service docker start 

# sudo apt-get install -y apt-transport-https ca-certificates curl
# sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
# echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
# sudo apt-get update -y
# sudo apt-get install -y  kubeadm=1.23.5-00
# sudo apt-mark hold kubeadm
# sudo apt-get update -y
# sudo apt-get install -y kubelet=1.23.5-00  kubectl=1.23.5-00 --allow-downgrades
# sudo apt-mark hold kubelet kubectl
# sudo systemctl enable kubeadm
# sudo apt-get update -y
# sudo systemctl daemon-reload
# sudo systemctl enable docker
# sudo systemctl restart docker
# sudo rm -rf /etc/docker/key.json
# sudo systemctl enable kubelet
# sudo systemctl restart kubelet
# sudo hostnamectl set-hostname master # On worker node change master to node01
# sudo apt-get update -y
# sudo kubeadm init 

# sudo mkdir -p $HOME/.kube
# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# sudo chown $(id -u):$(id -g) $HOME/.kube/config
# #kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml 

# # sudo kubeadm token create  --print-join-command > kube.conf

# sudo apt-get update -y
