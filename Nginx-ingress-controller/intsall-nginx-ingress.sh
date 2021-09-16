git clone https://github.com/andromeda9096/Kubernetes.git \
&& cd ./kubernetes/Nginx-ingress-controller \
&& helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx \
&& helm repo update && kubectl create ns nginx-ingress \
&& helm install my-nginx-controller -n nginx-ingress ingress-nginx/ingress-nginx -f nginx-controller.yaml
