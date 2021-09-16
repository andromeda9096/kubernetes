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

##### If using GKE private cluster we need create services account firt:
```
GCP_PROJECT=$(gcloud config get-value project)
```

```
gcloud iam service-accounts create cluster-admin \
--display-name=cluster-admin \
--project=${GCP_PROJECT}
```

```
gcloud iam service-accounts keys create ./gcp-cluster-admin.json \
--iam-account=cluster-admin@${GCP_PROJECT}.iam.gserviceaccount.com \
--project=${GCP_PROJECT}
```

```
gcloud projects add-iam-policy-binding ${GCP_PROJECT} \
--member=serviceAccount:cluster-admin@${GCP_PROJECT}.iam.gserviceaccount.com \
--role=roles/editor
```
```
kubectl create secret generic cert-manager-credentials \
--from-file=./gcp-cluster-admin.json
```
- Open Firewall for Master node can connect Workers on port : TCP/all

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
