## Official Page
https://cert-manager.io/docs/installation/helm/

## 1-Install Cert-manager using Helm
```
helm repo add jetstack https://charts.jetstack.io
helm repo update
```

```
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version 1.5.3 \
  --set installCRDs=true
```
## 2-Create ClusterIssuer
- replace with your Email in file production-issuer.yaml
```
kubectl apply -f production-issuer.yaml
```

## 3-Check workload
- Cert-manager POD
```
kubectl get pods --namespace cert-manager
```

- Check Issuer,certificate,..
```
kubectl get clusterissuer
```
```
kubectl get ingress
```
```
kubectl get certificate
```
```
kubectl describe ingress
```
```
kubectl describe clusterissuer letsencrypt-prod
```
```
kubectl describe certificate -n name
```
