## Official Page
https://kubernetes.github.io/ingress-nginx/deploy/#using-helm

## Method 1 -Install Nginx-ingress controller using bash
```
wget https://raw.githubusercontent.com/andromeda9096/Kubernetes/main/3-Nginx-ingress-controller/intsall-nginx-ingress.sh && sudo chmod +x ./intsall-nginx-ingress.sh && ./intsall-nginx-ingress.sh
```


## Method 2 -Install Nginx-ingress controller using Helm manually
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
```

```
kubectl create ns nginx-ingress
helm install my-nginx-controller -n nginx-ingress ingress-nginx/ingress-nginx -f nginx-controller.yaml
```


#### Modified values in nginx-controller.yaml

-   hostNetwork: true
-   hostPort:
    enabled: true
    ports:
      http: 80
      https: 443
-   kind: DaemonSet

(on baremetal:ClusterIP, using Cloud: LoadBalancer)
-   type: ClusterIP



## Create ingress for app (change config in ghost-demo-ingress.yaml for your cluster)

```
kubectl apply -f ghost-demo-ingress.yaml
```
