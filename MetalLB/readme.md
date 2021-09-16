## Official Page
https://metallb.universe.tf/installation/

# Install Metallb LoadBalancer Version 0.10.2 on Baremetal

### 1-Using kubectl
```
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.10.2/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.10.2/manifests/metallb.yaml
```

### 2-Install Config IP range (change your IP in metallbconfig.yaml)
```
kubectl apply -f metallbconfig.yaml
```
