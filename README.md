## Services - Ingress Nginx

This repo bootstraps an ingress-nginx controller deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## How to get started

1. Clone this repo
2. Select the configuration to install.
```
sh 00-install-ingress-nginx.sh

# or

sh 00-install-ingress-nginx-without-a-load-balancer.sh
# and open firewall port 80 and 443 on the nodes.
```
3. Install aplicattions for testing
```
kubectl apply -f 02-deployment-hello-v1.yaml
kubectl apply -f 02-deployment-hello-v2.yaml
```
4. Create a Ingress resource
```
kubectl apply -f 03-ingress-example.yaml
```
5. Test the Ingress resource
```
$ curl http://IP_ADDRESS/v1
Hello, world!
Version: 1.0.0
Hostname: hello-v1-dc7b59fb4-hm9js

$ curl http://IP_ADDRESS/v2
Hello, world!
Version: 2.0.0
Hostname: hello-v2-59cc6d787c-bsxh7
```
6. Install the letsencrypt cert-manager
```
sh 04-install-cert-manager.sh
```
7. Setting up an email address for the letsencrypt cert-manager in the 05-cluster-issuer.yaml file.
```
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt
  namespace: cert-manager
spec:
  acme:
    server: https://acme-v02.api.letsencrypt.org/directory
    email: <your-email>
    privateKeySecretRef:
      name: letsencrypt
    solvers:
    - http01:
        ingress:
          class: nginx
```
8. Create a ClusterIssuer resource
```
kubectl apply -f 05-cluster-issuer.yaml
```
9. Setting up a domain name for the letsencrypt cert-manager in the 06-app-example.yaml file.
10. Setting the ip node address in the A-record of the domain name.
11. Create a application for testing
```
kubectl apply -f 06-app-example.yaml
```
12. After a few seconds, test the application.
```
$ curl https://your-domain-name
Welcome to nginx! ...
```


## Resources and dependencies

| Name           | Version | Required |
|----------------|---------|----------|
| kubernetes     | 1.23    | no       |






