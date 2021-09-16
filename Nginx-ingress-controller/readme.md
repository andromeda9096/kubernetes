## Official Page
https://kubernetes.github.io/ingress-nginx/deploy/#using-helm

#### if using GKE create role first:
```
kubectl create clusterrolebinding cluster-admin-binding \
--clusterrole cluster-admin \
--user $(gcloud config get-value account)
```

## Method 1 -Install Nginx-ingress controller using bash
```
wget https://raw.githubusercontent.com/andromeda9096/kubernetes/main/Nginx-ingress-controller/intsall-nginx-ingress.sh && sudo chmod +x ./intsall-nginx-ingress.sh && ./intsall-nginx-ingress.sh
```


## Method 2 -Install Nginx-ingress controller using Helm manually
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
```

```
helm install nginx-ing ingress-nginx/ingress-nginx -n ingress --create-namespace -f nginx-controller.yaml
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
-   type: LoadBalancer



## Create ingress for app (change config in ghost-demo-ingress.yaml for your cluster)

```
kubectl apply -f ghost-demo-ingress.yaml
```
