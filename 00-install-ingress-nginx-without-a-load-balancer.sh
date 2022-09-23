helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx -f without-a-load-balancer.yaml
#helm uninstall ingress-nginx -n ingress-nginx
