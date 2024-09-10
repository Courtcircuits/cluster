# 101 Cluster deployment for K8S

## Security tips

- Create a custom user for harbor AND add github connection for argocd

## Run the build :

1. Install k3s (or any other kubernetes bare metal distro) :

```bash
curl -sfL https://get.k3s.io | sh -
```

Then get the kubeconfig file and set it as KUBECONFIG env variable.

2. Create namespaces:

```bash
./namespaces/namespaces.sh
```

3. Install helm services :

```bash
cd services
# you might need to install argocd repo and bitnami repo
helm dependency build
helm install services --values ./values.yaml . --namespace services
cd ..
```

4. Install argocd appofapps :

```bash
kubectl apply -f ./app-of-apps/project.yaml
kubectl apply -f ./app-of-apps/projects.yaml
```

