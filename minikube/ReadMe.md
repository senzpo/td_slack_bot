# Local K8s setup based on Minikube

## Minikube

Minikube allows to create K8s cluster for dev usage on localhost

### Installation && setup

[Installation guide](https://minikube.sigs.k8s.io/docs/start/)

### Some recommended addons

```
minikube addons enable dashboard
minikube addons enable ingress
minikube addons enable ingress-dns
minikube addons enable registry
```

### Start a K8s cluster

```minikube start```

Dashboard web page:

```minikube dashboard```

### Prepare an app image for minikube

#### Build from the scratch

```minikube image build . -t td_slack_bot```

#### or copy a prepared one

```minikube image load <image name>```

## Deployment

Apply all of necessary manifests together with [kustomization.yaml](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/)

```kubectl apply -k minikube```

or one by one

```
kubectl apply -f minikube/postgres-config.yaml
kubectl apply -f minikube/app.yaml
...
```

The result will be on the **td-slack-bot** namespace:

```kubectl get all -n td-slack-bot```

Access to service:

```minikube service td-slack-bot-service -n td-slack-bot```

Run tunnel to makes ingress available on localhost

```minikube tunnel```

## CleanUp

### Delete deployment:

```kubectl delete -k minikube```

## Delete the whole cluster

```minikube delete --all```

