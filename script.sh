kubectl config use-context rancher-desktop
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo update
kubectl create namespace cattle-system
helm repo add jetstack https://charts.jetstack.io
helm repo update

helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.8.2 --set installCRDs="true"

helm install rancher ./rancher-2.8.5.tgz --namespace cattle-system --set hostname=rancher.local --set bootstrapPassword=admin

#helm install rancher rancher-latest/rancher --namespace cattle-system --set hostname=rancher.local --set bootstrapPassword=admin

