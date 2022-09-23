#https://cloud.yandex.com/en/docs/managed-kubernetes/tutorials/ingress-cert-manager
#Install certificate manager v. 1.6.1 configured to issue Let's Encrypt® certificates (check for the latest version on the project page):
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.6.1/cert-manager.yaml

#Make sure that the cert-manager namespace has three pods, all of them being 1/1 ready and with the Running status:
kubectl get pods -n cert-manager

