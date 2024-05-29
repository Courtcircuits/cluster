############
# Services #
############

kubectl create namespace argocd
kubectl create namespace harbor
kubectl create namespace cert-manager
kubectl create namespace services


############
# Projects #
############

kubectl create namespace hackthecrous
kubectl create namespace hugo
kubectl create namespace ratathune

#######
# CRD #
#######

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.14.5/cert-manager.crds.yaml