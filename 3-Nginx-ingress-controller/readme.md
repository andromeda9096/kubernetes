## Official Page
https://kubernetes.github.io/ingress-nginx/deploy/#using-helm

## Install Nginx-ingress controller using Helm
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
-   type: ClusterIP

## Create ingress for app (change config in ghost-demo-ingress.yaml for your cluster)

```
kubectl apply -f ghost-demo-ingress.yaml
```
